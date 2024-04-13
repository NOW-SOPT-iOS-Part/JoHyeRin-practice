//
//  LoginViewController_Closure.swift
//  34th-Sopt-Seminar
//
//  Created by 조혜린 on 4/6/24.
//

import UIKit
import SnapKit

class LoginViewController_Closure: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요"
        label.textColor = .black
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디를 입력해주세요."
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        //모서리 곡률 추가
        textField.layer.cornerRadius = 3
        //텍스트 내용 전체 삭제 버튼
        textField.clearButtonMode = .always
        //입력란 왼쪽에 여백 추가
        textField.addPadding(left: 15)
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        //모서리 곡률 추가
        textField.layer.cornerRadius = 3
        //텍스트 내용 전체 삭제 버튼
        textField.clearButtonMode = .always
        //입력란 왼쪽에 여백 추가
        textField.addPadding(left: 15)
        
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        //모서리 곡률 추가
        button.layer.cornerRadius = 6
        //초기에 버튼 비활성화
        button.isEnabled = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        self.view.backgroundColor = .white
        self.view.addSubviews(titleLabel,
                              idTextField,
                              passwordTextField,
                              loginButton)
        
//        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 161),
//                                     titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 69),
//                                     titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -70)])
//        
//        NSLayoutConstraint.activate([idTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 71),
//                                     idTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 49),
//                                     idTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
//                                     idTextField.heightAnchor.constraint(equalToConstant: 52)])
//        
//        NSLayoutConstraint.activate([passwordTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 130),
//                                     passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 49),
//                                     passwordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
//                                     passwordTextField.heightAnchor.constraint(equalToConstant: 52)])
//        
//        NSLayoutConstraint.activate([loginButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 217),
//                                     loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 49),
//                                     loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
//                                     loginButton.heightAnchor.constraint(equalToConstant: 58)])
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(161)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(71)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(130)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(217)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(58)
        }
        
        
    }
    
    @objc func loginButtonTapped() {
        presentToWelcomeVC()
//        pushToWelcomeVC()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
           // 텍스트 필드의 내용이 변경될 때마다 호출되는 함수
           if let text = textField.text, !text.isEmpty {
               // 텍스트 필드가 비어 있지 않으면 버튼 활성화
               loginButton.isEnabled = true
               loginButton.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
           } else {
               // 텍스트 필드가 비어 있으면 버튼 비활성화
               loginButton.isEnabled = false
               loginButton.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
           }
       }
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Closure()
        welcomeViewController.completionHandler = { [weak self] id in
            guard let self else { return }
            if let id {
                self.idTextField.text = "\(id)에서 어떤걸로 할꺼얌?"
            }
        }
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.id = idTextField.text
        self.present(welcomeViewController, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Closure()
        welcomeViewController.completionHandler = { [weak self] id in
            guard let self else { return }
            if let id {
                self.idTextField.text = "\(id)에서 어떤걸로 할꺼얌?"
            }
        }
        welcomeViewController.id = idTextField.text
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}
