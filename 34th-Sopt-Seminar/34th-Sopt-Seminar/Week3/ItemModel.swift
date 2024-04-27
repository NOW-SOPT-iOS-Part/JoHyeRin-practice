//
//  ItemModel.swift
//  34th-Sopt-Seminar
//
//  Created by 조혜린 on 4/20/24.
//

import UIKit

struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
    var heartIsSelected: Bool
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .item, name: "아이폰 13 프로맥스", price: "1,000,000원", heartIsSelected: false),
            ItemModel(itemImg: .item1, name: "에어팟 프로", price: "300,000원", heartIsSelected: false),
            ItemModel(itemImg: .item2, name: "커피머신", price: "100,000원", heartIsSelected: false),
            ItemModel(itemImg: .item3, name: "샌드위치", price: "8,000원", heartIsSelected: false),
            ItemModel(itemImg: .item4, name: "명품 향수", price: "250,000원", heartIsSelected: false),
            ItemModel(itemImg: .item2, name: "커피머신", price: "100,000원", heartIsSelected: false),
            ItemModel(itemImg: .item1, name: "차이팟 프로", price: "30,000원", heartIsSelected: false),
            ItemModel(itemImg: .item, name: "차이폰 13 프로맥스", price: "100,000원", heartIsSelected: false),
            ItemModel(itemImg: .item4, name: "짝퉁 향수", price: "100,000원", heartIsSelected: false)
        ]
    }
}
