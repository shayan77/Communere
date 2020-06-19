//
//  UserProfileVM.swift
//  Communere
//
//  Created by Shayan Mehranpoor on 6/19/20.
//  Copyright © 2020 exonvision. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class UserProfileVM {
    
    enum UserProfileError {
        
        case blankField
        case invalidEmail
        case unknown
        
        var errorValue: String {
            switch self {
            case .blankField:
                return "Please Fill inputs"
            case .invalidEmail:
                return "Email in invalid"
            case .unknown:
                return ""
            }
        }
    }
    
    let successResponse: PublishSubject<Bool> = PublishSubject()
    let errorResponse: PublishSubject<UserProfileError> = PublishSubject()
    
    func updateUserWith(_ email: String, name: String) {
        
        if (email.isEmpty || name.isEmpty) {
            self.errorResponse.onNext(.blankField)
        } else if !isEmail(email: email) {
            self.errorResponse.onNext(.invalidEmail)
        } else {
            User.insertUser(user: User(id: User.currentUser().id ?? 0, name: name, email: email))
            User.setCurrentUser(user: User(id: User.currentUser().id ?? 0, name: name, email: email))
            self.successResponse.onNext(true)
        }
    }
    
    
    let successResponseOnDelete: PublishSubject<Bool> = PublishSubject()
    
    func deleteUserWith(_ user: User) {
        UserDefaultsConfig.isAdmin = false
        UserDefaultsConfig.isUserLoggedIn = false
        User.removeUser(user: user)
        self.successResponseOnDelete.onNext(true)
    }
    
    private func isEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
}
