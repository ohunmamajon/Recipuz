//
//  RecipeViewController.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/02.
//

import UIKit

class RecipeViewController: UIViewController {
    let sectionTitles: [String] = ["Qisqacha ma'lumot", "Kerakli masalliq", "Pishirish tartibi"]
    var recipeHeader: RecipeHeaderView?
    private var recipe : Recipe!
    let recipeTable : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(RecipeInfoCell.self, forCellReuseIdentifier: RecipeInfoCell.identifier)
        table.register(IngredientCell.self, forCellReuseIdentifier: IngredientCell.identifier)
        table.register(CookingGuideCell.self, forCellReuseIdentifier: CookingGuideCell.identifier)
        table.backgroundColor = .systemBackground
        return table
    } ()
    public func configure(with model: Recipe){
        recipe = model
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .label
        view.backgroundColor = .systemBackground
        view.addSubview(recipeTable)
        recipeTable.delegate = self
        recipeTable.dataSource = self
        title = recipe.title
        recipeHeader = RecipeHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 200))
        recipeHeader?.configure(with: RecipeHeaderViewModel(imageName: recipe.imageName))
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
        switch section {
        case 0:
            return 1
        case 1:
            return recipe.ingredients.count
        case 2:
            return recipe.cookingGuide.count
        default:
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: RecipeInfoCell.identifier, for: indexPath) as! RecipeInfoCell
            cell.selectionStyle = .none
            cell.configure(with: RecipeInfoViewModel(serving: recipe.serving, preparationTime: recipe.preparationTime, info: recipe.info, recipeName: recipe.title, imageName: recipe.imageName))
            tableView.separatorStyle = .none
            cell.backgroundColor = .systemBackground
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: IngredientCell.identifier, for: indexPath) as! IngredientCell
            cell.selectionStyle = .none
            tableView.separatorStyle = .none
            cell.configure(with: Ingredients(name: recipe.ingredients[indexPath.row].name, amount: recipe.ingredients[indexPath.row].amount))
            cell.backgroundColor = .systemBackground
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: CookingGuideCell.identifier, for: indexPath) as! CookingGuideCell
            cell.selectionStyle = .none
            tableView.separatorStyle = .none
            cell.configure(with: CookingGuide(step: recipe.cookingGuide[indexPath.row].step, guide:  recipe.cookingGuide[indexPath.row].guide))
            cell.backgroundColor = .systemBackground
            return cell
        }
        
    }
       

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .label
        header.textLabel?.text =  header.textLabel?.text?.capitalizeFirstLetter()
        header.contentView.backgroundColor = .systemBackground
    }
   

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       return sectionTitles[section]
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
   
}
