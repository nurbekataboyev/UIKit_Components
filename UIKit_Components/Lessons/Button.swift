//
//  001_UIButton.swift
//  UIKit_Components
//
//  Created by Nurbek on 07/12/23.
//

import UIKit

class Button: UIViewController {

    let buttonTop: UIButton = {
        let button = UIButton()
        button.setTitle("Top", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonBottom: UIButton = {
        let button = UIButton()
        button.setTitle("Bottom", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonLeft: UIButton = {
        let button = UIButton()
        button.setTitle("Left", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonRight: UIButton = {
        let button = UIButton()
        button.setTitle("Right", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let buttonTopLeft: UIButton = {
        let button = UIButton()
        button.setTitle("TopLeft", for: .normal)
        button.backgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonTopRight: UIButton = {
        let button = UIButton()
        button.setTitle("TopRight", for: .normal)
        button.backgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonBottomLeft: UIButton = {
        let button = UIButton()
        button.setTitle("BottomLeft", for: .normal)
        button.backgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonBottomRight: UIButton = {
        let button = UIButton()
        button.setTitle("BottomRight", for: .normal)
        button.backgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(buttonTop)
        view.addSubview(buttonBottom)
        view.addSubview(buttonLeft)
        view.addSubview(buttonRight)
        
        view.addSubview(buttonTopLeft)
        view.addSubview(buttonTopRight)
        view.addSubview(buttonBottomLeft)
        view.addSubview(buttonBottomRight)
        
        layoutFirst()
        layoutSecond()
        
    }
    
    func layoutFirst() {
        NSLayoutConstraint.activate([
            buttonTop.widthAnchor.constraint(equalToConstant: 100),
            buttonTop.heightAnchor.constraint(equalToConstant: 50),
            buttonTop.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonTop.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            
            buttonBottom.widthAnchor.constraint(equalToConstant: 100),
            buttonBottom.heightAnchor.constraint(equalToConstant: 50),
            buttonBottom.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonBottom.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            buttonLeft.widthAnchor.constraint(equalToConstant: 100),
            buttonLeft.heightAnchor.constraint(equalToConstant: 50),
            buttonLeft.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonLeft.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            
            buttonRight.widthAnchor.constraint(equalToConstant: 100),
            buttonRight.heightAnchor.constraint(equalToConstant: 50),
            buttonRight.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonRight.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
    
    func layoutSecond() {
        NSLayoutConstraint.activate([
            buttonTopLeft.widthAnchor.constraint(equalToConstant: 100),
            buttonTopLeft.heightAnchor.constraint(equalToConstant: 50),
            buttonTopLeft.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            buttonTopLeft.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            
            buttonTopRight.widthAnchor.constraint(equalToConstant: 100),
            buttonTopRight.heightAnchor.constraint(equalToConstant: 50),
            buttonTopRight.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            buttonTopRight.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            
            buttonBottomLeft.widthAnchor.constraint(equalToConstant: 100),
            buttonBottomLeft.heightAnchor.constraint(equalToConstant: 50),
            buttonBottomLeft.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            buttonBottomLeft.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            buttonBottomRight.widthAnchor.constraint(equalToConstant: 100),
            buttonBottomRight.heightAnchor.constraint(equalToConstant: 50),
            buttonBottomRight.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            buttonBottomRight.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
    
}
