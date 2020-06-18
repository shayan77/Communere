//
//  StoryboardNames.swift
//  Communere
//
//  Created by Shayan Mehranpoor on 6/18/20.
//  Copyright © 2020 exonvision. All rights reserved.
//

import UIKit

enum Storyboard {
        
    case login
    case verifyAccount
    
    var storyboard: UIStoryboard {
        
        var storyboardName: String!
        
        switch self {
        case .login:
            storyboardName = "Login"
        case .verifyAccount:
            storyboardName = "VerifyAccount"
        }
        
        return UIStoryboard(name: storyboardName, bundle: Bundle.main)
    }
}
