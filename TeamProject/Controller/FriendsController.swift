//
//  FriendsController.swift
//  TeamProject
//
//  Created by 이보한 on 2023/02/13.
// 친구목록 컨트롤러

import UIKit

final class FriendsController: UIViewController {
    
    private let tableView = UITableView()
    
    var friendsArray: [Profile] = []
    
    var friendsDataManager = DataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNaviBar()
        setupTableView()
        setupDatas()
        setupTableViewConstraints()

    }
    
    func setupNaviBar() {
        title = "친구들"
        
        // 내비게이션바 설정
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()  // 불투명으로
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupTableView() {
        // 델리게이트 패턴의 대리자 설정
        tableView.dataSource = self
        tableView.delegate = self
        // 셀의 높이 설정
        tableView.rowHeight = 60
        
        // 셀의 등록과정⭐️⭐️⭐️ (스토리보드 사용시에는 스토리보드에서 자동등록)
        tableView.register(FriendsTableViewCell.self, forCellReuseIdentifier: "FriendsCell")
    }
    
    func setupDatas() {
        friendsDataManager.makeFriendsData()
        friendsArray = friendsDataManager.getFriendsData()
    }
}

extension FriendsController: UITableViewDataSource {
    // 테이블뷰에 몇개의 데이터를 표시할 것인지 뷰컨트롤러에 물어보기
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray.count
    }
    
    // 셀의 구성(셀에 표시하고자 하는 데이터 표시)을 뷰컨트롤러에게 물어보기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! FriendsTableViewCell
        cell.profileImageView.image = friendsArray[indexPath.row].profileImage
        cell.profileNameLabel.text = friendsArray[indexPath.row].profileName
        return cell
    }
    
    func setupTableViewConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}

extension FriendsController: UITableViewDelegate {

    // 셀이 선택이 되었을때 어떤 동작을 할 것인지 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 다음화면으로 이동
        let profileVC = ProfileViewController()
        profileVC.profileData = friendsArray[indexPath.row]
        profileVC.modalPresentationStyle = .automatic
        present(profileVC, animated: true, completion: nil)
        //show(profileVC, sender: nil)
//        navigationController?.pushViewController(conversationVC, animated: true)
    }
}
