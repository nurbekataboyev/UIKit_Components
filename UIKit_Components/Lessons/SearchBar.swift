//
//  SearchBar.swift
//  UIKit_Components
//
//  Created by Nurbek on 07/12/23.
//

import UIKit

class SearchBar: UIViewController {

    lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        
        search.autocapitalizationType = .none
        search.layer.borderColor = UIColor.white.cgColor
        search.layer.borderWidth = 5
        search.layer.cornerRadius = 20
        search.backgroundImage = UIImage()
        search.backgroundColor = .darkGray
        search.searchTextField.textColor = .white
        search.searchTextField.attributedPlaceholder = NSAttributedString(string: "What do you want to search?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray3])
        search.searchTextField.tintColor = .white // cursor color
        search.searchTextField.leftView?.tintColor = .white
        search.searchTextField.rightView?.tintColor = .white
        
        return search
    }()
    
    lazy var confirm: UIButton = {
        let button = UIButton()
        
        button.setTitle("Confirm", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .darkGray
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 5
        button.layer.cornerRadius = 20
        button.titleLabel?.textColor = .white
        
        button.addTarget(self, action: #selector(confirmTapped), for: .touchUpInside)
        
        return button
    }()
    
    lazy var image: UIImageView = {
        let img = UIImageView()
        
        img.image = UIImage(named: "p1")
        img.backgroundColor = .red
        img.layer.borderColor = UIColor.white.cgColor
        img.layer.borderWidth = 5
        img.layer.cornerRadius = 200 / 2
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.alpha = 1
        
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint
        
        [searchBar, confirm, image, ].forEach { item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        searchBar.delegate = self
        
        layout()
        
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            confirm.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 40),
            confirm.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirm.widthAnchor.constraint(equalToConstant: 360),
            confirm.heightAnchor.constraint(equalToConstant: 80),
            
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 200),
            image.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
//    MARK: - ACTIONS
    @objc func confirmTapped() {
        if let text = searchBar.text {
            print(text)
        }
    }
    
    
    
//  ---------------------------------------------------------------------------------------------  //
    
    
    /*
    
    //    task1
        lazy var img1: UIImageView = {
            let img = UIImageView()
            
            img.image = UIImage(named: "p1")
            img.backgroundColor = .black
            img.contentMode = .scaleAspectFit
            img.clipsToBounds = true
            
            return img
        }()
        
        lazy var img2: UIImageView = {
            let img = UIImageView()
            
            img.image = UIImage(named: "p2")
            img.backgroundColor = .black
            img.contentMode = .scaleAspectFit
            img.clipsToBounds = true
            
            return img
        }()
        
        lazy var img3: UIImageView = {
            let img = UIImageView()
            
            img.image = UIImage(named: "p3")
            img.backgroundColor = .black
            img.contentMode = .scaleAspectFit
            img.clipsToBounds = true
            
            return img
        }()
        
    //    task2
        lazy var img4: UIImageView = {
            let img = UIImageView()
            
            img.image = UIImage(named: "p1")
            img.backgroundColor = .black
            img.contentMode = .scaleAspectFill
            img.clipsToBounds = true
            
            return img
        }()
        
        lazy var img5: UIImageView = {
            let img = UIImageView()
            
            img.image = UIImage(named: "p2")
            img.backgroundColor = .black
            img.contentMode = .scaleAspectFill
            img.clipsToBounds = true
            
            return img
        }()
        
        lazy var img6: UIImageView = {
            let img = UIImageView()
            
            img.image = UIImage(named: "p3")
            img.backgroundColor = .black
            img.contentMode = .scaleAspectFill
            img.clipsToBounds = true
            
            return img
        }()
        
    //    task3
        lazy var ford1: UIImageView = {
            let img = UIImageView()
            
            img.image = UIImage(named: "ford")
            img.backgroundColor = .black
            img.contentMode = .scaleAspectFit
            img.clipsToBounds = true
            
            return img
        }()
        
        lazy var ford2: UIImageView = {
            let img = UIImageView()
            
            img.image = UIImage(named: "ford")
            img.backgroundColor = .black
            img.contentMode = .scaleToFill
            img.clipsToBounds = true
            
            return img
        }()
        
        lazy var ford3: UIImageView = {
            let img = UIImageView()
            
            img.image = UIImage(named: "ford")
            img.backgroundColor = .black
            img.contentMode = .scaleAspectFill
            img.clipsToBounds = true
            
            return img
        }()
        
    //    task4
        lazy var pfp1: UIImageView = {
            let img = UIImageView()
            
            img.image = UIImage(named: "circle")
            img.backgroundColor = .black
            img.contentMode = .scaleAspectFit
            img.clipsToBounds = true
            
            return img
        }()
        
        lazy var pfp2: UIImageView = {
            let img = UIImageView()
            
            img.image = UIImage(named: "circle")
            img.backgroundColor = .black
            img.contentMode = .scaleToFill
            img.clipsToBounds = true
            
            return img
        }()
        
        lazy var pfp3: UIImageView = {
            let img = UIImageView()
            
            img.image = UIImage(named: "circle")
            img.backgroundColor = .black
            img.contentMode = .scaleAspectFill
            img.clipsToBounds = true
            
            return img
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = .white
            
            task1()
    //        task2()
    //        task3()
    //        task4()
        }
        
        func task1() {
            [img1, img2, img3, ].forEach { item in
                view.addSubview(item)
                item.translatesAutoresizingMaskIntoConstraints = false
            }
            
            NSLayoutConstraint.activate([
                img1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                img1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                img1.heightAnchor.constraint(equalToConstant: 230),
                img1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                img1.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                
                img2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                img2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                img2.heightAnchor.constraint(equalToConstant: 230),
                img2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                img2.bottomAnchor.constraint(equalTo: img1.topAnchor, constant: -20),
                
                img3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                img3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                img3.heightAnchor.constraint(equalToConstant: 230),
                img3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                img3.topAnchor.constraint(equalTo: img1.bottomAnchor, constant: 20),
            ])
        }
        
        func task2() {
            [img4, img5, img6].forEach { item in
                view.addSubview(item)
                item.translatesAutoresizingMaskIntoConstraints = false
            }
            
            NSLayoutConstraint.activate([
                img4.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                img4.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
                img4.widthAnchor.constraint(equalToConstant: 100),
                img4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                img5.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                img5.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
                img5.widthAnchor.constraint(equalToConstant: 100),
                img5.trailingAnchor.constraint(equalTo: img4.leadingAnchor, constant: -20),
                
                img6.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                img6.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
                img6.widthAnchor.constraint(equalToConstant: 100),
                img6.leadingAnchor.constraint(equalTo: img4.trailingAnchor, constant: 20),
                
            ])
        }
        
        func task3() {
            [ford1, ford2, ford3].forEach { item in
                view.addSubview(item)
                item.translatesAutoresizingMaskIntoConstraints = false
            }
            
            NSLayoutConstraint.activate([
                ford1.heightAnchor.constraint(equalToConstant: 120),
                ford1.widthAnchor.constraint(equalToConstant: 120),
                ford1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                ford1.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                
                ford2.heightAnchor.constraint(equalToConstant: 120),
                ford2.widthAnchor.constraint(equalToConstant: 120),
                ford2.trailingAnchor.constraint(equalTo: ford1.leadingAnchor, constant: -10),
                ford2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                
                ford3.heightAnchor.constraint(equalToConstant: 120),
                ford3.widthAnchor.constraint(equalToConstant: 120),
                ford3.leadingAnchor.constraint(equalTo: ford1.trailingAnchor, constant: 10),
                ford3.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                
            ])
        }
        
        func task4() {
            [pfp1, pfp2, pfp3].forEach { item in
                view.addSubview(item)
                item.translatesAutoresizingMaskIntoConstraints = false
            }
            
            NSLayoutConstraint.activate([
                pfp1.widthAnchor.constraint(equalToConstant: 120),
                pfp1.heightAnchor.constraint(equalToConstant: 250),
                pfp1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                pfp1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                pfp2.widthAnchor.constraint(equalToConstant: 120),
                pfp2.heightAnchor.constraint(equalToConstant: 250),
                pfp2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                pfp2.trailingAnchor.constraint(equalTo: pfp1.leadingAnchor, constant: -10),
                
                pfp3.widthAnchor.constraint(equalToConstant: 120),
                pfp3.heightAnchor.constraint(equalToConstant: 250),
                pfp3.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                pfp3.leadingAnchor.constraint(equalTo: pfp1.trailingAnchor, constant: 10),
                
            ])
        }
     
     */
    
    
}

extension SearchBar: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
