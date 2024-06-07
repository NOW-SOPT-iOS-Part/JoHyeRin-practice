//
//  ViewModelType.swift
//  34th-Sopt-Seminar
//
//  Created by 조혜린 on 5/25/24.
//

import RxSwift

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(from input: Input, disposeBag: RxSwift.DisposeBag) -> Output
}
