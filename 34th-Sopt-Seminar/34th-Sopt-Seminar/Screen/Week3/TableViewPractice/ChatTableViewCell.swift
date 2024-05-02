//
//  File.swift
//  34th-Sopt-Seminar
//
//  Created by 조혜린 on 4/20/24.
//

import UIKit
import SnapKit

final class ChatTableViewCell: UITableViewCell {
    
    static let identifier = "ChatTableViewCell"
    
    private lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 96
        
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .pretendardFont(weight: 700, size: 15)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var placeLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .pretendardFont(weight: 400, size: 12)
        label.textColor = .customGray2
        
        return label
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .pretendardFont(weight: 400, size: 14)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var itemImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "itemImage"))
        image.layer.cornerRadius = 4
        
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        self.addSubviews(
            profileImage,
            nameLabel,
            placeLabel,
            messageLabel,
            itemImage
        )
        
        profileImage.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(16)
            $0.size.equalTo(40)
        }
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImage.snp.trailing).offset(16)
            $0.top.equalToSuperview().offset(16.5)
        }
        
        placeLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(4)
            $0.top.equalTo(nameLabel).offset(2)
        }
        messageLabel.snp.makeConstraints {
            $0.top.equalTo(placeLabel.snp.bottom).offset(4)
            $0.leading.equalTo(nameLabel)
        }
        itemImage.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(16)
            $0.size.equalTo(40)
        }
    }
}

extension ChatTableViewCell {
    func dataBind(_ chatData: ChatModel) {
        profileImage.image = chatData.profileImg
        nameLabel.text = chatData.name
        placeLabel.text = chatData.place
        messageLabel.text = chatData.message
        itemImage.image = chatData.itemImg
    }
}
