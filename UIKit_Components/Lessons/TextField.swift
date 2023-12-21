//
//  TextField.swift
//  UIKit_Components
//
//  Created by Nurbek on 07/12/23.
//

import UIKit

class TextField: UIViewController {

    var isSecure = true
    var img = "eye.slash"
    
    lazy var usernameTextField: UITextField = {
        let username = UITextField()
        
        username.attributedPlaceholder = NSAttributedString(
            string: "Enter Username",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        username.tintColor = .systemOrange
        username.backgroundColor = .white
        username.textColor = .black
        username.layer.borderWidth = 2
        username.layer.borderColor = UIColor.black.cgColor
        username.layer.cornerRadius = 10
        username.font = .systemFont(ofSize: 20, weight: .regular)
        username.textAlignment = .center
        username.autocapitalizationType = .none
        
        return username
    }()
    
    lazy var passwordTextField: UITextField = {
        let password = UITextField()
        
        password.attributedPlaceholder = NSAttributedString(
            string: "Enter Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        password.tintColor = .systemOrange
        password.backgroundColor = .white
        password.textColor = .black
        password.layer.borderWidth = 2
        password.layer.borderColor = UIColor.black.cgColor
        password.layer.cornerRadius = 10
        password.font = .systemFont(ofSize: 20, weight: .regular)
        password.textAlignment = .center
        password.autocapitalizationType = .none
        password.isSecureTextEntry = isSecure
        
        return password
    }()
    
    lazy var confirmButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Confirm", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        button.backgroundColor = .systemOrange
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(confirmTapped), for: .touchUpInside)
        
        return button
    }()
    
    lazy var eyeButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: img)?.withConfiguration(UIImage.SymbolConfiguration(weight: .bold)), for: .normal)
        button.tintColor = .black
//        button.adjustsImageWhenHighlighted = false
        
        button.addTarget(self, action: #selector(eyeTapped), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        
        [usernameTextField, passwordTextField, confirmButton, eyeButton].forEach { item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        layout()
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.widthAnchor.constraint(equalToConstant: 280),
            usernameTextField.heightAnchor.constraint(equalToConstant: 60),
            
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 25),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: 280),
            passwordTextField.heightAnchor.constraint(equalToConstant: 60),
            
            confirmButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.widthAnchor.constraint(equalToConstant: 280),
            confirmButton.heightAnchor.constraint(equalToConstant: 60),
            
            eyeButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -15),
            eyeButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            eyeButton.widthAnchor.constraint(equalToConstant: 30),
            eyeButton.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
//    MARK: - ACTIONS
    
    @objc func eyeTapped() {
        if isSecure == true {
            isSecure = false
            img = "eye"
            passwordTextField.isSecureTextEntry = false
            eyeButton.setImage(UIImage(systemName: img)?.withConfiguration(UIImage.SymbolConfiguration(weight: .bold)), for: .normal)
        } else {
            isSecure = true
            img = "eye.slash"
            passwordTextField.isSecureTextEntry = true
            eyeButton.setImage(UIImage(systemName: img)?.withConfiguration(UIImage.SymbolConfiguration(weight: .bold)), for: .normal)
        }
    }
    
    @objc func confirmTapped() {
        guard let username = usernameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        print("Username: \(username)")
        print("Password: \(password)")
    }
    
//  ---------------------------------------------------------------------------------------------  //
    
    
    /*
    
    lazy var button1: UIButton = {
        let button = UIButton()
        
        button.setTitle("Default", for: .normal)
        button.backgroundColor = .systemIndigo
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    lazy var button2: UIButton = {
        let button = UIButton()
        
        button.setTitle("Default Outline", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.systemIndigo, for: .normal)
        button.layer.borderColor = UIColor.systemIndigo.cgColor
        button.layer.borderWidth = 1
        
        return button
    }()
    
    lazy var button3: UIButton = {
        let button = UIButton()
        
        button.setTitle("Default Round", for: .normal)
        button.backgroundColor = .systemIndigo
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        
        return button
    }()
    
    lazy var button4: UIButton = {
        let button = UIButton()
        
        button.setTitle("Outline Round", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.systemIndigo, for: .normal)
        button.layer.borderColor = UIColor.systemIndigo.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 25
        
        return button
    }()
    
    
    
    lazy var smallButton1: UIButton = {
        let button = UIButton()
        
        button.setTitle("Small Size", for: .normal)
        button.backgroundColor = .systemIndigo
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        
        return button
    }()
    
    lazy var regularButton1: UIButton = {
        let button = UIButton()
        
        button.setTitle("Regular Size", for: .normal)
        button.backgroundColor = .systemIndigo
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        
        return button
    }()
    
    lazy var largeButton1: UIButton = {
        let button = UIButton()
        
        button.setTitle("Large Size", for: .normal)
        button.backgroundColor = .systemIndigo
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        
        return button
    }()
    
    lazy var buttonView: UIView = {
        let view = UIView()
        let smallButton = UIButton()
        let regularButton = UIButton()
        let largeButton = UIButton()
        
        smallButton.setTitle("Small Size", for: .normal)
        smallButton.backgroundColor = .white
        smallButton.setTitleColor(.systemIndigo, for: .normal)
        smallButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        smallButton.layer.borderColor = UIColor.systemIndigo.cgColor
        smallButton.layer.borderWidth = 1
        
        regularButton.setTitle("Regular Size", for: .normal)
        regularButton.backgroundColor = .white
        regularButton.setTitleColor(.systemIndigo, for: .normal)
        regularButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        regularButton.layer.borderColor = UIColor.systemIndigo.cgColor
        regularButton.layer.borderWidth = 1
        
        largeButton.setTitle("Large Size", for: .normal)
        largeButton.backgroundColor = .white
        largeButton.setTitleColor(.systemIndigo, for: .normal)
        largeButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        largeButton.layer.borderColor = UIColor.systemIndigo.cgColor
        largeButton.layer.borderWidth = 1
        
        [smallButton, regularButton, largeButton].forEach { item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            smallButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            smallButton.widthAnchor.constraint(equalToConstant: 90),
            smallButton.heightAnchor.constraint(equalToConstant: 40),
            smallButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            
            regularButton.widthAnchor.constraint(equalToConstant: 140),
            regularButton.heightAnchor.constraint(equalToConstant: 50),
            regularButton.leadingAnchor.constraint(equalTo: smallButton.trailingAnchor, constant: 5),
            regularButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            largeButton.widthAnchor.constraint(equalToConstant: 140),
            largeButton.heightAnchor.constraint(equalToConstant: 80),
            largeButton.leadingAnchor.constraint(equalTo: regularButton.trailingAnchor, constant: 5),
            largeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        [button1, button2, button3, button4, smallButton1, regularButton1, largeButton1, buttonView].forEach { item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        layout()
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            button1.widthAnchor.constraint(equalToConstant: 100),
            button1.heightAnchor.constraint(equalToConstant: 50),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            button2.widthAnchor.constraint(equalToConstant: 140),
            button2.heightAnchor.constraint(equalToConstant: 50),
            button2.leadingAnchor.constraint(equalTo: button1.trailingAnchor, constant: 10),
            button2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            button3.widthAnchor.constraint(equalToConstant: 140),
            button3.heightAnchor.constraint(equalToConstant: 50),
            button3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            button3.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 10),
            
            button4.widthAnchor.constraint(equalToConstant: 140),
            button4.heightAnchor.constraint(equalToConstant: 50),
            button4.leadingAnchor.constraint(equalTo: button3.trailingAnchor, constant: 10),
            button4.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 10),
            
            smallButton1.widthAnchor.constraint(equalToConstant: 90),
            smallButton1.heightAnchor.constraint(equalToConstant: 40),
            smallButton1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            smallButton1.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            regularButton1.widthAnchor.constraint(equalToConstant: 140),
            regularButton1.heightAnchor.constraint(equalToConstant: 50),
            regularButton1.leadingAnchor.constraint(equalTo: smallButton1.trailingAnchor, constant: 5),
            regularButton1.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            largeButton1.widthAnchor.constraint(equalToConstant: 140),
            largeButton1.heightAnchor.constraint(equalToConstant: 80),
            largeButton1.leadingAnchor.constraint(equalTo: regularButton1.trailingAnchor, constant: 5),
            largeButton1.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonView.heightAnchor.constraint(equalToConstant: 100),
            buttonView.topAnchor.constraint(equalTo: regularButton1.bottomAnchor, constant: 50),
            
        ])
    }
     
     
     */

}
