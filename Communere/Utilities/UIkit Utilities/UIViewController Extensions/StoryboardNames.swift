//
//  StoryboardNames.swift
//  Communere
//
//  Created by Shayan Mehranpoor on 6/18/20.
//  Copyright © 2020 exonvision. All rights reserved.
//

import UIKit

enum Storyboard {
    
    case splash
    
    case register
    case verifyAccount
    
    case simcardMainPage
    case simcardList
    case simcardFilter
    case simcardOrder
    
    case simcardCart
    case inputInformation
    case popPayment
    case finalPayment
    
    case place
    
    case simcardHistory
    
    case advancedSearch
    
    case home
    case profile
    case STRTabBarViewController
    
    case internetMainPage
    case popInternetHistory
    case internetType
    case internetList
    case internetCompareList
    case internetPayment
    
    case chargeMainPage
    case popupIdealAmount
    case chargePayment
    
    case webView
    
    case checkPasscode
    case walletMainPge
    
    case deactivatePasscode
    case forgetPasscode
    
    case newPasscode
    case repetitionPasscode
    case virfyCodeInPasscode
    
    case popupMoneyRequest
    
    var storyboard: UIStoryboard {
        
        var storyboardName: String!
        
        switch self {
        case .splash:
            storyboardName = "Splash"
        case .register:
            storyboardName = "Register"
        case .verifyAccount:
            storyboardName = "VerifyAccount"
            
        case .simcardMainPage:
            storyboardName = "SimcardMainPage"
        case .simcardList:
            storyboardName = "SimcardList"
        case .simcardFilter:
            storyboardName = "SimcardFilter"
        case .simcardOrder:
            storyboardName = "SimcardOrder"
            
        case .inputInformation:
            storyboardName = "InputInformation"
        case .simcardCart:
            storyboardName = "SimcardCart"
        case .popPayment:
            storyboardName = "PopPayment"
        case .finalPayment:
            storyboardName = "FinalPayment"
            
        case .place:
            storyboardName = "Place"
            
        case .simcardHistory:
            storyboardName = "SimcardHistory"
            
        case .advancedSearch:
            storyboardName = "AdvancedSearch"
        case .home:
            storyboardName = "Home"
        case .profile:
            storyboardName = "Profile"
            
        case .STRTabBarViewController:
            storyboardName = "STRTabBarViewController"
            
        case .internetMainPage:
            storyboardName = "InternetMainPage"
        case .popInternetHistory:
            storyboardName = "PopInternetHistory"
        case .internetType:
            storyboardName = "InternetType"
        case .internetList:
            storyboardName = "InternetList"
        case .internetCompareList:
            storyboardName = "InternetCompareList"
        case .internetPayment:
            storyboardName = "InternetPayment"
            
        case .webView:
            storyboardName = "STRWebView"
            
        case .chargeMainPage:
            storyboardName = "ChargeMainPage"
        case .popupIdealAmount:
            storyboardName = "PopupIdealAmount"
        case .chargePayment:
            storyboardName = "ChargePayment"
            
        case .checkPasscode:
            storyboardName = "CheckPasscode"
            
        case .walletMainPge:
            storyboardName = "WalletMainPge"
            
        case .deactivatePasscode:
            storyboardName = "DeactivatePasscode"
        case .forgetPasscode:
            storyboardName = "ForgetPasscode"
            
        case .newPasscode:
            storyboardName = "NewPasscode"
        case .repetitionPasscode:
            storyboardName = "RepetitionPasscode"
        case .virfyCodeInPasscode:
            storyboardName = "VirfyCodeInPasscode"
            
        case .popupMoneyRequest:
            storyboardName = "PopupMoneyRequest"
            
        }
        return UIStoryboard(name: storyboardName, bundle: Bundle.main)
    }
}
