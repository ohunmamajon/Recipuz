//
//  HomeViewController.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2022/12/23.
//

import UIKit


let categoriesVC = CategoriesViewController()
let favoritesVC = FavoritesViewController()
let recentVC = RecentViewController()
let settingsVC = SettingsViewController()

class HomeViewController: UIViewController {
    let items = ["Categories", "Favorites", "Recent"]
    let haptic = UISelectionFeedbackGenerator()
    
    lazy var segmentControl : UISegmentedControl = {
        let view = UISegmentedControl(items: items)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.selectedSegmentIndex = 0
        view.addTarget(self, action: #selector(topMenuChanged), for: .valueChanged)
        return view
    }()
    

    
    override func viewDidLoad()  {
        super.viewDidLoad()
    
        settingsVC.checkSwitchState()
    
        haptic.prepare()
        view.backgroundColor = .systemBackground
//        title = "Shef"
        navigationItem.titleView = segmentControl
    
        
        setup()
       
        
    }
    
    func setup(){

        addChild(categoriesVC)
        addChild(favoritesVC)
        addChild(recentVC)
        
        self.view.addSubview(categoriesVC.view)
        self.view.addSubview(favoritesVC.view)
        self.view.addSubview(recentVC.view)
        
        categoriesVC.didMove(toParent: self)
        favoritesVC.didMove(toParent: self)
        recentVC.didMove(toParent: self)
        
        
        
        categoriesVC.view.frame.origin.x = 0
        favoritesVC.view.frame.origin.x = 0
        
        recentVC.view.frame.origin.x = 0
       
        favoritesVC.view.isHidden = true
        recentVC.view.isHidden = true
    }
    override func viewDidLayoutSubviews() {
       guard let navBar = navigationController?.navigationBar else {return}
        
        categoriesVC.view.frame.origin.y =  navBar.frame.maxY
        favoritesVC.view.frame.origin.y =  categoriesVC.view.frame.origin.y
        recentVC.view.frame.origin.y =  categoriesVC.view.frame.origin.y
        
        
    }
    @objc func topMenuChanged(){
        
        categoriesVC.view.isHidden = true
        favoritesVC.view.isHidden = true
        recentVC.view.isHidden = true
        haptic.selectionChanged()
        switch segmentControl.selectedSegmentIndex{
        case 0:
            categoriesVC.view.isHidden = false
        case 1:
            favoritesVC.view.isHidden = false
        case 2:
            recentVC.view.isHidden = false
        default:
            view.backgroundColor = .systemRed
        }
    }
}
