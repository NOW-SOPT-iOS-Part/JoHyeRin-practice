//
//  ItemViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 조혜린 on 4/20/24.
//

import UIKit
import SnapKit

final class ItemViewController: UIViewController {
    
    final let carrotLineSpacing: CGFloat = 10
    final let carrotInterItemSpacing: CGFloat = 21
    final let cellHeight: CGFloat = 198
    final let carrotInset = UIEdgeInsets(top: 48, left: 20, bottom: 10, right: 20)
    
    private var itemData = ItemModel.dummy()
    
//    private func calculateCellHeight() -> CGFloat {
//        let count = CGFloat(itemData.count)
//        let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
//        return heightCount * cellHeight + (heightCount - 1) * carrotLineSpacing + carrotInset.top + carrotInset.bottom
//    }
    
//    //flowLayout 속성 직접 변경하는 방법
//    private lazy var itemCollectionView: UICollectionView = {
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.itemSize = CGSize(width: (UIScreen().bounds.width - carrotInset.left - carrotInset.right - carrotInterItemSpacing) / 2 , height: 198)
//        flowLayout.minimumInteritemSpacing = carrotInterItemSpacing
//        flowLayout.minimumLineSpacing = carrotLineSpacing
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
//        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
//        collectionView.delegate = self //lazy 키워드를 사용했기 때문에 setdelegate() 함수 사용하지 않고 이렇게 해도 됨
//        collectionView.dataSource = self
//        return collectionView
//    }()
    
    private let itemCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        setLayout()
        setDelegate()
    }
    
    private func setLayout() {
        self.view.addSubview(itemCollectionView)
        
        itemCollectionView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    private func setDelegate() {
        itemCollectionView.delegate = self
        itemCollectionView.dataSource = self
    }
}

extension ItemViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - carrotInset.left - carrotInset.right - carrotInterItemSpacing
        return CGSize(width: doubleCellWidth / 2, height: 198)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return carrotLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return carrotInterItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return carrotInset
    }
}

extension ItemViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as?
                ItemCollectionViewCell else { return UICollectionViewCell() }
        cell.delegate = self
        cell.dataBind(itemData[indexPath.item], itemRow: indexPath.item)
        return cell
    }
}

extension ItemViewController: ItemCollectionViewCellDelegate {
    func heartButtonDidTapEvent(state: Bool, row: Int) {
        itemData[row].heartIsSelected = state
    }
}
