//
//  LoginVC.swift
//  SafeApp
//
//  Created by Lucas Neves dos santos pompeu on 18/09/23.
//

import UIKit

class LoginVC: UIViewController {
    
    var screen: LoginScreen?
    var viewModel: LoginViewModel? = LoginViewModel()
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.configTextFieldsDelegate(delegate: self)
        viewModel?.delegate(delegate: self)
    }

}

extension LoginVC: LoginScreenDelegate {
    func tappedLoginButton() {
        viewModel?.loginUser(email: screen?.emailTextField.text ?? "", password: screen?.passwordTextField.text ?? "")
        print(#function)
    }
    
    func tappedSignUpButton() {
        print(#function)
        let vc = RegisterVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
}

extension LoginVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        viewModel?.textFieldLayout(textField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension LoginVC: LoginViewModelDelegate {
    func loginSucess() {
        let vc: VCTeste = VCTeste()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        print("login com sucesso")
    }
    
    func loginError(errorMessage: String) {
        AlertController(controller: self).getAlert(title: "Login Failed", message: errorMessage)
    }
    
    
}
