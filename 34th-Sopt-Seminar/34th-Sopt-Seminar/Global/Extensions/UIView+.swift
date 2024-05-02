//
//  UIView+.swift
//  34th-Sopt-Seminar
//
//  Created by 조혜린 on 4/7/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
