//
//  ProfileViewController.swift
//  TeamProject
//
//  Created by 이보한 on 2023/02/15.
//

import UIKit

final class ProfileViewController: UIViewController {

    private let profileView = ProfileView()
    
    // 전화면에서 데이터를 전달 받기 위한 변수
    var profileData: Profile?
    
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        profileView.profileImageView.image = profileData?.profileImage
        profileView.profileNameView.text = profileData?.profileName
        //profileView.phoneNumLabel.text = String(profileData?.phoneNum)
    }
}





