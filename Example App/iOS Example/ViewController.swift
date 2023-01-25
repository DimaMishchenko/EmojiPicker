//
//  ViewController.swift
//  EmojiPicker
//
//  Created by Егор Бадмаев on 19.07.2022.
//

import UIKit
import EmojiPicker

class ViewController: UIViewController {
    
    private lazy var textField = UITextField()
  
    private lazy var emojiButton: UIButton = {
        let button = UIButton()
        button.setTitle("😃", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 70)
        button.addTarget(self, action: #selector(openEmojiPickerModule), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    @objc private func openEmojiPickerModule(sender: UIButton) {
        let configuration = EmojiPicker.Configuration(sender: sender)
        EmojiPicker.present(on: self, with: configuration) {
            self.emojiButton.setTitle($0, for: .normal)
        }
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(emojiButton)
        view.addSubview(textField)
        textField.backgroundColor = .systemGray
        textField.translatesAutoresizingMaskIntoConstraints = false
      
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            textField.heightAnchor.constraint(equalToConstant: 80),
            textField.widthAnchor.constraint(equalToConstant: 80)
        ])
      
        NSLayoutConstraint.activate([
            emojiButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emojiButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            emojiButton.heightAnchor.constraint(equalToConstant: 80),
            emojiButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
}
