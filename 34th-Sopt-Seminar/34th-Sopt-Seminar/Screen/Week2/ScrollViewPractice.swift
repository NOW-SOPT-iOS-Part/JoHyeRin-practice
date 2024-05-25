//
//  ScrollViewPractice.swift
//  34th-Sopt-Seminar
//
//  Created by 조혜린 on 4/6/24.
//

import UIKit
import SnapKit

class ScrollViewPractice: UIViewController {
    let screenWidth = UIScreen.main.bounds.width
    
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        
        return view
    }()
    
    private let orangeView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        
        return view
    }()
    
    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        
        return view
    }()
    
    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        
        return view
    }()
    
    private let purpleView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInsetAdjustmentBehavior = .never
        
        return scrollView
    }()
    
    private var contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        setupLayout()
    }
    
    private func setupLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(redView,
                                orangeView,
                                yellowView,
                                greenView,
                                blueView,
                                purpleView)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        redView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.height.equalTo(337)
            $0.width.equalTo(screenWidth/2)
        }
        
        orangeView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.height.equalTo(337)
            $0.width.equalTo(screenWidth/2)
        }
        
        yellowView.snp.makeConstraints {
            $0.top.equalTo(orangeView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.height.equalTo(337)
            $0.width.equalTo(screenWidth/2)
        }
        
        greenView.snp.makeConstraints {
            $0.top.equalTo(orangeView.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(337)
            $0.width.equalTo(screenWidth/2)
        }
        
        blueView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.height.equalTo(337)
            $0.width.equalTo(screenWidth/2)
            $0.bottom.equalTo(contentView)
        }
        
        purpleView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(337)
            $0.width.equalTo(screenWidth/2)
            $0.bottom.equalTo(contentView)
        }
    }
}
