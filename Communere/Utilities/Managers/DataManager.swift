//
//  DataManager.swift
//  Communere
//
//  Created by Shayan Mehranpoor on 6/18/20.
//  Copyright © 2020 exonvision. All rights reserved.
//

import Foundation
import RxSwift

class DataManager {
    private let disposeBag = DisposeBag()
    
    static var shared: DataManager = DataManager()
    
    private init () {
        self.isUserLoggedIn = UserDefaultsConfig.isUserLoggedIn
        self.email          = UserDefaultsConfig.email
        self.name           = UserDefaultsConfig.name
    }
    
    var isUserLoggedIn: Bool! {
        didSet {
            UserDefaultsConfig.isUserLoggedIn = isUserLoggedIn
        }
    }
    
    var email: String! {
        didSet {
            UserDefaultsConfig.email = email
        }
    }
    
    var name: String! {
        didSet {
            UserDefaultsConfig.name = name
        }
    }
}
