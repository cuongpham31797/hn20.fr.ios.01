//
//  MainTabbarController.swift
//  Navigation_Tabbar_Basic_Advance
//
//  Created by Cuong  Pham on 4/6/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class MainTabbarController: UITabBarController {
    private var listScreen : [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabbar()
    }
}

extension MainTabbarController {
    private func setUpTabbar() {
        let viewController1 = UIViewController.loadVC(id: "Index")
        let navi1 = UINavigationController.setRootNavigation(vc: viewController1, title: "Index",
                                                             defaultImage: "0", selectedImage: "1", tintColor: .darkGray)
        let viewController2 = UIViewController.loadVC(id: "Info")
        let navi2 = UINavigationController.setRootNavigation(vc: viewController2, title: "Info",
                                                             defaultImage: "2", selectedImage: "3", tintColor: .darkGray)
        let viewController3 = UIViewController.loadVC(id: "Noti")
        let navi3 = UINavigationController.setRootNavigation(vc: viewController3, title: "Noti",
                                                             defaultImage: "4", selectedImage: "5", tintColor: .darkGray)
        
        let appearance = UITabBarAppearance()
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            NSAttributedString.Key.font : UIFont.init(name: "HelveticaNeue-Bold", size: 14) ?? "",
            NSAttributedString.Key.foregroundColor : UIColor.darkGray
        ]
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            NSAttributedString.Key.font : UIFont.init(name: "HelveticaNeue-Bold", size: 16) ?? "",
            NSAttributedString.Key.foregroundColor : UIColor.darkGray
        ]
        tabBar.standardAppearance = appearance
        
        listScreen.append(navi1)
        listScreen.append(navi2)
        listScreen.append(navi3)
        
        self.viewControllers = listScreen
    }
}

extension UIViewController {
    class func loadVC(id : String) -> UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: id)
    }
}

extension UINavigationController {
    class func setRootNavigation(vc : UIViewController, title : String, defaultImage : String, selectedImage : String, tintColor : UIColor) -> UINavigationController {
        let navi = UINavigationController(rootViewController: vc)
        navi.tabBarItem.title = title
        navi.tabBarItem.image = UIImage(named: defaultImage)
        navi.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        navi.tabBarItem.imageInsets = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        navi.tabBarController?.tabBar.tintColor = tintColor
        return navi
    }
}
