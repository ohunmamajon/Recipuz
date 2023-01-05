//
//  CookingGuideCell.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/06.
//

import UIKit

class CookingGuideCell: UITableViewCell {
    static let identifier = "CookingGuideCell"
    
    let step: UILabel = {
        let label = UILabel()
        label.text = "Step 1"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        return label
    }()
    
    let instruction: UILabel = {
        let label = UILabel()
        label.text = "Cooking is fun.. happy stomach Cooking is fun.. happy stomach Cooking is fun.. happy stomach Cooking is fun.. happy stomach Cooking is fun.. happy stomach Cooking is fun.. happy stomach Cooking is fun.. happy stomach Cooking is fun.. happy stomach Cooking is fun.. happy stomach Cooking is fun.. happy stomach Cooking is fun.. happy stomach Cooking is fun.. happy stomach Cooking is fun.. happy stomach"
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        return label
    }()
    
   private func applyConstraints(){
       step.topAnchor.constraint(equalTo: contentView.topAnchor, constant:10).isActive = true
       step.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
       
       instruction.topAnchor.constraint(equalTo: step.bottomAnchor, constant: 10).isActive = true
       instruction.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
       instruction.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
       instruction.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
   }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(step)
        contentView.addSubview(instruction)
        applyConstraints()
    }

    required init(coder: NSCoder) {
       fatalError()
    }
}
