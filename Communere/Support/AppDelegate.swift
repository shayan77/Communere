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
        
        // In this project we use coordinator to navigate between pages
        setupCoordinator()
        
        setupIQKeyboardManager()
        
        // Here we create some mock users for the first time we launch the app
        let userDefaults = UserDefaults.standard
        if !userDefaults.bool(forKey: "first-time") {
            User.mockUsers()
            userDefaults.set(true, forKey: "first-time")
            userDefaults.synchronize()
        }
                        
        return true
    }

    //
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

