//
//  LoginVC.swift
//  SafeApp
//
//  Created by Lucas Neves dos santos pompeu on 18/09/23.
//

import UIKit

class LoginVC: UIViewController {
    
    var screen: LoginScreen?
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }

}

extension LoginVC: LoginScreenDelegate {
    func tappedLoginButton() {
        print(#function)
    }
    
    func tappedSignUpButton() {
        print(#function)
        let vc = RegisterVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
    
    
}
