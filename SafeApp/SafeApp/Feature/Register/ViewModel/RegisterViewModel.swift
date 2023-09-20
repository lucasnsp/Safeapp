//
//  RegisterViewModel.swift
//  SafeApp
//
//  Created by Lucas Neves dos santos pompeu on 18/09/23.
//

import UIKit
import Firebase

protocol RegisterViewModelDelegate: AnyObject {
    func registerSucess()
    func errorRegister(errorMessage: String)
}

class RegisterViewModel {
    
    private var registerScreenData: RegisterScreen?
    private var auth = Auth.auth()
    private weak var delegate: RegisterViewModelDelegate?
    
    public func delegate(delegate: RegisterViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func registerUser(email: String, password: String) {
        auth.createUser(withEmail: email, password: password, completion: { authResult, error in
            if error != nil {
                self.delegate?.errorRegister(errorMessage: error?.localizedDescription ?? "")
            } else {
                self.delegate?.registerSucess()
            }
        })
    }
    
    public func textFieldLayout(_ textField: UITextField) {
        if textField.text?.isEmpty ?? false {
            textField.layer.borderWidth = 1.5
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            switch textField {
            case registerScreenData?.emailTextField:
                if (registerScreenData?.emailTextField.text ?? "").isValid(validType: .email) {
                    registerScreenData?.emailTextField.layer.borderWidth = 1.5
                    registerScreenData?.emailTextField.layer.borderColor = UIColor.darkGray.cgColor
                } else {
                    registerScreenData?.emailTextField.layer.borderWidth = 1.5
                    registerScreenData?.emailTextField.layer.borderColor = UIColor.red.cgColor
                }
                
            case registerScreenData?.passwordTextField:
                if (registerScreenData?.passwordTextField.text ?? "").isValid(validType: .password) {
                    registerScreenData?.passwordTextField.layer.borderWidth = 1.5
                    registerScreenData?.passwordTextField.layer.borderColor = UIColor.darkGray.cgColor
                } else {
                    registerScreenData?.passwordTextField.layer.borderWidth = 1.5
                    registerScreenData?.passwordTextField.layer.borderColor = UIColor.red.cgColor
                }
            default:
                break
            }
        }
    }
}
