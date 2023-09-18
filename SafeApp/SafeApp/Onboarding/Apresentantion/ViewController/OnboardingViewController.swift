//
//  OnboardingViewController.swift
//  SafeApp
//
//  Created by Lucas Neves dos santos pompeu on 18/09/23.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    var screen: OnboardingScreen?
    
    override func loadView() {
        screen = OnboardingScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }

}

extension OnboardingViewController: OnboardingScreenDelegate {
    func tappedContinueButton() {
        let vc: ApresentationViewController = ApresentationViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
}
