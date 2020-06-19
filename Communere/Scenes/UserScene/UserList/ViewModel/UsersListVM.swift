//
//  UsersListVM.swift
//  Communere
//
//  Created by Shayan Mehranpoor on 6/19/20.
//  Copyright © 2020 exonvision. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class UsersListVM {
    
    let successResponseOnDelete: PublishSubject<IndexPath> = PublishSubject()
    
    func deleteUserWith(_ user: User, index: IndexPath) {
        User.removeUser(user: user)
        self.successResponseOnDelete.onNext(index)
    }
}
