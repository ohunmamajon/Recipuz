//
//  HomeViewController.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2022/12/23.
//

import UIKit

let firstVC = CoursesViewController()
let secondVC = CategoriesViewController()
let thirdVC = FavoritesViewController()
let fourthVC = RecentViewController()

class HomeViewController: UIViewController {
    let items = ["Courses" , "Categories", "Favorites", "Recent"]
    let haptic = UISelectionFeedbackGenerator()
    
    lazy var segmentControl : UISegmentedControl = {
        let view = UISegmentedControl(items: items)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.selectedSegmentIndex = 0
        view.addTarget(self, action: #selector(topMenuChanged), for: .valueChanged)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        haptic.prepare()
        view.backgroundColor = .systemBackground
        view.addSubview(segmentControl)
        setup()
        NSLayoutConstraint.activate([
            segmentControl.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            segmentControl.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: segmentControl.trailingAnchor, multiplier: 4)])
    }
    
    func setup(){

        addChild(firstVC)
        addChild(secondVC)
        addChild(thirdVC)
        addChild(fourthVC)
        
        self.view.addSubview(firstVC.view)
        self.view.addSubview(secondVC.view)
        self.view.addSubview(thirdVC.view)
        self.view.addSubview(fourthVC.view)
        
        firstVC.didMove(toParent: self)
        secondVC.didMove(toParent: self)
        thirdVC.didMove(toParent: self)
        fourthVC.didMove(toParent: self)
        
        firstVC.view.frame = CGRect(x: 20, y: 200, width: 400, height: 600)
        secondVC.view.frame =  CGRect(x: 20, y: 200, width: 400, height: 600)
        thirdVC.view.frame =  CGRect(x: 20, y: 200, width: 400, height: 600)
        fourthVC.view.frame =  CGRect(x: 20, y: 200, width: 400, height: 600)
        
        secondVC.view.isHidden = true
        thirdVC.view.isHidden = true
        fourthVC.view.isHidden = true
    }

    @objc func topMenuChanged(){
        
        firstVC.view.isHidden = true
        secondVC.view.isHidden = true
        thirdVC.view.isHidden = true
        fourthVC.view.isHidden = true
        haptic.selectionChanged()
        switch segmentControl.selectedSegmentIndex{
        case 0:
            firstVC.view.isHidden = false
        case 1:
            secondVC.view.isHidden = false
        case 2:
            thirdVC.view.isHidden = false
        case 3:
            fourthVC.view.isHidden = false
        default:
            view.backgroundColor = .systemRed
        }
    }
}
