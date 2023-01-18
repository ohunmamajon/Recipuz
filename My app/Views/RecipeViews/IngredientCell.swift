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
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    let amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = .label
        return label
    }()
    
    
   let addButton : UIButton = {
       let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
       button.setImage(UIImage(systemName: "cart.badge.plus"), for: .normal)
       button.tintColor = .label
       button.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
       button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        return button
    }()
    
    @objc func addButtonPressed(_ sender: UIButton){

        ItemDataPersistenceManager.shared.createItem(name: ingredientLabel.text ?? "")
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
        stack.distribution = .fillEqually
        stack.addArrangedSubview(ingredientLabel)
        stack.addArrangedSubview(amountLabel)
        return stack
    }()
    
    func applyConstaints(){
        
        addButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25).isActive = true
        addButton.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        stackView.centerYAnchor.constraint(equalTo:contentView.centerYAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -55).isActive = true
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
