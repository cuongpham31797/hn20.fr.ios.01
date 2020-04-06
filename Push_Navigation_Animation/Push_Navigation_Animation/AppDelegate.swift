//
//  AppDelegate.swift
//  Push_Navigation_Animation
//
//  Created by Cuong  Pham on 4/6/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let transitionCoordinator = TransitionCoordinator()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigation = UINavigationController(rootViewController: FirstController())
        navigation.delegate = transitionCoordinator
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        return true
    }
}

