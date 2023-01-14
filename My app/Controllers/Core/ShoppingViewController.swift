//
//  ShoppingViewController.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2022/12/23.
//

import UIKit

class ShoppingViewController: UIViewController {
    
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(ShoppingTableViewCell.self, forCellReuseIdentifier: ShoppingTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        ItemDataPersistenceManager.shared.getAllItems()
        tableView.frame = view.bounds
        tableView.autoresizingMask =  .flexibleWidth
        title = "Shopping List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress(sender:)))
        tableView.addGestureRecognizer(longPress)
        longPress.minimumPressDuration = 0.6
        NotificationCenter.default.addObserver(forName: NSNotification.Name("ingredientAdded"), object: nil, queue: nil) {[weak self] _ in
            ItemDataPersistenceManager.shared.getAllItems()
            self?.tableView.reloadData()
        }
    }
    
    @objc private func longPress(sender: UILongPressGestureRecognizer){
        if sender.state == .began {
            let touchPoint = sender.location(in: tableView)
            if let indexPath = tableView.indexPathForRow(at: touchPoint){
                let item = ItemDataPersistenceManager.shared.models[indexPath.row]
                let sheet = UIAlertController(title: "Edit", message: nil, preferredStyle: .actionSheet)
                
                sheet.addAction(UIAlertAction.init(title: "Cancel", style: .cancel))
                sheet.addAction(UIAlertAction.init(title: "Edit", style: .default, handler: { [weak self] _ in
                    let alert = UIAlertController(title: "Edit Item", message: "Edit your item", preferredStyle: .alert)
                    
                    alert.addTextField(configurationHandler: nil)
                    alert.textFields?.first?.text  = item.name
                    alert.addAction(UIAlertAction.init(title: "Save", style: .cancel, handler: {[weak self] _ in
                        guard let field = alert.textFields?.first, let newName = field.text, !newName.isEmpty else {
                            return
                        }
                        ItemDataPersistenceManager.shared.updateItem(item: item, newName: newName)
                        self?.tableView.reloadData()
                    }))
                    self?.present(alert, animated: true)
                }))
                sheet.addAction(UIAlertAction.init(title: "Delete", style: .destructive, handler: {[weak self] _  in
                    ItemDataPersistenceManager.shared.deleteItem(item: item)
                    self?.tableView.reloadData()
                }))
                present(sheet, animated: true)
            }
        }
    }
    
    
    @objc private func didTapAdd(){
        let alert = UIAlertController(title: "New Item", message: "Enter new item", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction.init(title: "Submit", style: .cancel, handler: { _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
                return
            }
            ItemDataPersistenceManager.shared.createItem(name: text)
            self.tableView.reloadData()
        }))
        present(alert, animated: true)
    }
    
   
}


extension ShoppingViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return ItemDataPersistenceManager.shared.models.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingTableViewCell.identifier, for: indexPath) as! ShoppingTableViewCell
            let model = ItemDataPersistenceManager.shared.models[indexPath.row]
            cell.label.attributedText = cell.label.text?.removeStrikeThrough()
            cell.label.text = model.name
            let newImage = UIImage(systemName: "checkmark.circle.fill")!
            if model.isDone == true {
                
                DispatchQueue.main.async {
                    cell.configure(newImage: newImage)
                    cell.label.attributedText = cell.label.text?.strikeThrough()
                }
            }
            else {
                
                DispatchQueue.main.async {
                    cell.configure(newImage: UIImage(systemName: "circle")!)
                    cell.label.attributedText = cell.label.text?.removeStrikeThrough()
                }
            }
            return cell
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            let item = ItemDataPersistenceManager.shared.models[indexPath.row]
            ItemDataPersistenceManager.shared.updateDone(item: item)
            tableView.reloadData()
            
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            50
        }
        
        func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            return .delete
        }
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            let item = ItemDataPersistenceManager.shared.models[indexPath.row]
            if editingStyle == .delete {
                tableView.beginUpdates()
                
                tableView.deleteRows(at: [indexPath], with: .fade)
                ItemDataPersistenceManager.shared.deleteItem(item: item)
                
                tableView.endUpdates()
            }
        }
    }
