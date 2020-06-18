//
//  UserProfileVC.swift
//  Communere
//
//  Created by Shayan Mehranpoor on 6/18/20.
//  Copyright © 2020 exonvision. All rights reserved.
//

import UIKit

class UserProfileVC: UIViewController {
    
    // MARK: - Coordinator
    weak var userCoordinator: UserCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        print(UserDefaultsConfig.isAdmin)
        print(UserDefaultsConfig.isUserLoggedIn)
        print(User.users().count)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
