//
//  CustomTextField.swift
//  Communere
//
//  Created by Shayan Mehranpoor on 6/18/20.
//  Copyright © 2020 exonvision. All rights reserved.
//

import UIKit

class CustomTextField: UIView, ViewConnectable {
    
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var inputTF: UITextField!
    
    var inputType: InputType = .email {
        didSet {
            switch inputType {
            case .email:
                emailTF()
            case .name:
                nameTF()
            case .password:
                passwordTF()
            case .confirmPasswrod:
                confirmPasswordTF()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        setupView()
        inputTF.autocorrectionType = .no
        inputTF.autocapitalizationType = .none
        inputTF.backgroundColor = .clear
        inputTF.delegate = self
    }
    
    private func passwordTF() {
        inputTF.isSecureTextEntry = true
        titleLbl.text = "Password"
    }
    
    private func confirmPasswordTF() {
        inputTF.isSecureTextEntry = true
        titleLbl.text = "Confirm Password"
    }
    
    private func emailTF() {
        inputTF.keyboardType = .emailAddress
        titleLbl.text = "Email"
    }
    
    private func nameTF() {
        titleLbl.text = "Full Name"
    }
    
    private func isEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: inputTF.text ?? "")
    }
}

extension CustomTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength < 25
    }
}
