//
//  File.swift
//  34th-Sopt-Seminar
//
//  Created by 조혜린 on 4/20/24.
//

import UIKit

struct ChatModel {
    let profileImg: UIImage
    let name: String
    let place: String
    let message: String
    let itemImg: UIImage
}

extension ChatModel {
    static func dummy() -> [ChatModel] {
        return [
            ChatModel(profileImg: .profile, name: "요이키", place: "문정동", message: "확인했습니다 감사합니다:)", itemImg: .itemImage1),
            ChatModel(profileImg: .profile1, name: "chan", place: "구의동", message: "넵 수고하세용", itemImg: .itemImage2),
            ChatModel(profileImg: .profile2, name: "오지", place: "보문동 2가", message: "안녕하세요 답장이 너무 늦어져서 죄송합니다", itemImg: .itemImage3),
            ChatModel(profileImg: .profile, name: "누룽지", place: "면목동", message: "이람다님이 이모티콘을 보냈어요.", itemImg: .itemImage4),
            ChatModel(profileImg: .profile, name: "kenny", place: "자양제4동", message: "네.", itemImg: .itemImage5),
            ChatModel(profileImg: .profile3, name: "자리보금", place: "옥수동", message: "자리보금님이 이모티콘을 보냈어요.", itemImg: .itemImage6),
            ChatModel(profileImg: .profile4, name: "리빙스턴", place: "면목동", message: "리빙스턴님이 이모티콘을 보냈어요.", itemImg: .itemImage7),
            ChatModel(profileImg: .profile, name: "꺄룽이", place: "중곡동", message: "옷 예쁘네요!", itemImg: .itemImage8),
            ChatModel(profileImg: .profile, name: "깨롱이", place: "중곡동", message: "네.", itemImg: .itemImage9),
            ChatModel(profileImg: .profile5, name: "요우", place: "군자동", message: "감사합니다! 조심히 가세요!", itemImg: .itemImage10)
        ]
    }
}
