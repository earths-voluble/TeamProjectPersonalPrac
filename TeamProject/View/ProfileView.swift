//
//  ProfileView.swift
//  TeamProject
//
//  Created by 이보한 on 2023/02/15.
//

import UIKit

class ProfileView: UIView {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let profileNameView: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    let phoneNumLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.spacing = 40
        return sv
    }()
    
    
    func setupStackView() {
        self.addSubview(profileImageView)
        self.addSubview(profileNameView)
    }
    
    func setConstraints() {
        
    }
    
    func setProfileImageViewConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.heightAnchor.constraint(equalToConstant: 200),
            profileImageView.widthAnchor.constraint(equalToConstant: 200),
            profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            profileImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

}
