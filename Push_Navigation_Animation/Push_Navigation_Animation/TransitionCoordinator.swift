//
//  TransitionCoordinator.swift
//  Push_Navigation_Animation
//
//  Created by Cuong  Pham on 4/7/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class TransitionCoordinator: NSObject, UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CircularTransition()
    }
}
