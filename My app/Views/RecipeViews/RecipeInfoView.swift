//
//  RecipeInfoView.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/03.
//

import UIKit

class RecipeInfoView: UIView {
   
    let info: UILabel = {
        let label = UILabel()
        label.text = Recipes.Plov.info
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    let serving: UILabel = {
        let label = UILabel()
       
        label.text = String(Recipes.Plov.serving) + " kishi"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let preparationTime: UILabel = {
        let label = UILabel()
        
        label.text = String(Recipes.Plov.preparationTime) + " minut"
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
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        addSubview(info)
        addSubview(serving)
        addSubview(preparationTime)
       addSubview(personIcon)
        addSubview(timerIcon)
        addSubview(stackView)
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
      
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        

        info.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        info.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10).isActive = true
        info.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
    }
   
    
   
    
    required init(coder: NSCoder) {
        fatalError()
        
    }

}
