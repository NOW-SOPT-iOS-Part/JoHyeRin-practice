//
//  LoginViewController_LiveCodingTemplate.swift
//  34th-Sopt-Seminar
//
//  Created by 조혜린 on 5/25/24.
//

import UIKit

import SnapKit
import RxSwift

final class LoginViewController_LiveCoding: UIViewController {
    
    private let rootView = LoginView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        bindViewModel()
    }
    
    
    private func bindViewModel() {
        let input = LoginViewModel_Rx.Input(
            idTextFieldDidChangeEvent: rootView.idTextField.rx.text.asObservable(),
            passwordTextFieldDidChangeEvent: rootView.passwordTextField.rx.text.asObservable(),
            loginButtonDidTapEvent: rootView.loginButton.rx.tap.asObservable()
        )
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    func showToast(_ message: String,
                   bottomInset: CGFloat = 86
    ) {
        guard let view else { return }
        Toast().show(message: message,
                     view: view,
                     bottomInset: bottomInset
        )
    }
}

