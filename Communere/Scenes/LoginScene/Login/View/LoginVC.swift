//
//  LoginVC.swift
//  Communere
//
//  Created by Shayan Mehranpoor on 6/18/20.
//  Copyright © 2020 exonvision. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    // MARK: - Coordinator
    weak var loginCoordinator: LoginCoordinator?
    
    // MARK: - Outlet
    @IBOutlet var emailView: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    // MARK: - Func
    private func setupView() {
    
        // emailView
        emailView.inputType = .email
    }
}
