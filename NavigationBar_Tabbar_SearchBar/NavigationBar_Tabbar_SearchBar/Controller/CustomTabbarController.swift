//
//  ViewController.swift
//  NavigationBar_Tabbar_SearchBar
//
//  Created by Cuong  Pham on 4/9/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class CustomTabbarController: UIViewController {

    @IBOutlet weak var mainContainerView: UIView!
    @IBOutlet var tabbarButton: [UIButton]!
    var viewControllers : [UIViewController]!
    var selectedIndex : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let contactVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "contact")
        let historyVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "history")
        let settingVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "setting")
        let contactNavi = UINavigationController(rootViewController: contactVC)
        let historyNavi = UINavigationController(rootViewController: historyVC)
        let settingNavi = UINavigationController(rootViewController: settingVC)
        
        viewControllers = [historyNavi, contactNavi, settingNavi]
        
        tabbarButton[selectedIndex].isSelected = true
        onTapTabbar(self.tabbarButton[selectedIndex])
    }

    @IBAction func onTapTabbar(_ sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        tabbarButton[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        sender.isSelected = true
        let vc = viewControllers[selectedIndex]
        self.addChild(vc)
        vc.view.frame = mainContainerView.bounds
        mainContainerView.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
}

extension NSObject {
    class var className : String {
        return String(describing: self)
    }
}
