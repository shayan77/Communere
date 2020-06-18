//
//  AppDelegate.swift
//  Communere
//
//  Created by Shayan Mehranpoor on 6/18/20.
//  Copyright © 2020 exonvision. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: MainCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupCoordinator()
        
        setupIQKeyboardManager()
        
        User.mockUsers()
                        
        return true
    }

    fileprivate func setupCoordinator() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navController = UINavigationController()
        
        appCoordinator = MainCoordinator(navigationController: navController, window: window)
        appCoordinator.start()
    }
    
    fileprivate func setupIQKeyboardManager() {
        IQKeyboardManager.shared.enable = true
    }
}

