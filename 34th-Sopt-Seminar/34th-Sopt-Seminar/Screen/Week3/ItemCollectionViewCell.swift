//
//  ItemTableViewCell.swift
//  34th-Sopt-Seminar
//
//  Created by 조혜린 on 4/20/24.
//

import UIKit
import SnapKit

protocol ItemCollectionViewCellDelegate: AnyObject {
    func heartButtonDidTapEvent(state: Bool, row: Int)
}

final class ItemCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "itemCollectionViewCell"
    var itemRow: Int?
    
    weak var delegate: ItemCollectionViewCellDelegate?
    
    private lazy var itemImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "profileImage"))
        image.layer.cornerRadius = 4
        
        return image
    }()
    
    private lazy var itemNameLabel: UILabel = {
        let label = UILabel()
        label.text = "아이폰 13 프로맥스"
        label.font = .pretendardFont(weight: 400, size: 16)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "아이폰 13 프로맥스"
        label.font = .pretendardFont(weight: 700, size: 15)
        label.textColor = .primaryOrange
        
        return label
    }()
    
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "heartImage"), for: .normal)
        button.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        button.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        setLayout()
    }
    
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        self.addSubviews(itemImageView, itemNameLabel, priceLabel, heartButton)
        
        itemImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(9)
            $0.bottom.equalToSuperview().inset(59)
        }
        
        itemNameLabel.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(9)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(itemNameLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(9)
        }
        
        heartButton.snp.makeConstraints {
            $0.trailing.bottom.equalTo(itemImageView).inset(8)
            $0.size.equalTo(16)
        }
    }
}

extension ItemCollectionViewCell {
    func dataBind(_ itemData: ItemModel, itemRow: Int) {
        itemImageView.image = itemData.itemImg
        itemNameLabel.text = itemData.name
        priceLabel.text = itemData.price
        heartButton.isSelected = itemData.heartIsSelected
        self.itemRow = itemRow
    }
    
    @objc func heartButtonTapped() {
        self.heartButton.isSelected.toggle()
        if let itemRow {
            self.delegate?.heartButtonDidTapEvent(state: self.heartButton.isSelected, row: itemRow)
        }
    }
}
