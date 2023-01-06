//
//  RecipeInfoView.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/03.
//

import UIKit

class RecipeInfoCell: UITableViewCell {
   static let identifier = "RecipeInfoCell"
    let info: UILabel = {
        let label = UILabel()
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    let serving: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let preparationTime: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let personIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person")
       
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .label
        return image
    }()
    let timerIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "timer")
        image.tintColor = .label
        
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
  
        contentView.addSubview(info)
        contentView.addSubview(serving)
        contentView.addSubview(preparationTime)
        contentView.addSubview(personIcon)
        contentView.addSubview(timerIcon)
        contentView.addSubview(stackView)
         applyConstraints()
        
    }
    lazy var stackView1: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(personIcon)
        stack.addArrangedSubview(serving)
        return stack
    }()
    lazy var stackView2: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(timerIcon)
        stack.addArrangedSubview(preparationTime)
        return stack
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 40
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(stackView1)
        stack.addArrangedSubview(stackView2)
        return stack
    }()

    private func applyConstraints(){
      
        stackView.centerXAnchor.constraint(equalTo:  contentView.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        

        info.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        info.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10).isActive = true
        info.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        info.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
   
    public func configure(with model: RecipeInfoViewModel){
        info.text = model.info
        serving.text = String(model.serving) + " kishi"
        preparationTime.text = String(model.preparationTime) + " minut"
    }
   
    
    required init(coder: NSCoder) {
        fatalError()
        
    }

}
