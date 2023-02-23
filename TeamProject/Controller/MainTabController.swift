//
//  MainTabController.swift
//  TeamProject
//
//  Created by 이보한 on 2023/02/13.
// 메인탭컨트롤러

import UIKit

class MainTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    
    func configureViewControllers() {
        let friends = FriendsController()
        let nav1 = templateNavigationController(title: "친구들", image: UIImage(named: "friendsUnselected"), selectedImage: UIImage(named: "friendsSelected"), rootViewController: friends)
        
        let chats = ChatsController()
        let nav2 = templateNavigationController(title: "대화목록", image: UIImage(named: "chatsUnselected"), selectedImage: UIImage(named: "chatsSelected"), rootViewController: chats)
        
        let setting = SettingController()
        let nav3 = templateNavigationController(title: "설정", image: UIImage(named: "settingUnselected"), selectedImage: UIImage(named: "settingSelected"), rootViewController: setting)
        
        viewControllers = [nav1, nav2, nav3]
    }

    func templateNavigationController(title: String?, image: UIImage?, selectedImage: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController:  rootViewController)
        nav.tabBarItem.selectedImage = selectedImage
        nav.tabBarItem.image = image
        nav.title = title

        return nav
    }
    
}
