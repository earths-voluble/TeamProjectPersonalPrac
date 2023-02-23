//
//  ChatsController.swift
//  TeamProject
//
//  Created by 이보한 on 2023/02/13.
//

import UIKit 

final class ChatsController: UIViewController {
    
    private let tableView = UITableView()
    
    var chatsArray: [Chat] = []
    
    var chatDataManager = DataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNaviBar()
        setupTableView()
    }
    
    func setupNaviBar() {
        title = "채팅목록"
        
        // (네비게이션바 설정관련) iOS버전 업데이트 되면서 바뀐 설정⭐️⭐️⭐️
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
        tableView.rowHeight = 120
        
        // 셀의 등록과정⭐️⭐️⭐️ (스토리보드 사용시에는 스토리보드에서 자동등록)
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MovieCell")
    }


}


extension ChatsController: UITableViewDelegate {
    
    // 셀이 선택이 되었을때 어떤 동작을 할 것인지 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 다음화면으로 이동
        let conversationVC = ConversationViewController()
        conversationVC.movieData = moviesArray[indexPath.row]
        //show(detailVC, sender: nil)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
