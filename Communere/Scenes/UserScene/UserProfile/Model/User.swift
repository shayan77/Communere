//
//  User.swift
//  Communere
//
//  Created by Shayan Mehranpoor on 6/18/20.
//  Copyright © 2020 exonvision. All rights reserved.
//

import Foundation

class User: NSObject, NSCoding {
    
    var id: Int? = 0
    var name: String? = ""
    var email: String? = ""
    
    init(id: Int, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }

    required init(coder decoder: NSCoder) {
        self.id = decoder.decodeObject(forKey: "id") as? Int
        self.name = decoder.decodeObject(forKey: "name") as? String
        self.email = decoder.decodeObject(forKey: "email") as? String
    }

    func encode(with coder: NSCoder) {
        coder.encode(id, forKey: "id")
        coder.encode(name, forKey: "name")
        coder.encode(email, forKey: "email")
    }
    
    static func setCurrentUser(user: User) {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: user)
        UserDefaults.standard.set(encodedData, forKey: "user")
        UserDefaults.standard.synchronize()
    }
    
    static func currentUser() -> User {
        let defaults = UserDefaults.standard
        let data = defaults.object(forKey: "user") as! Data
        return NSKeyedUnarchiver.unarchiveObject(with: data) as! User
        UserDefaults.standard.synchronize()
    }
    
    static func storeArray(array: [User]) {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: array)
        UserDefaults.standard.set(encodedData, forKey: "users")
        UserDefaults.standard.synchronize()
    }
    
    static func users() -> [User] {
        let defaults = UserDefaults.standard
        if let data = defaults.object(forKey: "users") as? Data {
            return NSKeyedUnarchiver.unarchiveObject(with: data) as? [User] ?? []
        } else {
            return []
        }
    }
    
    static func insertUser(user: User) {
        var archivedUsers = users()
        let index = archivedUsers.firstIndex(where: {$0.id == user.id})
        if index != nil {
            archivedUsers[index ?? 0] = user
        } else {
            archivedUsers.append(user)
        }
        storeArray(array: archivedUsers)
    }
    
    static func removeUser(user: User) {
        var archivedUsers = users()
        archivedUsers.removeAll(where: {
            $0.id == user.id
        })
        storeArray(array: archivedUsers)
    }
    
    static func removeAllUsers() {
        var archivedUsers = users()
        archivedUsers.removeAll()
        storeArray(array: archivedUsers)
    }
    
    static func checkIsUserExist(email: String) -> Bool {
        if users().contains(where: { $0.email == email }) {
            let index = users().firstIndex(where: {$0.email == email})
            setCurrentUser(user: users()[index!])
            return true
        } else {
            return false
        }
    }
    
    static func mockUsers() {
        for index in 0...10 {
            User.insertUser(user: User(id: index, name: "user test \(index)", email: "email\(index)@gmail.com"))
        }
    }
}
