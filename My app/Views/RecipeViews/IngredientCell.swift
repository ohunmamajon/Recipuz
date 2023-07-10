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
       button.contentEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
       button.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        return button
    }()
    
    
    @objc func addButtonPressed(_ sender: UIButton){

        
        ItemDataPersistenceManager.shared.createItem(name: ingredientLabel.text ?? "")
        NotificationCenter.default.post(name:NSNotification.Name( "ingredientAdded"), object: nil)
        animateAddButton()
    }
    
    private func animateAddButton (){
        UIView.animate(withDuration: 0.5, delay: 0) {
                self.addButton.alpha = 1
                self.addButton.transform = CGAffineTransform(scaleX: 4, y: 4)
            self.addButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if (traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection)){
            addButton.tintColor = UIColor.label
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
        
        addButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        addButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        addButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -55).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
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

