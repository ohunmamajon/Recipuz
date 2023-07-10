//
//  CoursesViewController.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2022/12/24.
//

import UIKit
import AVKit

enum Sections: Int {
    case UzbekCuisine = 0
    case WesternCuisine = 1
    case Desserts = 2
    case Cakes = 3
}

class CategoriesViewController: UIViewController {
    

    
    let headerImageNames: [String] = ["header1", "header2", "header3", "header4", "header5", "header6"]
    
    let sectionTitles: [String] = ["Uzbek cuisine", "Western cuisine", "Salads", "Desserts"]
    
    var headerView : HeaderView?
 
    let coursesTable :  UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        table.backgroundColor = .systemBackground
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(coursesTable)
       
        coursesTable.delegate = self
        coursesTable.dataSource = self

        headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 220))
        configureHeaderView()
  coursesTable.tableHeaderView = headerView
    
    }
    
    
   
    
    private func configureHeaderView(){
        DispatchQueue.main.async { [weak self] in
            let selectedImage = self?.headerImageNames.randomElement()
            self?.headerView?.configure(name: selectedImage!)
        }
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
        cell.delegate = self
        tableView.separatorStyle = .none
        switch indexPath.section {
        case Sections.UzbekCuisine.rawValue:
            cell.configure(with: Recipes.shared.uzbekMeals)
        case Sections.WesternCuisine.rawValue:
            cell.configure(with: Recipes.shared.westernMeals)
        case Sections.Desserts.rawValue:
            cell.configure(with: Recipes.shared.salads)
        case Sections.Cakes.rawValue:
            cell.configure(with: Recipes.shared.desserts)
        default:
            return UITableViewCell()
        }
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
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
        header.contentView.backgroundColor = .systemBackground
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       return sectionTitles[section]
    }

}
extension CategoriesViewController: CollectionViewTableViewCellDelegate {
    func CollectionViewTableViewCellDidTapCell(_ cell: CollectionViewTableViewCell, currentModel: Recipe) {
        let vc = RecipeViewController()
        vc.configure(with: currentModel)
        self.navigationController?.pushViewController(vc, animated: true)
        
        let isRecent = RecentDataPerManager.shared.checkIfRecent(recipeName: currentModel.title)
        if (isRecent) {
            RecentDataPerManager.shared.makeMostRecent(recipeName: currentModel.title)
        }
        else {
            RecentDataPerManager.shared.createRecent(imageName: currentModel.imageName, recipeName: currentModel.title)
        }
    }
    
}
