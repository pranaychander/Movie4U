//
//  CustomTabBarController.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 14/03/22.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    init() {
        super.init(nibName: nil, bundle: nil)
        AppLogger.memoryInitLog()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        AppLogger.memoryDeinitLog()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let navigationController = viewControllers?[selectedIndex] as? UINavigationController
        navigationController?.popToRootViewController(animated: false)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let nav = viewController as? UINavigationController {
            nav.popToRootViewController(animated: false)
        }
        return true
    }
    
    func goTo(selectedTab tab: AppTabs) {
        selectedIndex = tab.rawValue
    }
}

enum AppTabs: Int {
    case Home = 0
    case Favourites = 1
    case Settings = 2
}
