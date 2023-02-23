//
//  FriendsTableViewCell.swift
//  TeamProject
//
//  Created by 이보한 on 2023/02/15.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    let profileNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.numberOfLines = 0
        return label
    }()
    
    // Profile 모델의 프로퍼티 중 전화번호는 여기서 사용하지 않는다. 전화번호는 프로필 터치 시 modal으로 뜰 창에 추가하는 것으로 하자.
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 10
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
        self.addSubview(profileImageView)
        self.addSubview(stackView)
        stackView.addArrangedSubview(profileNameLabel)
    }
    
    func setConstraints() {
        setChatsImageViewConstraints()
        setChatsTitleLabelConstraints()
        setStackViewConstraints()
    }
    
    func setChatsImageViewConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.heightAnchor.constraint(equalToConstant: 50),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            profileImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func setChatsTitleLabelConstraints() {
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileNameLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
    }

    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.profileImageView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.profileImageView.bottomAnchor)
        ])
    }
    
}
