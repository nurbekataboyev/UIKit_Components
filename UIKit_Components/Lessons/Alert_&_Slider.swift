//
//  Alert_&_Slider.swift
//  UIKit_Components
//
//  Created by Nurbek on 07/12/23.
//

import UIKit

class Alert___Slider: UIViewController {

    lazy var alertStyle: UIAlertController = {
        let alert = UIAlertController(title: "Are you sure you want to delete your photo?", message: "After deleting this photo, you can never get back this image, so if you don't want this process to be happen, you can cancel operation.", preferredStyle: .alert)
        
//        alert.view.layer.backgroundColor = UIColor.white.cgColor
//        alert.view.layer.borderColor = UIColor.black.cgColor
//        alert.view.layer.borderWidth = 0
//        alert.view.layer.cornerRadius = 15
//        alert.view.tintColor = .green
        
        return alert
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        
        button.setTitle("Show Alert", for: .normal)
        button.backgroundColor = .systemOrange
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 4
        button.layer.cornerRadius = 20
        
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        return button
    }()
    
//  ---------------------------------------------  //
    
    lazy var label: UILabel = {
        let label = UILabel()
        
        label.text = String(slider.value)
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    lazy var slider: UISlider = {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        slider.minimumTrackTintColor = .systemCyan
        slider.maximumTrackTintColor = .darkGray
        slider.thumbTintColor = .systemBlue
        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        
        return slider
    }()
    
    lazy var sliderButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Set to Default", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 4
        button.layer.cornerRadius = 20
        
        button.addTarget(self, action: #selector(sliderButtonClicked), for: .touchUpInside)
        
        return button
    }()
    
    lazy var leftButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "minus", withConfiguration: UIImage.SymbolConfiguration(weight: .black)), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(leftButtonClicked), for: .touchUpInside)
        
        return button
    }()
    
    lazy var rightButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(weight: .black)), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(rightButtonClicked), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        [button, slider, sliderButton, label, leftButton, rightButton].forEach { item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        alertStyle.addAction(UIAlertAction(
            title: "Cancel", style: .cancel,
            handler: { _ in
                print("Cancel")
            }
        ))
        
        alertStyle.addAction(UIAlertAction(
            title: "Back to Home", style: .default,
            handler: { _ in
                print("Back to Home")
            }
        ))
        
        alertStyle.addAction(UIAlertAction(
            title: "Delete", style: .destructive,
            handler: { _ in
                print("Delete")
            }
        ))
        
        layout()
    }
    
//    MARK: - METHODS
    func layout() {
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 300),
            button.heightAnchor.constraint(equalToConstant: 80),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            slider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            sliderButton.widthAnchor.constraint(equalToConstant: 300),
            sliderButton.heightAnchor.constraint(equalToConstant: 80),
            sliderButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sliderButton.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 40),
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: -40),
            
            leftButton.widthAnchor.constraint(equalToConstant: 30),
            leftButton.heightAnchor.constraint(equalToConstant: 30),
            leftButton.centerYAnchor.constraint(equalTo: slider.centerYAnchor),
            leftButton.trailingAnchor.constraint(equalTo: slider.leadingAnchor, constant: -10),
            
            rightButton.widthAnchor.constraint(equalToConstant: 30),
            rightButton.heightAnchor.constraint(equalToConstant: 30),
            rightButton.centerYAnchor.constraint(equalTo: slider.centerYAnchor),
            rightButton.leadingAnchor.constraint(equalTo: slider.trailingAnchor, constant: 10),
        ])
    }
    
//    MARK: - ACTIONS
    @objc func buttonClicked() {
        self.present(alertStyle, animated: true)
    }
    
    @objc func sliderButtonClicked() {
        label.text = String(50.0)
        slider.value = 50.0
    }
    
    @objc func sliderChanged() {
        label.text = String(slider.value)
    }
    
    @objc func leftButtonClicked() {
        let number = slider.value - 10
        if number >= 0, number <= 100 {
            label.text = String(number)
            slider.value = number
        } else if number < 0 {
            label.text = String(0.0)
            slider.value = 0.0
        }
    }
    
    @objc func rightButtonClicked() {
        let number = slider.value + 10
        if number >= 0, number <= 100 {
            label.text = String(number)
            slider.value = number
        } else if number > 100 {
            label.text = String(100.0)
            slider.value = 100.0
        }
    }
    
    
    
//  ---------------------------------------------------------------------------------------------  //
    
    /*
    
    lazy var alert1: UIAlertController = {
        let alert = UIAlertController(title: "Sign Out?", message: "You can always access your content by signing back in", preferredStyle: .alert)
        
        return alert
    }()
    
    lazy var alert2: UIAlertController = {
        let alert = UIAlertController(title: "Title", message: "Please Select an Option", preferredStyle: .actionSheet)
        
        return alert
    }()
    
    lazy var alert3: UIAlertController = {
        let alert = UIAlertController(title: "Sign Out?", message: "You can always access your content by signing back in", preferredStyle: .alert)
        
        return alert
    }()
    
    lazy var alert4: UIAlertController = {
        let alert = UIAlertController(title: "Alert", message: "Alert with more than 2 buttons", preferredStyle: .alert)
        
        return alert
    }()
    
    lazy var button1: UIButton = {
        let button = UIButton()
        
        button.setTitle("1. Simple Alert", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        
        return button
    }()
    
    lazy var button2: UIButton = {
        let button = UIButton()
        
        button.setTitle("2. Simple Action Sheet", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
        
        return button
    }()
    
    lazy var button3: UIButton = {
        let button = UIButton()
        
        button.setTitle("3. Alert With Distructive Button", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(button3Tapped), for: .touchUpInside)
        
        return button
    }()
    
    lazy var button4: UIButton = {
        let button = UIButton()
        
        button.setTitle("4. Alert WIrh More Than 2 Buttons", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(button4Tapped), for: .touchUpInside)
        
        return button
    }()
    
//  -------------------------------------------------------------------  //
    
    lazy var label1: UILabel = {
        let label = UILabel()
        
        label.text = "Mute | Unmute"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    lazy var slider1: UISlider = {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        
        return slider
    }()
    
    lazy var leftButton1: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "minus", withConfiguration: UIImage.SymbolConfiguration(weight: .black)), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(leftButtonClicked1), for: .touchUpInside)
        
        return button
    }()
    
    lazy var rightButton1: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(weight: .black)), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(rightButtonClicked1), for: .touchUpInside)
        
        return button
    }()
    
    lazy var label2: UILabel = {
        let label = UILabel()
        
        label.text = "-10 | +10"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    lazy var slider2: UISlider = {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        
        return slider
    }()
    
    lazy var leftButton2: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "minus", withConfiguration: UIImage.SymbolConfiguration(weight: .black)), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(leftButtonClicked2), for: .touchUpInside)
        
        return button
    }()
    
    lazy var rightButton2: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(weight: .black)), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(rightButtonClicked2), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        task1()
        task2()
    }
    
    func task1() {
        alert1.addAction(UIAlertAction(
            title: "Cancel", style: .cancel,
            handler: { _ in
                print("Cancel")
            }))
        
        alert1.addAction(UIAlertAction(
            title: "Sign Out", style: .default,
            handler: { _ in
                print("Sign Out")
            }))
        
        alert2.addAction(UIAlertAction(
            title: "Approve", style: .default,
            handler: { _ in
                print("Approve")
            }))
        
        alert2.addAction(UIAlertAction(
            title: "Edit", style: .default,
            handler: { _ in
                print("Edit")
            }))
        
        alert2.addAction(UIAlertAction(
            title: "Delete", style: .destructive,
            handler: { _ in
                print("Delete")
            }))
        
        alert2.addAction(UIAlertAction(
            title: "Dismiss", style: .cancel,
            handler: { _ in
                print("Dismiss")
            }))
        
        alert3.addAction(UIAlertAction(
            title: "Cancel", style: .cancel,
            handler: { _ in
                print("Cancel")
            }))
        
        alert3.addAction(UIAlertAction(
            title: "Sign Out", style: .destructive,
            handler: { _ in
                print("Sign Out")
            }))
        
        alert4.addAction(UIAlertAction(
            title: "Default", style: .default,
            handler: { _ in
                print("Default")
            }))
        
        alert4.addAction(UIAlertAction(
            title: "Cancel", style: .cancel,
            handler: { _ in
                print("Cancel")
            }))
        
        alert4.addAction(UIAlertAction(
            title: "Destructive", style: .destructive,
            handler: { _ in
                print("Destructive")
            }))
        
        [button1, button2, button3, button4, ].forEach { item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button1.heightAnchor.constraint(equalToConstant: 80),
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            button2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button2.heightAnchor.constraint(equalToConstant: 80),
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor),
            
            button3.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button3.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button3.heightAnchor.constraint(equalToConstant: 80),
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor),
            
            button4.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button4.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button4.heightAnchor.constraint(equalToConstant: 80),
            button4.topAnchor.constraint(equalTo: button3.bottomAnchor),
        ])
        
    }
    
    func task2() {
        
        [slider1, leftButton1, rightButton1, label1, slider2, leftButton2, rightButton2, label2, ].forEach { item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            label1.bottomAnchor.constraint(equalTo: slider1.topAnchor, constant: -30),
            label1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            slider1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            slider1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            slider1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            leftButton1.widthAnchor.constraint(equalToConstant: 30),
            leftButton1.heightAnchor.constraint(equalToConstant: 30),
            leftButton1.centerYAnchor.constraint(equalTo: slider1.centerYAnchor),
            leftButton1.trailingAnchor.constraint(equalTo: slider1.leadingAnchor, constant: -10),
            
            rightButton1.widthAnchor.constraint(equalToConstant: 30),
            rightButton1.heightAnchor.constraint(equalToConstant: 30),
            rightButton1.centerYAnchor.constraint(equalTo: slider1.centerYAnchor),
            rightButton1.leadingAnchor.constraint(equalTo: slider1.trailingAnchor, constant: 10),
            
            label2.topAnchor.constraint(equalTo: slider1.bottomAnchor, constant: 50),
            label2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            slider2.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 30),
            slider2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            slider2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            leftButton2.widthAnchor.constraint(equalToConstant: 30),
            leftButton2.heightAnchor.constraint(equalToConstant: 30),
            leftButton2.centerYAnchor.constraint(equalTo: slider2.centerYAnchor),
            leftButton2.trailingAnchor.constraint(equalTo: slider2.leadingAnchor, constant: -10),
            
            rightButton2.widthAnchor.constraint(equalToConstant: 30),
            rightButton2.heightAnchor.constraint(equalToConstant: 30),
            rightButton2.centerYAnchor.constraint(equalTo: slider2.centerYAnchor),
            rightButton2.leadingAnchor.constraint(equalTo: slider2.trailingAnchor, constant: 10),
        ])
    }
//    MARK: - ACTIONS
    
    @objc func button1Tapped() {
        self.present(alert1, animated: true)
    }
    
    @objc func button2Tapped() {
        self.present(alert2, animated: true)
    }
    
    @objc func button3Tapped() {
        self.present(alert3, animated: true)
    }
    
    @objc func button4Tapped() {
        self.present(alert4, animated: true)
    }
    
//  ------------------------------------  //
    
    @objc func leftButtonClicked1() {
        slider1.value = 0
    }
    
    @objc func rightButtonClicked1() {
        slider1.value = 100
    }
    
    @objc func leftButtonClicked2() {
        let number = slider2.value - 10
        if number >= 0, number <= 100 {
            slider2.value = number
        } else if number < 0 {
            slider2.value = 0
        }
        print(slider2.value)
    }
    
    @objc func rightButtonClicked2() {
        let number = slider2.value + 10
        if number >= 0, number <= 100 {
            slider2.value = number
        } else if number > 100 {
            slider2.value = 100
        }
        print(slider2.value)
    }
     
     
     */

}
