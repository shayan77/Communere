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
        self.mobile         = UserDefaultsConfig.userMobile
    }
    
    var isUserLoggedIn: Bool! {
        didSet {
            UserDefaultsConfig.isUserLoggedIn = isUserLoggedIn
        }
    }
    
    var mobile: String! {
        didSet {
            UserDefaultsConfig.userMobile = mobile
        }
    }
}
