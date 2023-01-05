//
//  RecipeViewController.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/02.
//

import UIKit

class RecipeViewController: UIViewController {
    
    var recipeHeader: RecipeHeaderView?
    
    let recipeTable : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(RecipeInfoCell.self, forCellReuseIdentifier: RecipeInfoCell.identifier)
        table.register(IngredientCell.self, forCellReuseIdentifier: IngredientCell.identifier)
        table.register(CookingGuideCell.self, forCellReuseIdentifier: CookingGuideCell.identifier)
        return table
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .label
        view.backgroundColor = .systemBackground
        view.addSubview(recipeTable)
        recipeTable.delegate = self
        recipeTable.dataSource = self
        recipeHeader = RecipeHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 200))
        recipeTable.tableHeaderView = recipeHeader
        
    }
 
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        recipeTable.frame = view.bounds
    }
}
 
  
extension RecipeViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: RecipeInfoCell.identifier, for: indexPath) as! RecipeInfoCell
            cell.selectionStyle = .none
            tableView.separatorStyle = .none
            cell.backgroundColor = .systemBackground
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: IngredientCell.identifier, for: indexPath) as! IngredientCell
            cell.selectionStyle = .none
            tableView.separatorStyle = .none
            cell.backgroundColor = .systemBackground
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: CookingGuideCell.identifier, for: indexPath) as! CookingGuideCell
            cell.selectionStyle = .none
            tableView.separatorStyle = .none
            cell.backgroundColor = .systemBackground
            return cell
        }
        
    }
        func scrollViewDidScroll(_ scrollView: UIScrollView) {

            let defaulOffset = view.safeAreaInsets.top
            let offSet = scrollView.contentOffset.y + defaulOffset
            navigationController?.navigationBar.transform = .init(translationX: 0, y: .minimum(0, -offSet))

        }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .label
        header.contentView.backgroundColor = .systemBackground
    }
   

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       return Recipes.Plov.title
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
   
}
