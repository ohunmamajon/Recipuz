//
//  CoursesViewController.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2022/12/24.
//

import UIKit
import AVKit
class CategoriesViewController: UIViewController {
    
    let sectionTitles: [String] = ["Uzbek Meals", "Western Meals", "Drinks", "Deserts", "Cakes"]
    
    var headerView : HeaderView?
 
    let coursesTable :  UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
       
        return table
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemIndigo
        view.addSubview(coursesTable)
       
        coursesTable.delegate = self
        coursesTable.dataSource = self


        headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 4))
        
  coursesTable.tableHeaderView = headerView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        coursesTable.frame = view.bounds
        
        
    }
    
    

}
extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionTitles.count
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .label
        header.contentView.backgroundColor = .systemBackground
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       return sectionTitles[section]
    }
    
    // diappearing bar
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        
//        let defaulOffset = view.safeAreaInsets.top
//        let offSet = scrollView.contentOffset.y + defaulOffset
//        navigationController?.navigationBar.transform = .init(translationX: 0, y: .minimum(0, -offSet))
//        
//    }
}
