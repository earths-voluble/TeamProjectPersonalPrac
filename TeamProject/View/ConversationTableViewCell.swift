//
//  ConversationTableViewCell.swift
//  TeamProject
//
//  Created by 이보한 on 2023/02/16.
// 채팅창 컨트롤러

import UIKit

class ConversationTableViewCell: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var messages = ["안녕", "반가워반가워반가워반가워반가워반가워반가워반가워!", "안녕", "안녕", "안녕", "안녕", "메시지 메시지", " 메시지메시지메시지", " 메시지메시지메시지", " 메시지메시지메시지", " 메시지메시지메시지", " 메시지메시지메시지", " 메시지메시지메시지", " 메시지메시지메시지"]
    
    let messageField = UITextField()
    let messageTable = UITableView()
    lazy var sendButton: UIButton = {
        let button = UIButton(type: .custom)
        button.layer.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.setTitle("보내기", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = false
        return button
    }()
    
    lazy var stackView: UIStackView = {
            let stview = UIStackView(arrangedSubviews: [messageField, sendButton])
            stview.spacing = 5
            stview.axis = .horizontal
            stview.alignment = .fill
            return stview
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("대화창 열림")
        configureUI()
        setupAddTarget()
        
    }
    
    // MARK: - UITableView delegate and data source methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of messages
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatBubbleCell", for: indexPath) as! ChatBubbleTableViewCell
        
        let message = messages[indexPath.row]
        cell.configure(message: message)
        
        //cell.textLabel?.text = messages[indexPath.row]
        return cell
    }
    
    // MARK: - Helper methods
    
    func sendMessage(_ message: String) {
        // Add the message to the array and reload the table view
        messages.append(message)
        messageTable.reloadData()
    }
    
    func configureUI() {
        messageField.borderStyle = .roundedRect
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        messageTable.backgroundColor = UIColor.white
        messageTable.separatorStyle = .none
        messageTable.delegate = self
        messageTable.dataSource = self
        messageTable.register(ChatBubbleTableViewCell.self, forCellReuseIdentifier: "ChatBubbleCell")
        messageTable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(messageTable)
        
        NSLayoutConstraint.activate([
            sendButton.widthAnchor.constraint(equalToConstant: 60),
            messageTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            messageTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            messageTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: messageTable.bottomAnchor, constant: 16),
            stackView.heightAnchor.constraint(equalToConstant: 36),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
//    func addChatBubbles() {
//        var currentY: CGFloat = 100.0
//        let margin: CGFloat = 20.0
//
//        for message in messages {
//            // Create chat bubble label
//            let label = UILabel()
//            label.text = message
//            label.numberOfLines = 0
//            label.textAlignment = .left
//            label.textColor = UIColor.white
//            label.backgroundColor = UIColor.systemBlue
//            label.font = UIFont.systemFont(ofSize: 20.0)
//            label.layer.cornerRadius = 10.0
//            label.layer.masksToBounds = true
//
//            // Calculate size of chat bubble label
//            let maxSize = CGSize(width: view.frame.size.width * 0.7, height: CGFloat.greatestFiniteMagnitude * 0.7)
//            let labelSize = label.sizeThatFits(maxSize)
//
//            // Set frame of chat bubble label
//            let labelX = margin
//            let labelY = currentY
//            let labelWidth = labelSize.width * 1.2
//            let labelHeight = labelSize.height * 1.3
//            label.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
//
//            // Add chat bubble label to view
//            view.addSubview(label)
//
//            // Update current Y position for next chat bubble label
//            currentY += labelHeight + margin
//        }
//    }
    
    func setupAddTarget() {
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
    }
    
    @objc func sendButtonTapped() {
        print("보내기 버튼 눌림")
    }
    // MARK: - Private properties
    

}

class ChatBubbleTableViewCell: UITableViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.layer.cornerRadius = 10.0
        label.layer.masksToBounds = true
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.clear
        contentView.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(message: String) {
        label.text = message
        label.backgroundColor = UIColor.systemBlue
    }
    
    class func height(for message: String, width: CGFloat) -> CGFloat {
        let maxSize = CGSize(width: width * 0.7, height: CGFloat.greatestFiniteMagnitude)
        let labelSize = (message as NSString).boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0)], context: nil).size
        return labelSize.height + 20.0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margin: CGFloat = 20.0
        let labelX = margin
        let labelY = margin
        let labelWidth = frame.width * 0.7
        let labelHeight = frame.height - 1 * margin
        label.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
        
    }
}


// MARK: Todo
/* 말풍선 만들기
 내가 보낸 메시지와 상대 메시지 구분(좌우로)
 채팅에 들어갔을 때 최신 메시지부터 보여주기
 보내기버튼 구현
 보낸 채팅 저장하기 구현
 
 가능하면 채팅방별로
 친구 선택해서 채팅 바로가기 등 목표
 
 */


//extension ConversationTableViewCell: UITextFieldDelegate {
//    func messageFieldDidBeginEditing(_ textField: UITextField) {
//        if textField == messageField {
//            messageField.centerYAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>)
//        }
//
//    }
//
//}
    
//    private lazy var conversationSendTextFieldView: UITextField = {
//        var tf = UITextField()
//        tf.frame.size.height = 48
//        tf.backgroundColor = .clear
//        tf.textColor = .white
//        tf.tintColor = .white
//        tf.autocapitalizationType = .none
//        tf.autocorrectionType = .no
//        tf.spellCheckingType = .no
//        tf.keyboardType = .default
//        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
//        return tf
//    }()


//

//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: .default, reuseIdentifier: reuseIdentifier)
//        setup()
//        setupConstraints()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setup() {
//        self.backgroundColor = .blue
//    }
//
//    func setupConstraints() {
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
//            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
//            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
//            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
//        ])
//    }
//
//
//
//
//
////    override func awakeFromNib() {
////        super.awakeFromNib()
////        // Initialization code
////    }
////
////    override func setSelected(_ selected: Bool, animated: Bool) {
////        super.setSelected(selected, animated: animated)
////
////        // Configure the view for the selected state
////    }
//
//    @objc private func textFieldEditingChanged(_ textField: UITextField) {
//        if textField.text?.count == 1 {
//            if textField.text?.first == " " {
//                textField.text = ""
//                return
//            }
//        }
//        guard
//            let message = conversationSendTextFieldView.text, !message.isEmpty
//        else {
//            sendButton.backgroundColor = .clear
//            sendButton.isEnabled = false
//            return
//        }
//        sendButton.backgroundColor = .blue
//        sendButton.isEnabled = true
//    }
//
//}
