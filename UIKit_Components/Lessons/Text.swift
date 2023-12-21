//
//  Text.swift
//  UIKit_Components
//
//  Created by Nurbek on 07/12/23.
//

import UIKit

class Text: UIViewController {

    lazy var label: UILabel = {
        let label = UILabel()
        
        label.text = "Lesson 2"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.backgroundColor = .systemGray4
        label.numberOfLines = .max
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var label1: UILabel = {
        let label = UILabel()
        
        label.text = "Something to write here to just make a space to check if everthing is working or not"
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .black
        label.backgroundColor = .systemGray4
        label.numberOfLines = .max
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        
        textView.text = "This is TextView - Something to write here to just make a space to check if everthing is working or not Something to write here to just make a space to check if everthing is working or not Something to write here to just make a space to check if everthing is working or not Something to write here to just make a space to check if everthing is working or not Something to write here to just make a space to check if everthing is working or not Something to write here to just make a space to check if everthing is working or not Something to write here to just make a space to check if everthing is working or not Something to write here to just make a space to check if everthing is working or not"
        textView.font = .systemFont(ofSize: 17, weight: .regular)
        textView.textColor = .white
        textView.backgroundColor = .black
        textView.textAlignment = .center
        textView.isScrollEnabled = true
        textView.isEditable = false
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        [label, label1, textView, ].forEach { item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        layout()
        
    }
    
    func layout() {
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            
            label1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 15),
            
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 15),
            textView.heightAnchor.constraint(equalToConstant: 100),
        ])
        
    }
    
    
//  ---------------------------------------------------------------------------------------------  //
    
    /*
    
    
    /*
    lazy var label1: UILabel = {
        let label1 = UILabel()
        
        label1.text = "First Text"
        label1.font = .systemFont(ofSize: 22, weight: .heavy)
        label1.backgroundColor = .systemBlue
        label1.textColor = .white
        label1.textAlignment = .center
        label1.numberOfLines = .max
        
        return label1
    }()
    
    lazy var label2: UILabel = {
        let label2 = UILabel()
        
        label2.text = "Something to write here to just make a space to check if everthing is working or not Something to write here to just make a space to check if everthing is working or not Something to write here to just make a space to check if everthing is working or not Something to write here to just make a space to check if everthing is working or not"
        label2.font = .systemFont(ofSize: 18, weight: .medium)
        label2.backgroundColor = .systemGreen
        label2.textColor = .white
        label2.textAlignment = .center
        label2.numberOfLines = 3
        
        return label2
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        
        textView.text = "This is Text View - Something to write here to just make a space to check if everthing is working or not. Something to write here to just make a space to check if everthing is working or not."
        textView.font = .systemFont(ofSize: 20, weight: .semibold)
        textView.backgroundColor = .systemRed
        textView.textColor = .white
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .center
        
        return textView
    }()
    
    lazy var label3: UILabel = {
        let label3 = UILabel()
        
        label3.text = "Simple Label"
        label3.font = .systemFont(ofSize: 20, weight: .medium)
        label3.textColor = .black
        label3.textAlignment = .center
        label3.layer.borderWidth = 2
        
        return label3
    }()
    
    lazy var label4: UILabel = {
        let label4 = UILabel()
        
        label4.text = """
This is the first line
This is the second line
"""
        label4.font = .systemFont(ofSize: 20, weight: .medium)
        label4.textColor = .systemOrange
        label4.numberOfLines = .max
        label4.layer.borderWidth = 2
        
        return label4
    }()
    
    lazy var label5: UILabel = {
        let label5 = UILabel()
        
        label5.text = """
This is just
This is just a long
This is just a long text
"""
        label5.font = .systemFont(ofSize: 20, weight: .medium)
        label5.textColor = .purple
        label5.numberOfLines = .max
        label5.textAlignment = .right
        label5.layer.borderWidth = 2
        
        return label5
    }()
     */
    
    
//    MARK: - HOME WORK
    lazy var label1: UILabel = {
        let label = UILabel()
        
        label.text = "By tapping Done, you agree to our terms of police and etc."
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 2
        
        return label
    }()
    
    lazy var label2: UILabel = {
        let label = UILabel()
        
        label.text = "privacy policy"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .systemBlue
        label.numberOfLines = 2
        
        return label
    }()
    
    lazy var label3: UILabel = {
        let label = UILabel()
        
        label.text = "and"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black
        
        return label
    }()
    
    lazy var label4: UILabel = {
        let label = UILabel()
        
        label.text = "terms of service."
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .systemBlue
        
        return label
    }()
    
    lazy var textView1: UITextView = {
        let textView = UITextView()
        
        textView.text = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
        textView.font = .systemFont(ofSize: 20, weight: .regular)
        textView.textColor = .black
        textView.backgroundColor = .green
        textView.isScrollEnabled = true
        textView.isEditable = false
        
        return textView
    }()
    
    lazy var textView2: UITextView = {
        let textView = UITextView()
        
        textView.text = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
        textView.font = .systemFont(ofSize: 20, weight: .regular)
        textView.textColor = .black
        textView.backgroundColor = .red
        textView.isScrollEnabled = true
        textView.isEditable = false
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        /*
        [label1, label2, textView, label3, label4, label5, ].forEach { item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
         */
        
//        hw1
        [label1, label2, label3, label4].forEach { item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
//        hw2
//        [textView1, textView2].forEach { item in
//            view.addSubview(item)
//            item.translatesAutoresizingMaskIntoConstraints = false
//        }
        
        layout()
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            /*
            label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            label1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 20),
            label2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            textView.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView.heightAnchor.constraint(equalToConstant: 50),
            
            label3.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20),
            label3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            label4.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 20),
            label4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            label5.topAnchor.constraint(equalTo: label4.bottomAnchor, constant: 20),
            label5.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
             */
            
//            hw1
            label1.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            label1.widthAnchor.constraint(equalToConstant: 120),
            
            label2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label2.leadingAnchor.constraint(equalTo: label1.trailingAnchor, constant: 5),
            label2.widthAnchor.constraint(equalToConstant: 60),
            
            label3.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label3.leadingAnchor.constraint(equalTo: label2.trailingAnchor, constant: 5),
            label3.widthAnchor.constraint(equalToConstant: 30),
            
            label4.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label4.leadingAnchor.constraint(equalTo: label3.trailingAnchor, constant: 5),
            label4.widthAnchor.constraint(equalToConstant: 120),
            
//            hw2
//            textView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
//            textView1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10),
//            textView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            textView1.widthAnchor.constraint(equalToConstant: 150),
//
//            textView2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
//            textView2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10),
//            textView2.leadingAnchor.constraint(equalTo: textView1.trailingAnchor, constant: 10),
//            textView2.widthAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    
    */
    
}
