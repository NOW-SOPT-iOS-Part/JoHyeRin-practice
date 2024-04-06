//
//  LoginViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 조혜린 on 3/30/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요"
        label.textColor = .black
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
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
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
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
        let button = UIButton(frame: CGRect(x: 21, y: 422, width: 332, height: 58))
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
        
        self.view.backgroundColor = .white
        self.view.addSubviews(titleLabel,
                              idTextField,
                              passwordTextField,
                              loginButton)
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
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.id = idTextField.text
        self.present(welcomeViewController, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.id = idTextField.text
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}
