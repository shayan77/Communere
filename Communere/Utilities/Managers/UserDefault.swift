//
//  UserDefault.swift
//  Communere
//
//  Created by Shayan Mehranpoor on 6/18/20.
//  Copyright © 2020 exonvision. All rights reserved.
//

import Foundation

enum UserDefaultsKeys: String {
    case isUserLoggedIn  = "isUserLoggedIn"
    case email           = "email"
    case name            = "name"
}

@propertyWrapper
struct UserDefault<T> {
    let key: UserDefaultsKeys
    let defaultValue: T

    init(_ key: UserDefaultsKeys, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key.rawValue) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key.rawValue)
        }
    }
}

struct UserDefaultsConfig {
    @UserDefault(.email, defaultValue: "")
    static var email: String
    
    @UserDefault(.name, defaultValue: "")
    static var name: String
    
    @UserDefault(.isUserLoggedIn, defaultValue: false)
    static var isUserLoggedIn: Bool
    
    static func clearUserDefaultfor(_ key: UserDefaultsKeys) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
}
