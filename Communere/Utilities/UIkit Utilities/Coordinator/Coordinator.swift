//
//  Coordinator.swift
//  Communere
//
//  Created by Shayan Mehranpoor on 6/18/20.
//  Copyright © 2020 exonvision. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator]? { get set }
    var navigationCoordinator: UINavigationController { get set }
    func start()
}

extension Coordinator {
    func popViewController() {
        navigationCoordinator.popViewController(animated: true)
    }
    
    func popToRootViewController() {
        navigationCoordinator.popToRootViewController(animated: true)
    }
}
