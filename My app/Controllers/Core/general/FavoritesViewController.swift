//
//  FavoritesViewController.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2022/12/24.
//

import UIKit

class FavoritesViewController: UIViewController {
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        FavoriteRecipeDataPerManager.shared.getAllRecipes()
    }
    let tableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(FavoritesTableViewCell.self, forCellReuseIdentifier: FavoritesTableViewCell.identifier)
        table.backgroundColor = .systemBackground
        return table
    }()
 
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
    override func viewWillAppear(_ animated: Bool) {
        FavoriteRecipeDataPerManager.shared.getAllRecipes()
        tableView.reloadData()
    }
}
extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavoriteRecipeDataPerManager.shared.recipeList.count
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.identifier, for: indexPath) as! FavoritesTableViewCell
        cell.recipeLabel.text = FavoriteRecipeDataPerManager.shared.recipeList[indexPath.row].recipeName
        cell.recipeImage.image = UIImage(named: FavoriteRecipeDataPerManager.shared.recipeList[indexPath.row].imageName!)
        cell.contentView.backgroundColor = .systemBackground
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
   
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let recipe = FavoriteRecipeDataPerManager.shared.recipeList[indexPath.row]
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            FavoriteRecipeDataPerManager.shared.deleteRecipe(recipeName: recipe.recipeName ?? "")
            
            tableView.endUpdates()
        }
    }
    
}
