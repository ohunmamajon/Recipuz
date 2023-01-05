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
        label.text = "Sabzi"
        label.textColor = .label
        return label
    }()
    
    let amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "4 dona"
        label.textColor = .label
        return label
    }()
    
    
   let addButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Buy", for: .normal)
       button.setTitleColor(UIColor.label, for: .normal)
        button.layer.borderWidth = 2
       button.layer.borderColor = UIColor.label.cgColor
        return button
    }()
    
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
        stack.addArrangedSubview(addButton)
        return stack
    }()
    
    func applyConstaints(){
        stackView.centerYAnchor.constraint(equalTo:contentView.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo:contentView.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8).isActive = true
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
