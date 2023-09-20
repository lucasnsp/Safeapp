//
//  RegisterVC.swift
//  SafeApp
//
//  Created by Lucas Neves dos santos pompeu on 18/09/23.
//

import UIKit

class RegisterVC: UIViewController {
    
    var screen: RegisterScreen?
    var viewModel: RegisterViewModel? = RegisterViewModel()
    
    override func loadView() {
        screen = RegisterScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.configTextFieldsDelegate(delegate: self)
        viewModel?.delegate(delegate: self)
    }
}

extension RegisterVC: RegisterScreenDelegate {
    func tappedRegisterButton() {
        viewModel?.registerUser(email: screen?.emailTextField.text ?? "", password: screen?.emailTextField.text ?? "")
        print(#function)
    }
    
    func tappedLoginButton() {
        let vc: LoginVC = LoginVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

extension RegisterVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        viewModel?.textFieldLayout(textField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension RegisterVC: RegisterViewModelDelegate {
    func registerSucess() {
        print("Cadastro concluido")
    }
    
    func errorRegister(errorMessage: String) {
        AlertController(controller: self).getAlert(title: "Register failed", message: errorMessage)
    }
    
    
}
