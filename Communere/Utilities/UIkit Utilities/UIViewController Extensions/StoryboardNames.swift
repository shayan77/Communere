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
    case signup
    
    case userProfile
    
    var storyboard: UIStoryboard {
        
        var storyboardName: String!
        
        switch self {
        case .login:
            storyboardName = "Login"
        case .signup:
            storyboardName = "Signup"
            
        case .userProfile:
            storyboardName = "UserProfile"
        }
        
        return UIStoryboard(name: storyboardName, bundle: Bundle.main)
    }
}
