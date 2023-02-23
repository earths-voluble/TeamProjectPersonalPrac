//
//  ConversationTableViewCell.swift
//  TeamProject
//
//  Created by 이보한 on 2023/02/16.
//

//import UIKit
//
//class ConversationTableViewCell: UITableViewCell {
//    
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
//    lazy var sendButton: UIButton = {
//        let button = UIButton(type: .custom)
//        button.backgroundColor = .clear
//        button.layer.cornerRadius = 5
//        button.layer.borderWidth = 1
//        button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        button.setTitle("로그인", for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
//        button.isEnabled = false
//        return button
//    }()
//    
//    private lazy var stackView: UIStackView = {
//        let stview = UIStackView(arrangedSubviews: [conversationSendTextFieldView, sendButton])
//        stview.spacing = 5
//        stview.axis = .horizontal
//        stview.distribution = .fillEqually
//        stview.alignment = .fill
//        return stview
//    }()
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
