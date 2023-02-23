//
//  DataManager.swift
//  TeamProject
//
//  Created by 이보한 on 2023/02/13.
//

import UIKit

class DataManager {
    private var chatsDataArray: [Chats] = []
    private var friendsDataArray: [Profile] = []
    
    func makeChatsData() {
        chatsDataArray = [
            Chats(chatImage: UIImage(named: "Paul") ,chatTitle: "Paul", chatPreview: "안녕"),
            Chats(chatImage: UIImage(named: "Herris"), chatTitle: "Herris", chatPreview: "안녕안녕"),
            Chats(chatImage: UIImage(named: "Jimmy"), chatTitle: "Jimmy", chatPreview: "안녕안녕"),
            Chats(chatImage: UIImage(named: "Iwon"), chatTitle: "Iwon", chatPreview: "안녕안녕")
        ]
    }
    
    func makeFriendsData() {
        friendsDataArray = [
            Profile(profileImage: UIImage(named: "Paul"),profileName: "Paul", phoneNum: 01064886909),
            Profile(profileImage: UIImage(named: "Paul"),profileName: "Herris", phoneNum: 0104124124)
        ]
    }
    
    func getChatsData() -> [Chats] {
        return chatsDataArray
    }
    
    func getFriendsData() -> [Profile] {
        return friendsDataArray
    }
    
    func addChatData() {
        let newChat = Chats(chatImage: UIImage(named: "Paul"), chatTitle: "새 대화", chatPreview: "안녕하세요!")
        chatsDataArray.append(newChat)
    }
    

    
}
