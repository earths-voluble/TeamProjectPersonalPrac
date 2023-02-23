//
//  MessageViewController.swift
//  TeamProject
//
//  Created by 이보한 on 2023/02/16.
//
import UIKit

class MessageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let messageField = UITextField()
    let messageTable = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageField.borderStyle = .roundedRect
        messageField.placeholder = "Enter message"
        messageField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(messageField)
        
        messageTable.delegate = self
        messageTable.dataSource = self
        messageTable.register(UITableViewCell.self, forCellReuseIdentifier: "MessageCell")
        messageTable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(messageTable)
        
        NSLayoutConstraint.activate([
            messageTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            messageTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            messageTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            messageTable.bottomAnchor.constraint(equalTo: messageField.topAnchor, constant: -16),
            messageField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            messageField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            messageField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    // MARK: - UITableView delegate and data source methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of messages
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
        cell.textLabel?.text = messages[indexPath.row]
        return cell
    }
    
    // MARK: - Helper methods
    
    func sendMessage(_ message: String) {
        // Add the message to the array and reload the table view
        messages.append(message)
        messageTable.reloadData()
    }
    
    // MARK: - Private properties
    
    private var messages = ["Hello", "How are you?", "I'm fine, thanks!"]
}
