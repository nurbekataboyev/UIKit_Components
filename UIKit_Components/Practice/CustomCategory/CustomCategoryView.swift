//
//  CustomCategoryView.swift
//  UIKit_Components
//
//  Created by Nurbek on 07/12/23.
//

import UIKit

class CustomCategoryView: UIView {
    
    lazy var label: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        
        return label
    }()
    
    var title: String
    var isSelected = false
    static var previous: CustomCategoryView?
    
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        
        self.label.text = title
        
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 20
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewClicked))
        self.addGestureRecognizer(gesture)
        
        [label].forEach { item in
            self.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        layout()
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 40),
            self.widthAnchor.constraint(equalToConstant: label.intrinsicContentSize.width + 30),
            
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    @objc func viewClicked() {
        if self == CustomCategoryView.previous {
            self.backgroundColor = .white
            self.layer.borderWidth = 1
            self.label.textColor = .black
            CustomCategoryView.previous = nil
        } else {
            CustomCategoryView.previous?.backgroundColor = .white
            CustomCategoryView.previous?.layer.borderWidth = 1
            CustomCategoryView.previous?.label.textColor = .black

            self.backgroundColor = .systemBlue
            self.layer.borderWidth = 0
            self.label.textColor = .white
            CustomCategoryView.previous = self
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
