//
//  IngredientCell.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/04.
//

import UIKit

class IngredientCell: UITableViewCell {

    static let identifier = "IngredientTableViewCell"
    let ingredientLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        return label
    }()
    
    let amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        return label
    }()
    
    
   let addButton : UIButton = {
       let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
       button.setTitle("Add", for: .normal)
       button.backgroundColor = .systemGreen
        button.layer.borderWidth = 1
       button.tintColor = .white
        button.layer.cornerRadius = 8
       button.layer.masksToBounds = true
       button.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        button.layer.borderColor = UIColor.label.cgColor
        return button
    }()
    
    @objc func addButtonPressed(_ sender: UIButton){
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            sender.alpha = 1.0
        }
        
        DataPersistenceManager.shared.createItem(name: ingredientLabel.text ?? "")
        NotificationCenter.default.post(name:NSNotification.Name( "ingredientAdded"), object: nil)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if (traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection)){
            addButton.layer.borderColor = UIColor.label.cgColor
        }
    }
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.distribution = .fillEqually
        stack.addArrangedSubview(ingredientLabel)
        stack.addArrangedSubview(amountLabel)
        stack.addArrangedSubview(addButton)
        return stack
    }()
    
    func applyConstaints(){
        stackView.centerYAnchor.constraint(equalTo:contentView.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo:contentView.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8).isActive = true
        stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1).isActive = true
    }
    
    public func configure(with model: Ingredients){
        ingredientLabel.text = model.name
        amountLabel.text =  model.amount
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(ingredientLabel)
        contentView.addSubview(amountLabel)
        contentView.addSubview(addButton)
        contentView.addSubview(stackView)
        applyConstaints()
    }

    required init(coder: NSCoder) {
       fatalError()
    }
    
    
}
