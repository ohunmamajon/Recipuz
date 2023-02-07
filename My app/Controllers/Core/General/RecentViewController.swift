//
//  RecentViewController.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2022/12/24.
//

import UIKit

class RecentViewController: UIViewController {

    
     override func viewDidLoad() {
         super.viewDidLoad()
         view.addSubview(tableView)
         view.backgroundColor = .systemBackground
         tableView.delegate = self
         tableView.dataSource = self
         RecentDataPerManager.shared.getRecentList()
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
         RecentDataPerManager.shared.getRecentList()
         tableView.reloadData()
     }
 }
 extension RecentViewController: UITableViewDelegate, UITableViewDataSource {
     
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return RecentDataPerManager.shared.recentList.count
     }
   
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.identifier, for: indexPath) as! FavoritesTableViewCell
         cell.recipeLabel.text = RecentDataPerManager.shared.recentList[indexPath.row].recipeName
         cell.recipeImage.image = UIImage(named: RecentDataPerManager.shared.recentList[indexPath.row].imageName!)
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
         let recent = RecentDataPerManager.shared.recentList[indexPath.row]
         if editingStyle == .delete {
             tableView.beginUpdates()
             
             tableView.deleteRows(at: [indexPath], with: .fade)
             RecentDataPerManager.shared.deleteRecent(recipeName: recent.recipeName ?? "")
             
             tableView.endUpdates()
         }
     }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let recent = RecentDataPerManager.shared.recentList[indexPath.row]
         let recipe = Recipes.shared.findRecipe(recipeName: recent.recipeName ?? "")
         
         let vc = RecipeViewController()
         vc.configure(with: recipe)
         self.navigationController?.pushViewController(vc, animated: true)
     
     }
 }
