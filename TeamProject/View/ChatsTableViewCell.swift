//
//  ChatsTableViewCell.swift
//  TeamProject
//
//  Created by 이보한 on 2023/02/15.
// 채팅목록 테이블뷰

import UIKit

class ChatsTableViewCell: UITableViewCell {
    
    let chatsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    let chatsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    
    let chatsContentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution  = .fill
        sv.alignment = .fill
        sv.spacing = 8
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    func setupStackView() {
        self.addSubview(chatsImageView)
        self.addSubview(stackView)
        
        stackView.addArrangedSubview(chatsTitleLabel)
        stackView.addArrangedSubview(chatsContentLabel)
    }
    
    func setConstraints() {
        setChatsImageViewConstraints()
        setChatsTitleLabelConstraints()
        setStackViewConstraints()
    }
    
    func setChatsImageViewConstraints() {
        NSLayoutConstraint.activate([
            chatsImageView.heightAnchor.constraint(equalToConstant: 50),
            chatsImageView.widthAnchor.constraint(equalToConstant: 50),
            chatsImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            chatsImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func setChatsTitleLabelConstraints() {
        chatsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chatsTitleLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    
//    func setChatsContentLabelConstraints() {
//        NSLayoutConstraint.activate([
//        ])
//    }

    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: chatsImageView.trailingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.chatsImageView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.chatsImageView.bottomAnchor)
        ])
    }

    
    
    
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
