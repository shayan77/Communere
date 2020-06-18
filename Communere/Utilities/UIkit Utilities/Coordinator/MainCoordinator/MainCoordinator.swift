//
//  MainCoordinator.swift
//  Communere
//
//  Created by Shayan Mehranpoor on 6/18/20.
//  Copyright © 2020 exonvision. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject {
    
    // MARK: - Properties
    let window: UIWindow?
    
    var childCoordinators: [Coordinator]? = [Coordinator]()
    var navigationCoordinator: UINavigationController
    
    init(navigationController: UINavigationController, window: UIWindow?) {
        self.navigationCoordinator = navigationController
        self.window = window
    }
    
    func start() {
        
        guard let window = window else { return }
        
        window.rootViewController = navigationCoordinator
        window.makeKeyAndVisible()
        
        if DataManager.shared.isUserLoggedIn {
            toHomeScene()
        } else {
            toLoginScene()
        }
    }
    
    func toLoginScene() {
//        navigationCoordinator.setViewControllers([], animated: false)
//        let child = RegisterCoordinator(navigationController: navigationCoordinator)
//        child.parentCoordinator = self
//        child.registerFinishDelegate = self
//        childCoordinators?.append(child)
//        child.start()
    }
    
    func toHomeScene() {

//        navigationCoordinator.setViewControllers([], animated: false)
//
//        buildTabBarScene()
//
//        window?.rootViewController = self.tabCoordinator
//        window?.makeKeyAndVisible()
    }
}

//extension MainCoordinator: RegisterCoordinatorFinishDelegate {
//    func onFinish(coordinator: Coordinator) {
//        navigationCoordinator.setViewControllers([], animated: false)
//        childCoordinators = childCoordinators?.filter {$0 !== coordinator}
//    }
//}
