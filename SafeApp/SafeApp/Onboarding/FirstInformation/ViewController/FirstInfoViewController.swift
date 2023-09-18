//
//  ApresentationViewController.swift
//  SafeApp
//
//  Created by Lucas Neves dos santos pompeu on 18/09/23.
//

import UIKit

class FirstInfoViewController: UIViewController {
    
    var screen: FirstInfoScreen?
    
    override func loadView() {
        screen = FirstInfoScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }
}

extension FirstInfoViewController: FirstInfoDelegate {
    func tappedContinueButton() {
        let vc: SecondInfoViewController = SecondInfoViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
}
