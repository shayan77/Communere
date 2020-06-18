//
//  UserCoordinator.swift
//  Communere
//
//  Created by Shayan Mehranpoor on 6/18/20.
//  Copyright © 2020 exonvision. All rights reserved.
//

import UIKit

class UserCoordinator: NSObject, Coordinator {
    
    var childCoordinators: [Coordinator]? = [Coordinator]()
    
    weak var parentCoordinator: MainCoordinator?
    
    var navigationCoordinator: UINavigationController

    init(navigationController: UINavigationController) {
        navigationController.setNavigationBarHidden(false, animated: false)
        self.navigationCoordinator = navigationController
        super.init()
    }

    func start() {
        let userProfileVC: UserProfileVC = UserProfileVC.instantiate(storyboard: .userProfile)
        userProfileVC.userCoordinator = self
        navigationCoordinator.pushViewController(userProfileVC, animated: true)
    }
    
//    func navigateToSignup() {
//        let signupVC: SignupVC = SignupVC.instantiate(storyboard: .signup)
//        signupVC.loginCoordinator = self
//        navigationCoordinator.pushViewController(signupVC, animated: true)
//    }
    
    deinit {
        print("REMOVED \(self) FROM MEMORY")
    }
}
