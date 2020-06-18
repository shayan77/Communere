//
//  LoginVC.swift
//  Communere
//
//  Created by Shayan Mehranpoor on 6/18/20.
//  Copyright © 2020 exonvision. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginVC: UIViewController {
    
    // MARK: - Coordinator
    weak var loginCoordinator: LoginCoordinator?
    
    // MARK: - Outlet
    @IBOutlet var emailView: CustomTextField!
    @IBOutlet var passwordView: CustomTextField!
    @IBOutlet var signupBtn: UIButton!
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var errorLbl: UILabel!
    
    let disposeBag = DisposeBag()
    
    let loginVM = LoginVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupBindings()
        setupResponseBinding()
    }
    
    private func showError(error: String) {
        self.errorLbl.text = error
        UIView.animate(withDuration: 0.6, animations: {
            self.errorLbl.alpha = 1.0
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            UIView.animate(withDuration: 0.6, animations: {
                self.errorLbl.alpha = 0.0
            })
        })
    }
    
    // MARK: - Func
    private func setupView() {
    
        // emailView
        emailView.inputType = .email
        
        // passwordView
        passwordView.inputType = .password
    }
    
    private func setupBindings() {
        
        // MARK: - Action
        loginBtn.rx.tap
            .throttle(RxTimeInterval.milliseconds(100), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.loginVM.loginUserWith(self.emailView.inputTF.text ?? "", password: self.passwordView.inputTF.text ?? "")
            }).disposed(by: disposeBag)
        
        signupBtn.rx.tap
            .throttle(RxTimeInterval.milliseconds(100), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.loginCoordinator?.navigateToSignup()
            }).disposed(by: disposeBag)
    }
    
    // MARK: - Setup ResponseBinding
    func setupResponseBinding() {
        
        loginVM.errorResponse
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (errorMessage) in
                guard let self = self else { return }
                switch errorMessage {
                case .blankField:
                    self.showError(error: errorMessage.errorValue)
                case .invalidEmail:
                    self.showError(error: errorMessage.errorValue)
                case .wrongInformation:
                    self.showError(error: errorMessage.errorValue)
                case .unknown:
                    break
                }
            }).disposed(by: disposeBag)
        
        loginVM.successResponse
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                print("OKKKKKKK")
            }).disposed(by: disposeBag)
    }
}
