//
//  SecondInformationViewController.swift
//  SafeApp
//
//  Created by Lucas Neves dos santos pompeu on 18/09/23.
//

import UIKit

class SecondInfoViewController: UIViewController {
    
    var screen: SecondInfoScreen?
    
    override func loadView() {
        screen = SecondInfoScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }

}

extension SecondInfoViewController: SecondInfoDelegate {
    func tappedContinueButton() {
        let vc: ThirdInfoViewController = ThirdInfoViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
}
