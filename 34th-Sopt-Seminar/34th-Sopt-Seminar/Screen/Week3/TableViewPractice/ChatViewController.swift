//
//  ChatViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 조혜린 on 4/20/24.
//
import UIKit
import SnapKit

final class ChatViewController: UIViewController {
    
    private let chatList = ChatModel.dummy()
    
    private lazy var chatTableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setLayout()
        register()
        setDelegate()
    }
}

extension ChatViewController {
    private func setLayout() {
        self.view.addSubview(chatTableView)
        
        chatTableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    private func register() {
        chatTableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
    }
    
    private func setDelegate() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
    }
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as?
                ChatTableViewCell else { return UITableViewCell() }
        cell.dataBind(chatList[indexPath.row])
        return cell
    }
}


