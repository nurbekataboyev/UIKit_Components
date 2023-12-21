//
//  MyTabBar.swift
//  UIKit_Components
//
//  Created by Nurbek on 20/12/23.
//

import UIKit

class MyTabBar: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        createTabBar()
    }
    
    private func createTabBar() {
        viewControllers = [
//            createVC(viewController: home(), title: "Главная", image: UIImage(systemName: "house")),
//            createVC(viewController: search(), title: "Поиск", image: UIImage(systemName: "magnifyingglass")),
            createVC(viewController: profile(), title: "Профиль", image: UIImage(systemName: "person")),
        ]
    }
    
    private func createVC(viewController: UIViewController, title: String, image: UIImage?) -> UINavigationController {
        let navigation = UINavigationController(rootViewController: viewController)
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return navigation
    }
    
}
