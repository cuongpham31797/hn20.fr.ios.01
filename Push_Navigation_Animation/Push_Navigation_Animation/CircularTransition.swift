//
//  CircularTransition.swift
//  Push_Navigation_Animation
//
//  Created by Cuong  Pham on 4/7/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

protocol CircleTransitionable {
  var triggerButton: UIButton { get }
  var mainView: UIView { get }
}

class CircularTransition: NSObject, UIViewControllerAnimatedTransitioning {
    weak var context: UIViewControllerContextTransitioning?
        func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
            return 0.5
        }
        
        func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
            guard let fromVC = transitionContext.viewController(forKey: .from) as? CircleTransitionable,
              let toVC = transitionContext.viewController(forKey: .to) as? CircleTransitionable,
              let snapshot = fromVC.mainView.snapshotView(afterScreenUpdates: false) else {
                transitionContext.completeTransition(false)
                return
            }
            let containerView = transitionContext.containerView
            let backgroundView = UIView()
            backgroundView.frame = toVC.mainView.frame
            backgroundView.backgroundColor = fromVC.mainView.backgroundColor
            containerView.addSubview(backgroundView)
            containerView.addSubview(snapshot)
            fromVC.mainView.removeFromSuperview()
            animateOldTextOffscreen(fromView: snapshot)
            containerView.addSubview(toVC.mainView)
            animate(toView: toVC.mainView, fromTriggerButton: fromVC.triggerButton)
            context = transitionContext
        }
        
        func animateOldTextOffscreen(fromView: UIView) {
          // 1
            UIView.animate(withDuration: 0.6,
                         delay: 0.0,
                         options: [.curveEaseIn],
                         animations: {
            // 2
            fromView.center = CGPoint(x: fromView.center.x - 1300,
                                      y: fromView.center.y + 1500)
            // 3
            fromView.transform = CGAffineTransform(scaleX: 5.0, y: 5.0)
          }, completion: nil)
        }
        
        func animate(toView: UIView, fromTriggerButton triggerButton: UIButton) {
            let rect = CGRect(x: triggerButton.frame.origin.x,
                              y: triggerButton.frame.origin.y,
                              width: triggerButton.frame.width,
                              height: triggerButton.frame.width)
            // 2
            let circleMaskPathInitial = UIBezierPath(ovalIn: rect)
            
            let fullHeight = toView.bounds.height * 1.2
            let extremePoint = CGPoint(x: triggerButton.center.x,
                                       y: triggerButton.center.y - fullHeight)
            // 2
            let radius = sqrt((extremePoint.x*extremePoint.x) +
                              (extremePoint.y*extremePoint.y))
            // 3
            let circleMaskPathFinal = UIBezierPath(ovalIn: triggerButton.frame.insetBy(dx: -radius,
                                                                                       dy: -radius))
            
            let maskLayer = CAShapeLayer()
            maskLayer.path = circleMaskPathFinal.cgPath
            toView.layer.mask = maskLayer
            
            let maskLayerAnimation = CABasicAnimation(keyPath: "path")
            
            maskLayerAnimation.fromValue = circleMaskPathInitial.cgPath
            maskLayerAnimation.toValue = circleMaskPathFinal.cgPath
            
            maskLayerAnimation.duration = 0.4
            maskLayerAnimation.delegate = self
            maskLayer.add(maskLayerAnimation, forKey: "path")
            print(rect)
        }
    }

extension CircularTransition: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        context?.completeTransition(true)
    }
}
    
