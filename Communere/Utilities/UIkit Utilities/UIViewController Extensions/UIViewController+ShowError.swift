//
//  UIViewController+ShowError.swift
//  Communere
//
//  Created by Shayan Mehranpoor on 6/18/20.
//  Copyright © 2020 exonvision. All rights reserved.
//

import UIKit

extension UIViewController {
    func showError(label: UILabel, error: String) {
        label.text = error
        UIView.animate(withDuration: 0.6, animations: {
            label.alpha = 1.0
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            UIView.animate(withDuration: 0.6, animations: {
                label.alpha = 0.0
            })
        })
    }
}
