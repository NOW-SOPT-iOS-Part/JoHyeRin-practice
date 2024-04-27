//
//  LoginViewController_SnapKit.swift
//  34th-Sopt-Seminar
//
//  Created by 조혜린 on 4/20/24.
//

import UIKit
import SnapKit

final class LoginViewController_SnapKit: UIViewController {
    private let rootView = LoginView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
    }
    
    
//    @objc
//    private func loginButtonDidTap() {
//        pushToWelcomeVC()
//    }
//    
//    private func pushToWelcomeVC() {
//        let welcomeViewController = WelcomeViewController()
//        welcomeViewController.id = idTextField.text
//        self.navigationController?.pushViewController(welcomeViewController, animated: true)
//    }
}

