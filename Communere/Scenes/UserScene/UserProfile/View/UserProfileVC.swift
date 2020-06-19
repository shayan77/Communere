//
//  UserProfileVC.swift
//  Communere
//
//  Created by Shayan Mehranpoor on 6/18/20.
//  Copyright © 2020 exonvision. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class UserProfileVC: UIViewController {
    
    // MARK: - Coordinator
    weak var userCoordinator: UserCoordinator?
    
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var emailView: CustomTextField!
    @IBOutlet var nameView: CustomTextField!
    @IBOutlet var deleteBtn: UIButton!
    @IBOutlet var updateBtn: UIButton!
    @IBOutlet var messageLbl: UILabel!
    
    let disposeBag = DisposeBag()
    
    let userProfileVM = UserProfileVM()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupBindings()
        setupResponseBinding()
    }
    
    // MARK: - Func
    private func setupView() {
    
        // nameLbl
        nameLbl.text = User.currentUser().name ?? ""
        
        // emailView
        emailView.inputType = .email
        emailView.inputTF.text = User.currentUser().email ?? ""
        
        // passwordView
        nameView.inputType = .name
        nameView.inputTF.text = User.currentUser().name ?? ""
    }
    
    private func setupBindings() {
        
        // MARK: - Action
        updateBtn.rx.tap
            .throttle(RxTimeInterval.milliseconds(100), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.userProfileVM.updateUserWith(self.emailView.inputTF.text ?? "", name: self.nameView.inputTF.text ?? "")
            }).disposed(by: disposeBag)
        
        deleteBtn.rx.tap
            .throttle(RxTimeInterval.milliseconds(100), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.userProfileVM.deleteUserWith(User.currentUser())
            }).disposed(by: disposeBag)
    }
    
    // MARK: - Setup ResponseBinding
    func setupResponseBinding() {
        
        userProfileVM.errorResponse
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (errorMessage) in
                guard let self = self else { return }
                switch errorMessage {
                case .blankField:
                    self.showError(label: self.messageLbl, error: errorMessage.errorValue)
                case .invalidEmail:
                    self.showError(label: self.messageLbl, error: errorMessage.errorValue)
                case .unknown:
                    break
                }
            }).disposed(by: disposeBag)
        
        userProfileVM.successResponse
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.showError(label: self.messageLbl, error: "The User information has been update")
            }).disposed(by: disposeBag)
        
        userProfileVM.successResponseOnDelete
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.userCoordinator?.goToLogiPage()
            }).disposed(by: disposeBag)
    }
}
