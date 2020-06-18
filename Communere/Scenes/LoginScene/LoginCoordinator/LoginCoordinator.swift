//
//  LoginCoordinator.swift
//  Communere
//
//  Created by Shayan Mehranpoor on 6/18/20.
//  Copyright © 2020 exonvision. All rights reserved.
//

import UIKit

protocol LoginCoordinatorFinishDelegate: class {
    func onFinish(coordinator: Coordinator)
}

class LoginCoordinator: Coordinator {
    
    weak var parentCoordinator: MainCoordinator?
    
    weak var loginFinishDelegate: LoginCoordinatorFinishDelegate?
    
    var childCoordinators: [Coordinator]?
    
    var navigationCoordinator: UINavigationController

    init(navigationController: UINavigationController) {
        navigationController.setNavigationBarHidden(true, animated: false)
        self.navigationCoordinator = navigationController
    }

    func start() {
        let loginVC: LoginVC = LoginVC.instantiate(storyboard: .login)
        loginVC.loginCoordinator = self
        navigationCoordinator.pushViewController(loginVC, animated: true)
    }
    
//    func navigateToVerify() {
//        let verifyAccountVC: VerifyAccountVC = VerifyAccountVC.instantiate(storyboard: .verifyAccount)
//        verifyAccountVC.registerCoordinator = self
//        navigationCoordinator.pushViewController(verifyAccountVC, animated: true)
//    }
    
    func goToMainPage() {
        loginFinishDelegate?.onFinish(coordinator: self)
        parentCoordinator?.toHomeScene()
    }
    
    deinit {
        print("REMOVED \(self) FROM MEMORY")
    }
}
