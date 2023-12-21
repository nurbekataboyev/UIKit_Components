//
//  SnapKitPractice.swift
//  UIKit_Components
//
//  Created by Nurbek on 14/12/23.
//

import UIKit
import SnapKit

class SnapKitPractice: UIViewController {
    
    private let phoneNumber = "1234"
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Enter Phone Number"
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 15
        textField.setLeftPadding(Constants.medium)
        textField.setRightPadding(Constants.medium)
        
        return textField
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        
        button.setTitle("Confirm", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 15
        
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        [textField, button].forEach { item in
            view.addSubview(item)
        }
        
        layout()
    }
    
    private func layout() {
        textField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constants.small)
            $0.leading.equalToSuperview().offset(Constants.medium)
            $0.trailing.equalToSuperview().offset(-Constants.medium)
            $0.height.equalTo(Constants.height)
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(Constants.small)
            $0.leading.equalToSuperview().offset(Constants.medium)
            $0.trailing.equalToSuperview().offset(-Constants.medium)
            $0.height.equalTo(Constants.height)
        }
    }
    
}

// MARK: - ACTIONS
extension SnapKitPractice {
    @objc func buttonClicked() {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.textField.layer.borderColor = UIColor.black.cgColor
        }))
        
        if let phoneNumberText = textField.text {
            
            if phoneNumberText.isEmpty == false && phoneNumberText == self.phoneNumber {
                self.textField.layer.borderColor = UIColor.green.cgColor
                alert.title = "Success"
                self.present(alert, animated: true)
            } else {
//                alert.title = "Wrong Phone Number"
                animation()
            }
            
        }
    }
    
//    animation
    func animation() {
        self.textField.layer.borderColor = UIColor.red.cgColor
        
        UIView.animate(withDuration: 0.1) {
            self.textField.transform = CGAffineTransform(translationX: -5, y: 0)
        } completion: { _ in
            
            UIView.animate(withDuration: 0.1) {
                self.textField.transform = CGAffineTransform(translationX: 5, y: 0)
                
            } completion: { _ in
                
                UIView.animate(withDuration: 0.1) {
                    self.textField.transform = CGAffineTransform(translationX: -5, y: 0)
                    
                } completion: { _ in
                    
                    UIView.animate(withDuration: 0.1) {
                        self.textField.transform = CGAffineTransform(translationX: 5, y: 0)
                        
                    } completion: { _ in
                        
                        UIView.animate(withDuration: 0.1) {
                            self.textField.transform = CGAffineTransform(translationX: 0, y: 0)
                            
                        }
                    }
                    
                }
                
            }
        }

    }
}
