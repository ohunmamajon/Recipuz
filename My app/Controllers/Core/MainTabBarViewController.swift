//
//  ViewController.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2022/12/23.
//

import UIKit


class MainTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        bringTabBar()
       
    }
    func bringTabBar(){
   
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: ShoppingViewController())
        let vc3 = UINavigationController(rootViewController: PlannerViewController())
        let vc4 = UINavigationController(rootViewController: SettingsViewController())
      
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "checklist")
        vc3.tabBarItem.image = UIImage(systemName: "calendar.badge.plus")
        vc4.tabBarItem.image = UIImage(systemName: "gear")
        
    
        
        vc1.title = "Home"
        vc2.title = "Shopping"
        vc3.title = "Planner"
        vc4.title = "Settings"
        
       setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        navigationController?.pushViewController(vc2, animated: true)
        tabBar.tintColor = .label
    }
}

