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
        
        if UserDefaultsConfig.isUserLoggedIn {
            toHomeScene()
        } else {
            toHomeScene()
        }
    }
    
    func toLoginScene() {
        let child = LoginCoordinator(navigationController: navigationCoordinator)
        child.parentCoordinator = self
        child.loginFinishDelegate = self
        childCoordinators?.append(child)
        child.start()
    }
    
    func toHomeScene() {
        let child = UserCoordinator(navigationController: navigationCoordinator)
        child.parentCoordinator = self
        childCoordinators?.append(child)
        child.start()
    }
}

extension MainCoordinator: LoginCoordinatorFinishDelegate {
    func onFinish(coordinator: Coordinator) {
        navigationCoordinator.setViewControllers([], animated: false)
        childCoordinators = childCoordinators?.filter {$0 !== coordinator}
    }
}
