//
//  ScrollView.swift
//  UIKit_Components
//
//  Created by Nurbek on 07/12/23.
//

import UIKit

class ScrollView: UIViewController {

    lazy var viewContainer: UIView = {
        let viewContainer = UIView()
        
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
//        viewContainer.backgroundColor = .black
        
        return viewContainer
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.backgroundColor = .red
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        return scrollView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.backgroundColor = .green
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 50
        
        return stackView
    }()
    
    lazy var image1: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "square", withConfiguration: UIImage.SymbolConfiguration(weight: .black))
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var image2: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "square", withConfiguration: UIImage.SymbolConfiguration(weight: .black))
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var image3: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "square", withConfiguration: UIImage.SymbolConfiguration(weight: .black))
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var image4: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "square", withConfiguration: UIImage.SymbolConfiguration(weight: .black))
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var image5: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "square", withConfiguration: UIImage.SymbolConfiguration(weight: .black))
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var image6: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "square", withConfiguration: UIImage.SymbolConfiguration(weight: .black))
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var image7: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "square", withConfiguration: UIImage.SymbolConfiguration(weight: .black))
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        view.addSubview(viewContainer)
        view.addSubview(scrollView)
        viewContainer.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(image1)
        stackView.addArrangedSubview(image2)
        stackView.addArrangedSubview(image3)
        stackView.addArrangedSubview(image4)
        stackView.addArrangedSubview(image5)
        stackView.addArrangedSubview(image6)
        stackView.addArrangedSubview(image7)
        
        [image1, image2, image3, image4, image5, image6, image7].forEach { item in
            NSLayoutConstraint.activate([
                item.widthAnchor.constraint(equalToConstant: 300),
                item.heightAnchor.constraint(equalToConstant: 300),
            ])
        }
        
        layout()
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            viewContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            viewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            viewContainer.heightAnchor.constraint(equalToConstant: 400),
            viewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollView.topAnchor.constraint(equalTo: viewContainer.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
//            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 50),
//            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -50),
        ])
    }
    
    
    
//  ---------------------------------------------------------------------------------------------  //
    
    

    /*
     //task1
     
     
     lazy var containerView: UIView = {
         let containerView = UIView()
         
         containerView.translatesAutoresizingMaskIntoConstraints = false
 //        containerView.backgroundColor = .black
         
         return containerView
     }()
     
     lazy var scrollView: UIScrollView = {
         let scrollView = UIScrollView()
         
         scrollView.translatesAutoresizingMaskIntoConstraints = false
 //        scrollView.backgroundColor = .systemGray
         
         scrollView.showsVerticalScrollIndicator = false
         
         return scrollView
     }()
     
     lazy var stackView: UIStackView = {
         let stackView = UIStackView()
         
         stackView.translatesAutoresizingMaskIntoConstraints = false
 //        stackView.backgroundColor = .green
         
         stackView.axis = .vertical
         stackView.spacing = 15
         stackView.alignment = .center
         stackView.distribution = .equalSpacing
         
         return stackView
     }()
     
     lazy var color1: UIView = {
         let color = UIView()
         
         color.translatesAutoresizingMaskIntoConstraints = false
         color.backgroundColor = .systemGray
         
         return color
     }()
     
     lazy var color2: UIView = {
         let color = UIView()
         
         color.translatesAutoresizingMaskIntoConstraints = false
         color.backgroundColor = .systemGray
         
         return color
     }()
     
     lazy var color3: UIView = {
         let color = UIView()
         
         color.translatesAutoresizingMaskIntoConstraints = false
         color.backgroundColor = .systemGray
         
         return color
     }()
     
     lazy var color4: UIView = {
         let color = UIView()
         
         color.translatesAutoresizingMaskIntoConstraints = false
         color.backgroundColor = .systemGray
         
         return color
     }()
     
     lazy var color5: UIView = {
         let color = UIView()
         
         color.translatesAutoresizingMaskIntoConstraints = false
         color.backgroundColor = .systemGray
         
         return color
     }()
     
     lazy var color6: UIView = {
         let color = UIView()
         
         color.translatesAutoresizingMaskIntoConstraints = false
         color.backgroundColor = .systemGray
         
         return color
     }()
     
     lazy var color7: UIView = {
         let color = UIView()
         
         color.translatesAutoresizingMaskIntoConstraints = false
         color.backgroundColor = .systemGray
         
         return color
     }()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .white
         
         view.addSubview(containerView)
         view.addSubview(scrollView)
         containerView.addSubview(scrollView)
         scrollView.addSubview(stackView)
         
         stackView.addArrangedSubview(color1)
         stackView.addArrangedSubview(color2)
         stackView.addArrangedSubview(color3)
         stackView.addArrangedSubview(color4)
         stackView.addArrangedSubview(color5)
         stackView.addArrangedSubview(color6)
         stackView.addArrangedSubview(color7)
         
         [color1, color2, color3, color4, color5, color6, color7].forEach { item in
             NSLayoutConstraint.activate([
                 item.heightAnchor.constraint(equalToConstant: 150),
                 item.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
             ])
         }
         
         layout()
     }
     
     func layout() {
         NSLayoutConstraint.activate([
             containerView.topAnchor.constraint(equalTo: view.topAnchor),
             containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             
             scrollView.topAnchor.constraint(equalTo: containerView.topAnchor),
             scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
             scrollView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
             scrollView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
             
             stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
             stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
             stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
             stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
         ])
     }
     
     
     
     */
    
    
    
//  ---------------------------------------------------------------------------------------------  //
    
    

    /*
     //task2
     
     
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
         stackView.spacing = 15
         
         return stackView
     }()
     
     lazy var color1: UIView = {
         let color = UIView()
         
         color.translatesAutoresizingMaskIntoConstraints = false
         color.backgroundColor = .systemGray
         
         return color
     }()
     
     lazy var color2: UIView = {
         let color = UIView()
         
         color.translatesAutoresizingMaskIntoConstraints = false
         color.backgroundColor = .systemGray
         
         return color
     }()
     
     lazy var color3: UIView = {
         let color = UIView()
         
         color.translatesAutoresizingMaskIntoConstraints = false
         color.backgroundColor = .systemGray
         
         return color
     }()
     
     lazy var color4: UIView = {
         let color = UIView()
         
         color.translatesAutoresizingMaskIntoConstraints = false
         color.backgroundColor = .systemGray
         
         return color
     }()
     
     lazy var color5: UIView = {
         let color = UIView()
         
         color.translatesAutoresizingMaskIntoConstraints = false
         color.backgroundColor = .systemGray
         
         return color
     }()
     
     lazy var color6: UIView = {
         let color = UIView()
         
         color.translatesAutoresizingMaskIntoConstraints = false
         color.backgroundColor = .systemGray
         
         return color
     }()
     
     lazy var color7: UIView = {
         let color = UIView()
         
         color.translatesAutoresizingMaskIntoConstraints = false
         color.backgroundColor = .systemGray
         
         return color
     }()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .white
         
         view.addSubview(containerView)
         view.addSubview(scrollView)
         containerView.addSubview(scrollView)
         scrollView.addSubview(stackView)
         
         stackView.addArrangedSubview(color1)
         stackView.addArrangedSubview(color2)
         stackView.addArrangedSubview(color3)
         stackView.addArrangedSubview(color4)
         stackView.addArrangedSubview(color5)
         stackView.addArrangedSubview(color6)
         stackView.addArrangedSubview(color7)
         
         [color1, color2, color3, color4, color5, color6, color7].forEach { item in
             NSLayoutConstraint.activate([
                 item.widthAnchor.constraint(equalToConstant: 200),
                 item.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
             ])
         }
         
         layout()
     }
     
     func layout() {
         NSLayoutConstraint.activate([
             containerView.topAnchor.constraint(equalTo: view.topAnchor),
             containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             
             scrollView.topAnchor.constraint(equalTo: containerView.topAnchor),
             scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
             scrollView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
             scrollView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
             
             stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
             stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
             stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
             stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
         ])
     }
     
     
     
     */
    
    
    
//  ---------------------------------------------------------------------------------------------  //
    
    

    /*
     //task3
     
     
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
     
     lazy var image1: UIImageView = {
         let image = UIImageView()
         
         image.translatesAutoresizingMaskIntoConstraints = false
         image.image = UIImage(named: "p1")
         image.contentMode = .scaleAspectFill
         image.layer.cornerRadius = 15
         image.clipsToBounds = true
         
         return image
     }()
     
     lazy var image2: UIImageView = {
         let image = UIImageView()
         
         image.translatesAutoresizingMaskIntoConstraints = false
         image.image = UIImage(named: "p2")
         image.contentMode = .scaleAspectFill
         image.layer.cornerRadius = 15
         image.clipsToBounds = true
         
         return image
     }()
     
     lazy var image3: UIImageView = {
         let image = UIImageView()
         
         image.translatesAutoresizingMaskIntoConstraints = false
         image.image = UIImage(named: "p3")
         image.contentMode = .scaleAspectFill
         image.layer.cornerRadius = 15
         image.clipsToBounds = true
         
         return image
     }()
     
     lazy var image4: UIImageView = {
         let image = UIImageView()
         
         image.translatesAutoresizingMaskIntoConstraints = false
         image.image = UIImage(named: "p1")
         image.contentMode = .scaleAspectFill
         image.layer.cornerRadius = 15
         image.clipsToBounds = true
         
         return image
     }()
     
     lazy var image5: UIImageView = {
         let image = UIImageView()
         
         image.translatesAutoresizingMaskIntoConstraints = false
         image.image = UIImage(named: "p2")
         image.contentMode = .scaleAspectFill
         image.layer.cornerRadius = 15
         image.clipsToBounds = true
         
         return image
     }()
     
     lazy var image6: UIImageView = {
         let image = UIImageView()
         
         image.translatesAutoresizingMaskIntoConstraints = false
         image.image = UIImage(named: "p3")
         image.contentMode = .scaleAspectFill
         image.layer.cornerRadius = 15
         image.clipsToBounds = true
         
         return image
     }()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .white
         
         view.addSubview(containerView)
         view.addSubview(scrollView)
         containerView.addSubview(scrollView)
         scrollView.addSubview(stackView)
         
         stackView.addArrangedSubview(image1)
         stackView.addArrangedSubview(image2)
         stackView.addArrangedSubview(image3)
         stackView.addArrangedSubview(image4)
         stackView.addArrangedSubview(image5)
         stackView.addArrangedSubview(image6)
         
         [image1, image2, image3, image4, image5, image6].forEach { item in
             NSLayoutConstraint.activate([
                 item.heightAnchor.constraint(equalToConstant: 180),
                 item.widthAnchor.constraint(equalToConstant: 350),
             ])
         }
         
         layout()
     }
     
     func layout() {
         NSLayoutConstraint.activate([
             containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
             containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             containerView.heightAnchor.constraint(equalToConstant: 180),
             
             scrollView.topAnchor.constraint(equalTo: containerView.topAnchor),
             scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
             scrollView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
             scrollView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
             
             stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
             stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
             stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 12),
             stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -12),
         ])
     }
     
     
     
     */
    
    
    
//  ---------------------------------------------------------------------------------------------  //
    
    

    /*
     //task4
     
     
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
     
     lazy var stackView1: UIStackView = {
         let stackView = UIStackView()
         
         stackView.translatesAutoresizingMaskIntoConstraints = false
         stackView.axis = .horizontal
         stackView.distribution = .equalSpacing
         stackView.alignment = .center
         stackView.spacing = 0
         
         return stackView
     }()
     
     lazy var stackView2: UIStackView = {
         let stackView = UIStackView()
         
         stackView.translatesAutoresizingMaskIntoConstraints = false
         stackView.axis = .horizontal
         stackView.distribution = .equalSpacing
         stackView.alignment = .center
         stackView.spacing = 0
         
         return stackView
     }()
     
     lazy var image1: UIImageView = {
         let image = UIImageView()
         
         image.translatesAutoresizingMaskIntoConstraints = false
         image.image = UIImage(named: "p1")
         image.contentMode = .scaleAspectFill
         image.clipsToBounds = true
         
         return image
     }()
     
     lazy var image2: UIImageView = {
         let image = UIImageView()
         
         image.translatesAutoresizingMaskIntoConstraints = false
         image.image = UIImage(named: "p2")
         image.contentMode = .scaleAspectFill
         image.clipsToBounds = true
         
         return image
     }()
     
     lazy var image3: UIImageView = {
         let image = UIImageView()
         
         image.translatesAutoresizingMaskIntoConstraints = false
         image.image = UIImage(named: "p3")
         image.contentMode = .scaleAspectFill
         image.clipsToBounds = true
         
         return image
     }()
     
     lazy var image4: UIImageView = {
         let image = UIImageView()
         
         image.translatesAutoresizingMaskIntoConstraints = false
         image.image = UIImage(named: "p1")
         image.contentMode = .scaleAspectFill
         image.clipsToBounds = true
         
         return image
     }()
     
     lazy var image5: UIImageView = {
         let image = UIImageView()
         
         image.translatesAutoresizingMaskIntoConstraints = false
         image.image = UIImage(named: "p2")
         image.contentMode = .scaleAspectFill
         image.clipsToBounds = true
         
         return image
     }()
     
     lazy var image6: UIImageView = {
         let image = UIImageView()
         
         image.translatesAutoresizingMaskIntoConstraints = false
         image.image = UIImage(named: "p3")
         image.contentMode = .scaleAspectFill
         image.clipsToBounds = true
         
         return image
     }()
     
     lazy var image7: UIImageView = {
         let image = UIImageView()
         
         image.translatesAutoresizingMaskIntoConstraints = false
         image.image = UIImage(named: "p1")
         image.contentMode = .scaleAspectFill
         image.clipsToBounds = true
         
         return image
     }()
     
     lazy var image8: UIImageView = {
         let image = UIImageView()
         
         image.translatesAutoresizingMaskIntoConstraints = false
         image.image = UIImage(named: "p2")
         image.contentMode = .scaleAspectFill
         image.clipsToBounds = true
         
         return image
     }()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .white
         
         view.addSubview(containerView)
         view.addSubview(scrollView)
         containerView.addSubview(scrollView)
         
         scrollView.addSubview(stackView1)
         scrollView.addSubview(stackView2)
         
         stackView1.addArrangedSubview(image1)
         stackView1.addArrangedSubview(image2)
         stackView1.addArrangedSubview(image3)
         stackView1.addArrangedSubview(image4)
         
         stackView2.addArrangedSubview(image5)
         stackView2.addArrangedSubview(image6)
         stackView2.addArrangedSubview(image7)
         stackView2.addArrangedSubview(image8)
         
         [image1, image2, image3, image4, image5, image6, image7, image8].forEach { item in
             NSLayoutConstraint.activate([
                 item.heightAnchor.constraint(equalToConstant: 130),
                 item.widthAnchor.constraint(equalToConstant: 130),
             ])
         }
         
         layout()
     }
     
     func layout() {
         NSLayoutConstraint.activate([
             containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
             containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             containerView.heightAnchor.constraint(equalToConstant: 260),
             
             scrollView.topAnchor.constraint(equalTo: containerView.topAnchor),
             scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
             scrollView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
             scrollView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
             
             stackView1.topAnchor.constraint(equalTo: scrollView.topAnchor),
             stackView1.heightAnchor.constraint(equalToConstant: 130),
             stackView1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
             stackView1.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
             
             stackView2.topAnchor.constraint(equalTo: stackView1.bottomAnchor),
             stackView2.heightAnchor.constraint(equalToConstant: 130),
             stackView2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
             stackView2.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
         ])
     }
     
     
     
     */

}
