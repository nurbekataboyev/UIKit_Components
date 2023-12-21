//
//  Step_&_Switch_&_ActivityIndicator.swift
//  UIKit_Components
//
//  Created by Nurbek on 07/12/23.
//

import UIKit

class Step___Switch___ActivityIndicator: UIViewController {

    lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        
        stepper.value = 0
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.stepValue = 1
        stepper.addTarget(self, action: #selector(stepperTapped), for: .valueChanged)
        
        return stepper
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        
        label.text = String(stepper.value)
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        
        return label
    }()
    
//  -------------------------------------------------------------------------  //
    
    lazy var switcher: UISwitch = {
        let switcher = UISwitch()
        
        switcher.isOn = true
        switcher.onTintColor = .orange
        switcher.thumbTintColor = .white
        switcher.addTarget(self, action: #selector(switcherTapped), for: .valueChanged)
        
        return switcher
    }()
    
//  -------------------------------------------------------------------------  //
    
    lazy var spin: UIActivityIndicatorView = {
        let spin = UIActivityIndicatorView()
        
        spin.style = .large
        spin.color = .white
        spin.startAnimating()
        
        return spin
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        [stepper, label, switcher, spin, ].forEach { item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.spin.stopAnimating()
        })
        
        layout()
    }

    func layout() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stepper.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            stepper.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            switcher.topAnchor.constraint(equalTo: stepper.bottomAnchor, constant: 50),
            switcher.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            spin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spin.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
//    MARK: - ACTIONS
    @objc func stepperTapped() {
        label.text = String(stepper.value)
    }
    
    @objc func switcherTapped() {
        print(switcher.isOn)
    }
    
    
    
//  ---------------------------------------------------------------------------------------------  //

    
    /*
     
     
     
 //    1
     lazy var label1: UILabel = {
         let label = UILabel()
         
         label.text = "0"
         label.font = .systemFont(ofSize: 20, weight: .bold)
         label.textColor = .black
         label.textAlignment = .center
         label.backgroundColor = .systemYellow
         label.clipsToBounds = true
         label.layer.cornerRadius = 10
         
         return label
     }()
     
     lazy var leftButton1: UIButton = {
         let button = UIButton()
         
         button.setImage(UIImage(systemName: "minus", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)), for: .normal)
         button.tintColor = .black
         button.addTarget(self, action: #selector(leftTapped1), for: .touchUpInside)
         button.backgroundColor = .white
         button.layer.borderColor = UIColor.systemYellow.cgColor
         button.layer.borderWidth = 1
         button.layer.cornerRadius = 10
         
         return button
     }()
     
     lazy var rightButton1: UIButton = {
         let button = UIButton()
         
         button.setImage(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)), for: .normal)
         button.tintColor = .black
         button.addTarget(self, action: #selector(rightTapped1), for: .touchUpInside)
         button.backgroundColor = .white
         button.layer.borderColor = UIColor.systemYellow.cgColor
         button.layer.borderWidth = 1
         button.layer.cornerRadius = 10
         
         return button
     }()
     
 //    2
     lazy var label2: UILabel = {
         let label = UILabel()
         
         label.text = "0"
         label.font = .systemFont(ofSize: 20, weight: .bold)
         label.textColor = .black
         label.textAlignment = .center
         label.backgroundColor = .systemGreen
         label.layer.masksToBounds = true
         label.layer.cornerRadius = 15
         
         return label
     }()
     
     lazy var leftButton2: UIButton = {
         let button = UIButton()
         
         button.setImage(UIImage(systemName: "minus", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)), for: .normal)
         button.tintColor = .black
         button.addTarget(self, action: #selector(leftTapped2), for: .touchUpInside)
         button.backgroundColor = .green
         button.layer.cornerRadius = 15
         
         return button
     }()
     
     lazy var rightButton2: UIButton = {
         let button = UIButton()
         
         button.setImage(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)), for: .normal)
         button.tintColor = .black
         button.addTarget(self, action: #selector(rightTapped2), for: .touchUpInside)
         button.backgroundColor = .green
         button.layer.cornerRadius = 15
         
         return button
     }()
     
 //    3
     lazy var label3: UILabel = {
         let label = UILabel()
         
         label.text = "0"
         label.font = .systemFont(ofSize: 20, weight: .bold)
         label.textColor = .black
         label.textAlignment = .center
         label.backgroundColor = .red
         
         return label
     }()
     
     lazy var leftButton3: UIButton = {
         let button = UIButton()
         
         button.setImage(UIImage(systemName: "minus", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)), for: .normal)
         button.tintColor = .black
         button.addTarget(self, action: #selector(leftTapped3), for: .touchUpInside)
         button.backgroundColor = .systemRed
         
         return button
     }()
     
     lazy var rightButton3: UIButton = {
         let button = UIButton()
         
         button.setImage(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)), for: .normal)
         button.tintColor = .black
         button.addTarget(self, action: #selector(rightTapped3), for: .touchUpInside)
         button.backgroundColor = .systemRed
         
         return button
     }()
     
 //    TEST
     lazy var switcher: UISwitch = {
         let switcher = UISwitch()
         
         switcher.isOn = false
         switcher.addTarget(self, action: #selector(switcherTapped), for: .valueChanged)
         
         return switcher
     }()
     
 //    COMPLEX VIEW HW
     var productCount: UILabel!
     var priceLabel: UILabel!
     
     var realPrice: Int = 19230000
     
     lazy var customView: UIView = {
         let customView = UIView()
         
         customView.backgroundColor = .white
         customView.layer.cornerRadius = 10
         customView.layer.shadowColor = UIColor.black.cgColor
         customView.layer.shadowOpacity = 0.2
         customView.layer.shadowOffset = .zero
         customView.layer.shadowRadius = 10
         
         let image = UIImageView()
         image.image = UIImage(named: "macbook")
         image.contentMode = .scaleAspectFit
         
         let productName = UILabel()
         productName.text = "MacBook Pro 14(2023)\nM2/8/256GB Silver 2023"
         productName.font = .systemFont(ofSize: 15, weight: .medium)
         productName.numberOfLines = .max
         
         let rightButton = UIButton()
         rightButton.setImage(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(weight: .medium)), for: .normal)
         rightButton.tintColor = .white
         rightButton.backgroundColor = .systemIndigo
         rightButton.layer.cornerRadius = 5
         rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
         
         let productCount = UILabel()
         self.productCount = productCount
         productCount.text = "1"
         productCount.textAlignment = .center
         productCount.font = .systemFont(ofSize: 20, weight: .medium)
         
         let leftButton = UIButton()
         leftButton.setImage(UIImage(systemName: "minus", withConfiguration: UIImage.SymbolConfiguration(weight: .medium)), for: .normal)
         leftButton.tintColor = .white
         leftButton.backgroundColor = .systemIndigo
         leftButton.layer.cornerRadius = 5
         leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
         
         let nameLabel = UILabel()
         nameLabel.text = "Abduaziz"
         nameLabel.font = .systemFont(ofSize: 14, weight: .medium)
         
         let profileImage = UIImageView()
         profileImage.image = UIImage(systemName: "person.fill")
         profileImage.tintColor = .systemIndigo
         
         let uzs = UILabel()
         uzs.text = "UZS"
         uzs.font = .systemFont(ofSize: 19, weight: .regular)
         
         let price = UILabel()
         self.priceLabel = price
         price.text = String(realPrice.formatted())
         price.font = .systemFont(ofSize: 22, weight: .medium)
         
         
         [image, productName, rightButton, productCount, leftButton, nameLabel, profileImage, uzs, price, ].forEach { item in
             customView.addSubview(item)
             item.translatesAutoresizingMaskIntoConstraints = false
         }
         
         NSLayoutConstraint.activate([
             image.widthAnchor.constraint(equalToConstant: 85),
             image.heightAnchor.constraint(equalToConstant: 85),
             image.centerYAnchor.constraint(equalTo: customView.centerYAnchor),
             image.leadingAnchor.constraint(equalTo: customView.leadingAnchor),
             
             productName.topAnchor.constraint(equalTo: customView.topAnchor, constant: 10),
             productName.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 5),
             
             rightButton.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -8),
             rightButton.centerYAnchor.constraint(equalTo: customView.centerYAnchor),
             rightButton.widthAnchor.constraint(equalToConstant: 25),
             rightButton.heightAnchor.constraint(equalToConstant: 25),
             
             productCount.centerYAnchor.constraint(equalTo: customView.centerYAnchor),
             productCount.trailingAnchor.constraint(equalTo: rightButton.leadingAnchor),
             productCount.widthAnchor.constraint(equalToConstant: 30),
             
             leftButton.trailingAnchor.constraint(equalTo: productCount.leadingAnchor),
             leftButton.centerYAnchor.constraint(equalTo: customView.centerYAnchor),
             leftButton.widthAnchor.constraint(equalToConstant: 25),
             leftButton.heightAnchor.constraint(equalToConstant: 25),
             
             nameLabel.trailingAnchor.constraint(equalTo: productCount.trailingAnchor),
             nameLabel.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -12),
             
             profileImage.trailingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: -4),
             profileImage.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -12),
             profileImage.widthAnchor.constraint(equalToConstant: 24),
             profileImage.heightAnchor.constraint(equalToConstant: 24),
             
             uzs.trailingAnchor.constraint(equalTo: profileImage.leadingAnchor, constant: -10),
             uzs.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -12),
             
             price.trailingAnchor.constraint(equalTo: uzs.leadingAnchor, constant: -5),
             price.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -12),
             
         ])
         
         return customView
     }()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .white
         
         [label1, leftButton1, rightButton1, label2, leftButton2, rightButton2, label3, leftButton3, rightButton3, switcher, customView, ].forEach { item in
             view.addSubview(item)
             item.translatesAutoresizingMaskIntoConstraints = false
         }
         
         layout()
     }
     
     func layout() {
         NSLayoutConstraint.activate([
             switcher.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             switcher.centerYAnchor.constraint(equalTo: view.centerYAnchor),
             
             label1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
             label1.widthAnchor.constraint(equalToConstant: 45),
             label1.heightAnchor.constraint(equalToConstant: 45),
             
             leftButton1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
             leftButton1.trailingAnchor.constraint(equalTo: label1.leadingAnchor),
             leftButton1.widthAnchor.constraint(equalToConstant: 45),
             leftButton1.heightAnchor.constraint(equalToConstant: 45),
             
             rightButton1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
             rightButton1.leadingAnchor.constraint(equalTo: label1.trailingAnchor),
             rightButton1.widthAnchor.constraint(equalToConstant: 45),
             rightButton1.heightAnchor.constraint(equalToConstant: 45),
             
             label2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 15),
             label2.widthAnchor.constraint(equalToConstant: 45),
             label2.heightAnchor.constraint(equalToConstant: 45),
             
             leftButton2.topAnchor.constraint(equalTo: leftButton1.bottomAnchor, constant: 15),
             leftButton2.trailingAnchor.constraint(equalTo: label2.leadingAnchor),
             leftButton2.widthAnchor.constraint(equalToConstant: 45),
             leftButton2.heightAnchor.constraint(equalToConstant: 45),
             
             rightButton2.topAnchor.constraint(equalTo: rightButton1.bottomAnchor, constant: 15),
             rightButton2.leadingAnchor.constraint(equalTo: label2.trailingAnchor),
             rightButton2.widthAnchor.constraint(equalToConstant: 45),
             rightButton2.heightAnchor.constraint(equalToConstant: 45),
             
             label3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 15),
             label3.widthAnchor.constraint(equalToConstant: 45),
             label3.heightAnchor.constraint(equalToConstant: 45),
             
             leftButton3.topAnchor.constraint(equalTo: leftButton2.bottomAnchor, constant: 15),
             leftButton3.trailingAnchor.constraint(equalTo: label3.leadingAnchor),
             leftButton3.widthAnchor.constraint(equalToConstant: 45),
             leftButton3.heightAnchor.constraint(equalToConstant: 45),
             
             rightButton3.topAnchor.constraint(equalTo: rightButton2.bottomAnchor, constant: 15),
             rightButton3.leadingAnchor.constraint(equalTo: label3.trailingAnchor),
             rightButton3.widthAnchor.constraint(equalToConstant: 45),
             rightButton3.heightAnchor.constraint(equalToConstant: 45),
             
 //
             customView.topAnchor.constraint(equalTo: switcher.bottomAnchor, constant: 50),
             customView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             customView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
             customView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
             customView.heightAnchor.constraint(equalToConstant: 100),
         ])
     }
     
 //    MARK: - ACTIONS
     
     @objc func leftTapped1() {
         let number = Int(label1.text!)! - 1
         if number <= 0 {
             label1.text = String("0")
         } else {
             label1.text = String(number)
         }
     }
     
     @objc func rightTapped1() {
         let number = Int(label1.text!)! + 1
         if number >= 10 {
             label1.text = String("10")
         } else {
             label1.text = String(number)
         }
     }
     
     @objc func leftTapped2() {
         let number = Int(label2.text!)! - 1
         if number <= 0 {
             label2.text = String("0")
         } else {
             label2.text = String(number)
         }
     }
     
     @objc func rightTapped2() {
         let number = Int(label2.text!)! + 1
         if number >= 10 {
             label2.text = String("10")
         } else {
             label2.text = String(number)
         }
     }
     
     @objc func leftTapped3() {
         let number = Int(label3.text!)! - 1
         if number <= 0 {
             label3.text = String("0")
         } else {
             label3.text = String(number)
         }
     }
     
     @objc func rightTapped3() {
         let number = Int(label3.text!)! + 1
         if number >= 10 {
             label3.text = String("10")
         } else {
             label3.text = String(number)
         }
     }
     
 //    ACTION FOR TEST
     @objc func switcherTapped() {
         if switcher.isOn == false {
             view.backgroundColor = .white
             customView.layer.shadowOpacity = 0.2
         } else if switcher.isOn == true {
             view.backgroundColor = .darkGray
             customView.layer.shadowOpacity = 1
         }
     }
     
 //    COMPLEX VIEW HW
     @objc func rightButtonTapped() {
         let number = Int(productCount.text!)! + 1
         let price = 19230000
         
         if number > 10 {
             productCount.text = "10"
         } else {
             realPrice += price
             productCount.text = String(number)
             priceLabel.text = String(realPrice.formatted())
         }
     }
     
     @objc func leftButtonTapped() {
         let number = Int(productCount.text!)! - 1
         let price = 19230000
         
         if number < 0 {
             productCount.text = "0"
         } else {
             realPrice -= price
             productCount.text = String(number)
             priceLabel.text = String(realPrice.formatted())
         }
     }
     
     
     
     */
    
}
