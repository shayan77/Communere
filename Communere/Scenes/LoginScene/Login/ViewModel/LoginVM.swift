//
//  LoginVM.swift
//  Communere
//
//  Created by Shayan Mehranpoor on 6/18/20.
//  Copyright © 2020 exonvision. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class LoginVM {
    
    enum LoginError {
        
        case blankField
        case invalidEmail
        case wrongInformation
        case unknown
        
        var errorValue: String {
            switch self {
            case .blankField:
                return "Please Fill inputs"
            case .invalidEmail:
                return "Email in invalid"
            case .wrongInformation:
                return "Please check the information"
            case .unknown:
                return ""
            }
        }
    }
    
    let successResponse: PublishSubject<Bool> = PublishSubject()
    let errorResponse: PublishSubject<LoginError> = PublishSubject()
    
    func loginUserWith(_ email: String, password: String) {
        
        if (email.isEmpty || password.isEmpty) {
            self.errorResponse.onNext(.blankField)
        } else if !isEmail(email: email) {
            self.errorResponse.onNext(.invalidEmail)
        } else if (email == "aaa@gmail.com") && (password == "AAAAA") {
            UserDefaultsConfig.isUserLoggedIn = true
            UserDefaultsConfig.isAdmin = true
            self.successResponse.onNext(true)
        } else {
            if User.checkIsUserExist(email: email) {
                UserDefaultsConfig.isUserLoggedIn = true
                UserDefaultsConfig.isAdmin = false
                self.successResponse.onNext(true)
            } else {
                self.errorResponse.onNext(.wrongInformation)
            }
        }
    }
    
    private func isEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
}
