//
//  TabBarController.swift
//  foodDelivery.app
//
//  Created by Илья Груздев on 10.01.2022.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let appearance = UITabBarItem.appearance()
        
        let vc1 = UINavigationController(rootViewController: MenuViewController())
        let vc2 = UINavigationController(rootViewController: SecondVC())
        let vc3 = UINavigationController(rootViewController: ThirdVC())
        let vc4 = UINavigationController(rootViewController: FourthVC())
        
        vc1.title = "Меню"
        vc2.title = "Контакты"
        vc3.title = "Профиль"
        vc4.title = "Корзина"
        
        let images = [AppAssets.pageMenu, AppAssets.pageContacts, AppAssets.pageProfile, AppAssets.pageCart]
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        tabBar.tintColor = AppTheme.tabBarTint
        tabBar.backgroundColor = AppTheme.menuBackground
        
        guard let items = tabBar.items else { return }
        
        for x in 0..<images.count {
            items[x].image = images[x]
        }
        
    }
}

class SecondVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppTheme.backgroundMain
        title = "Контакты"
    }
}

class ThirdVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppTheme.backgroundMain
        title = "Профиль"
    }
}

class FourthVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppTheme.backgroundMain
        title = "Корзина"
    }
}
