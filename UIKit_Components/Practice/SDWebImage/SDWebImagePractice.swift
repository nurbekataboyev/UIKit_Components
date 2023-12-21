//
//  SDWebImagePractice.swift
//  UIKit_Components
//
//  Created by Nurbek on 12/12/23.
//

import UIKit
import SDWebImage

class SDWebImagePractice: UIViewController {

    lazy var textField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Enter image URL here"
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = Constants.small
        textField.setLeftPadding(Constants.small)
        textField.setRightPadding(Constants.small)
        
        return textField
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        
        button.setTitle("Download", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = Constants.small
        button.addTarget(self, action: #selector(downloadClicked), for: .touchUpInside)
        
        return button
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        
//        image.image = UIImage(systemName: "square")
        image.contentMode = .scaleAspectFit
//        image.layer.cornerRadius = Constants.small
//        image.layer.borderWidth = 2
//        image.layer.borderColor = UIColor.black.cgColor
        
        return image
    }()
    
    lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        
//        spinner.layer.cornerRadius = Constants.small
//        spinner.backgroundColor = .systemGray
        spinner.color = .systemGray
        spinner.style = .large
        
        return spinner
    }()
    
    lazy var alert: UIAlertController = {
        let alert = UIAlertController(title: "URL is not valid", message: "There is no image for the provided URL, please try with another URL", preferredStyle: .alert)
        return alert
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        [textField, button, image, spinner].forEach { item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        layout()
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.medium),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.widthAnchor.constraint(equalToConstant: Constants.width),
            textField.heightAnchor.constraint(equalToConstant: Constants.height),
            
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: Constants.medium),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: Constants.width),
            button.heightAnchor.constraint(equalToConstant: Constants.height),
            
            image.topAnchor.constraint(equalTo: button.bottomAnchor, constant: Constants.medium),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: Constants.width),
            image.heightAnchor.constraint(equalToConstant: Constants.width),
            
            spinner.centerXAnchor.constraint(equalTo: image.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: image.centerYAnchor),
        ])
    }
    
    func downloadImage() {
        guard let textFieldText = textField.text else { return }
        let imageURL = URL(string: textFieldText)
        self.image.sd_setImage(with: imageURL, placeholderImage: UIImage(systemName: "triangle")) { _, error, _, _ in
            self.spinner.stopAnimating()
            if error != nil {
                self.present(self.alert, animated: true)
            }
        }
    }
    
    @objc func downloadClicked() {
        spinner.startAnimating()
        downloadImage()
    }
    
}
