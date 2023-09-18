//
//  ThirdInformationViewController.swift
//  SafeApp
//
//  Created by Lucas Neves dos santos pompeu on 18/09/23.
//

import UIKit

class ThirdInfoViewController: UIViewController {
    
    var screen: ThirdInfoScreen?
    
    override func loadView() {
        screen = ThirdInfoScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }

}

extension ThirdInfoViewController: ThirdInfoDelegate {
    func tappedContinueButton() {
        let vc: LoginVC = LoginVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
}
