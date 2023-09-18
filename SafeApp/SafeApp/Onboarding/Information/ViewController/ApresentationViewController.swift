//
//  ApresentationViewController.swift
//  SafeApp
//
//  Created by Lucas Neves dos santos pompeu on 18/09/23.
//

import UIKit

class ApresentationViewController: UIViewController {
    
    var screen: ApresentationScreen?
    
    override func loadView() {
        screen = ApresentationScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
