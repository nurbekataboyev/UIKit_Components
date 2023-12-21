//
//  HomeWork.swift
//  UIKit_Components
//
//  Created by Nurbek on 14/12/23.
//

import UIKit
import SnapKit

class SnapKitHomeWork1: UIViewController {
    
//    MARK: - TASK1
    private let originalEmail = "aaa"
    
    private lazy var emailAddress: UILabel = {
        let text = UILabel()
        
        text.text = "Email Address"
        text.font = .systemFont(ofSize: 18, weight: .medium)
        
        return text
    }()
    
    private lazy var emailView: UIView = {
        let emailView = UIView()
        
        emailView.isUserInteractionEnabled = true
        emailView.backgroundColor = .white
        emailView.layer.borderColor = UIColor.systemGreen.cgColor
        emailView.layer.borderWidth = 2.5
        emailView.layer.cornerRadius = Constants.height / 2
        
        return emailView
    }()
    
    private lazy var emailIcon: UIImageView = {
        let emailIcon = UIImageView()
        
        emailIcon.image = UIImage(systemName: "envelope")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 20, weight: .regular))
        emailIcon.contentMode = .scaleAspectFill
        emailIcon.tintColor = .black
        
        return emailIcon
    }()
    
    private lazy var lineView: UIView = {
        let lineView = UIView()
        
        lineView.backgroundColor = .systemGreen
        
        return lineView
    }()
    
    private lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        
        emailTextField.placeholder = "Enter Your Email"
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        emailTextField.keyboardType = .emailAddress
        emailTextField.font = .systemFont(ofSize: 18, weight: .medium)
        
        return emailTextField
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Confirm", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = Constants.height / 2
        
        button.layer.borderColor = UIColor.clear.cgColor
        
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        [emailAddress, emailView, emailIcon, lineView, emailTextField, confirmButton].forEach { item in
            view.addSubview(item)
        }
        
        task1()
    }
    
    
    
}

// MARK: - TASK1
extension SnapKitHomeWork1 {
    
    func task1() {
        
        emailAddress.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constants.small)
            $0.leading.equalToSuperview().offset(Constants.medium)
        }
        
        emailView.snp.makeConstraints {
            $0.top.equalTo(emailAddress.snp.bottom).offset(Constants.small)
            $0.leading.equalToSuperview().offset(Constants.medium)
            $0.trailing.equalToSuperview().offset(-Constants.medium)
            $0.height.equalTo(Constants.height)
        }
        
        confirmButton.snp.makeConstraints {
            $0.top.equalTo(emailView.snp.bottom).offset(Constants.medium)
            $0.leading.equalToSuperview().offset(Constants.medium)
            $0.trailing.equalToSuperview().offset(-Constants.medium)
            $0.height.equalTo(Constants.height)
        }
        
        emailIcon.snp.makeConstraints {
            $0.width.equalTo(24)
            $0.leading.equalTo(emailView.snp.leading).offset(24)
            $0.centerY.equalTo(emailView.snp.centerY)
        }
        
        lineView.snp.makeConstraints {
            $0.width.equalTo(2.5)
            $0.height.equalTo(18)
            $0.leading.equalTo(emailIcon.snp.trailing).offset(18)
            $0.centerY.equalTo(emailView.snp.centerY)
        }
        
        emailTextField.snp.makeConstraints {
            $0.height.equalTo(Constants.height)
            $0.leading.equalTo(lineView.snp.trailing).offset(15)
            $0.trailing.equalTo(emailView.snp.trailing).offset(-24)
            $0.centerY.equalTo(emailView.snp.centerY)
        }
    }
    
    @objc func buttonClicked() {
        
        option1()
//        option2()
        
    }
    
    private func option1() {
        
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        
        UIView.animate(withDuration: 1) {
            
            self.confirmButton.layer.borderWidth = 1
            self.confirmButton.setTitle("Loading.", for: .normal)
//            self.view.layoutIfNeeded()
            
        } completion: { _ in
            
            UIView.animate(withDuration: 1) {
                
                self.confirmButton.layer.borderWidth = 0
                self.confirmButton.setTitle("Loading..", for: .normal)
//                self.view.layoutIfNeeded()
                
            } completion: { _ in
                
                UIView.animate(withDuration: 1) {
                    
                    self.confirmButton.layer.borderWidth = 1
                    self.confirmButton.setTitle("Loading...", for: .normal)
//                    self.view.layoutIfNeeded()
                    
                } completion: { _ in
                    
                    UIView.animate(withDuration: 1) {
                        
                        self.confirmButton.layer.borderWidth = 0
                        self.confirmButton.setTitle("Loading.", for: .normal)
//                        self.view.layoutIfNeeded()
                        
                    } completion: { _ in
                        
                        UIView.animate(withDuration: 1) {
                            
                            self.confirmButton.layer.borderWidth = 1
                            self.confirmButton.setTitle("Loading..", for: .normal)
//                            self.view.layoutIfNeeded()
                            
                        } completion: { _ in
                            
                            UIView.animate(withDuration: 1) {
                                
                                self.confirmButton.layer.borderWidth = 0
                                self.confirmButton.setTitle("Loading...", for: .normal)
//                                self.view.layoutIfNeeded()
                                
                            } completion: { _ in
                                
                                self.confirmButton.layer.borderWidth = 1
                                self.confirmButton.setTitle("Confirm", for: .normal)
//                                self.view.layoutIfNeeded()
                                
                                if let userEmail = self.emailTextField.text, userEmail == self.originalEmail {
                                    alert.title = "Email is Successfull"
                                } else {
                                    alert.title = "Invalid Email"
                                }
                                
                                self.present(alert, animated: true)
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
//    private func option2() {
//        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Okay", style: .default))
//        
//        var count = 1
//        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
//            if count != 8 {
//                let dots = Array(repeating: ".", count: (count % 4)).joined()
//                self.confirmButton.setTitle("Loading\(dots)", for: .normal)
//                count += 1
//            } else {
//                if let userEmail = self.emailTextField.text, userEmail == self.originalEmail {
//                    alert.title = "Email is Successfull"
//                } else {
//                    alert.title = "Invalid Email"
//                }
//                
//                self.present(alert, animated: true)
//            }
//        }
//    }
    
}
