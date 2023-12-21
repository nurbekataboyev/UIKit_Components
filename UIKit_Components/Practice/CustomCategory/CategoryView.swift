//
//  CategoryView.swift
//  UIKit_Components
//
//  Created by Nurbek on 07/12/23.
//

import UIKit

class CategoryView: UIViewController {
    
    var categoryNames = ["Vegan", "Vegeterian", "Meatball", "Kebab", "Dessert", "Snack"]
    
    lazy var containerView: UIView = {
        let containerView = UIView()
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        return containerView
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        
        return scrollView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 12
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Container View"
        
        view.addSubview(containerView)
        view.addSubview(scrollView)
        containerView.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        for name in categoryNames {
            let categoryButton = CustomCategoryView(title: name)
            
            stackView.addArrangedSubview(categoryButton)
        }
        
        layout()
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            containerView.heightAnchor.constraint(equalToConstant: 50),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            scrollView.topAnchor.constraint(equalTo: containerView.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            stackView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -12),
        ])
    }
    
}
