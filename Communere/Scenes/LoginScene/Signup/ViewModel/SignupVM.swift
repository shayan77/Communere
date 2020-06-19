//
//  SignupVM.swift
//  Communere
//
//  Created by Shayan Mehranpoor on 6/18/20.
//  Copyright © 2020 exonvision. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SignupVM {
    
    enum SignupError {
        
        case blankField
        case invalidEmail
        case password
        case unknown
        
        var errorValue: String {
            switch self {
            case .blankField:
                return "Please Fill inputs"
            case .invalidEmail:
                return "Email in invalid"
            case .password:
                return "Confime password doesn't match password"
            case .unknown:
                return ""
            }
        }
    }
    
    let successResponse: PublishSubject<Bool> = PublishSubject()
    let errorResponse: PublishSubject<SignupError> = PublishSubject()
    
    func signupUserWith(_ name: String, email: String, password: String, confirmPassword: String) {
        
        if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
            self.errorResponse.onNext(.blankField)
        } else if !isEmail(email: email) {
            self.errorResponse.onNext(.invalidEmail)
        } else if (password != confirmPassword) {
            self.errorResponse.onNext(.password)
        } else {
            User.insertUser(user: User(id: User.users().count, name: name, email: email))
            UserDefaultsConfig.isUserLoggedIn = true
            UserDefaultsConfig.isAdmin = false
            User.setCurrentUser(user: User(id: User.users().count, name: name, email: email))
            self.successResponse.onNext(true)
        }
    }
    
    private func isEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
}
