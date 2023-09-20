//
//  LoginViewModel.swift
//  SafeApp
//
//  Created by Lucas Neves dos santos pompeu on 18/09/23.
//


import UIKit
import Firebase

protocol LoginViewModelDelegate: AnyObject {
    func loginSucess()
    func loginError(errorMessage: String)
}

class LoginViewModel {
    
    private var loginScreenData: LoginScreen?
    private var auth = Auth.auth()
    private weak var delegate: LoginViewModelDelegate?
    
    public func delegate(delegate: LoginViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func loginUser(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if error != nil {
                self.delegate?.loginError(errorMessage: error?.localizedDescription ?? "")
            } else {
                self.delegate?.loginSucess()
            }
        }
    }
    
    public func textFieldLayout(_ textField: UITextField) {
        if textField.text?.isEmpty ?? false {
            textField.layer.borderWidth = 1.5
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            switch textField {
            case loginScreenData?.emailTextField:
                if (loginScreenData?.emailTextField.text ?? "").isValid(validType: .email) {
                    loginScreenData?.emailTextField.layer.borderWidth = 1.5
                    loginScreenData?.emailTextField.layer.borderColor = UIColor.darkGray.cgColor
                } else {
                    loginScreenData?.emailTextField.layer.borderWidth = 1.5
                    loginScreenData?.emailTextField.layer.borderColor = UIColor.red.cgColor
                }
                
            case loginScreenData?.passwordTextField:
                if (loginScreenData?.passwordTextField.text ?? "").isValid(validType: .password) {
                    loginScreenData?.passwordTextField.layer.borderWidth = 1.5
                    loginScreenData?.passwordTextField.layer.borderColor = UIColor.darkGray.cgColor
                } else {
                    loginScreenData?.passwordTextField.layer.borderWidth = 1.5
                    loginScreenData?.passwordTextField.layer.borderColor = UIColor.red.cgColor
                }
            default:
                break
            }
        }
    }

}
