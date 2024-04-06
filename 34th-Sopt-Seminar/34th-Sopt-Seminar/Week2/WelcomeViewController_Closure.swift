//
//  WelcomeViewController_Closure.swift
//  34th-Sopt-Seminar
//
//  Created by 조혜린 on 4/6/24.
//

import UIKit
import SnapKit

class WelcomeViewController_Closure: UIViewController {
    
    typealias handler = ((String?) -> (Void))

    var completionHandler: handler?
    var id: String?
    
    private let welcomeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "welcomeImage")
        
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "당근 온도를 설정해보세요!"
        label.textColor = .black
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var temperatureSlider: UISlider = {
        let slider = UISlider()
        slider.minimumTrackTintColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        //최소 value 설정
        slider.minimumValue = 0
        //최대 value 설정
        slider.maximumValue = 100
        //디폴트 value 설정
        slider.value = 50
        slider.addTarget(self, action: #selector(sliderValueDidChange(_:)), for: .valueChanged)
        
        return slider
    }()
    
    private let temperatureValueLabel: UILabel = {
        let label = UILabel()
        label.text = "🥕50%🥕"
        label.textColor = .black
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var goMainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        //모서리 곡률 추가
        button.layer.cornerRadius = 6
        
        return button
    }()
    
    private lazy var backToLoginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(backToLoginButtonTapped), for: .touchUpInside)
        //모서리 곡률 추가
        button.layer.cornerRadius = 6
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        bindID()
    }
    
    private func setupLayout() {
        self.view.backgroundColor = .white
        self.view.addSubviews(welcomeImage,
                              welcomeLabel,
                              temperatureLabel,
                              temperatureSlider,
                              temperatureValueLabel,
                              goMainButton,
                              backToLoginButton)
        
        welcomeImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(87)
            $0.height.width.equalTo(150)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(welcomeImage.snp.bottom).offset(30)
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(30)
        }
        
        temperatureSlider.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(temperatureLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        temperatureValueLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(temperatureSlider.snp.bottom).offset(30)
        }
        
        goMainButton.snp.makeConstraints {
            $0.top.equalTo(temperatureValueLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(58)
        }
        
        backToLoginButton.snp.makeConstraints {
            $0.top.equalTo(goMainButton.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(58)
        }
    }
    
    @objc func backToLoginButtonTapped() {
        completionHandler?(id)
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func sliderValueDidChange(_ sender: UISlider) {
        //슬라이더의 Value값이 변경될 때마다 UILabel에 반영
        temperatureValueLabel.text = "🥕\(Int(sender.value))%🥕"
    }
    
    private func bindID(){
        if let id {
            self.welcomeLabel.text = "\(id)님 \n반가워요!"
        }
    }
}
