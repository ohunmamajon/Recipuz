//
//  RecipeInfoView.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/03.
//

import UIKit

class RecipeInfoCell: UITableViewCell {
   static let identifier = "RecipeInfoCell"
    var recipeName : String?
    var imageName: String?
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
    
    
    let heartButton : UIButton = {
        let button = UIButton(type: .system)
         button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(heartButtonPressed), for: .touchUpInside)
         return button
     }()
    
    private func configureHeartButton () {
      
        let isLiked = FavoriteRecipeDataPerManager.shared.CheckIfLiked(recipeName: recipeName ?? "")
        if (isLiked) {
            heartButton.tintColor = .systemRed
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        else {
            heartButton.tintColor = .label
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    @objc func heartButtonPressed(){
        let isLiked = FavoriteRecipeDataPerManager.shared.CheckIfLiked(recipeName: recipeName ?? "")
        if (isLiked) {
            heartButton.tintColor = .label
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            FavoriteRecipeDataPerManager.shared.deleteRecipe(recipeName: recipeName!)
        }
        else {
            heartButton.tintColor = .systemRed
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            FavoriteRecipeDataPerManager.shared.createRecipe(imageName: imageName!, recipeName: recipeName!)
        }
       animateHeartButton()
    }
   
    private func animateHeartButton (){
        UIView.animate(withDuration: 0.8, delay: 0) {
                self.heartButton.alpha = 1
            self.heartButton.transform = CGAffineTransform(scaleX: 3, y: 1)
            self.heartButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
  
        contentView.addSubview(info)
        contentView.addSubview(serving)
        contentView.addSubview(preparationTime)
        contentView.addSubview(personIcon)
        contentView.addSubview(timerIcon)
        contentView.addSubview(heartButton)
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
        stack.addArrangedSubview(heartButton)
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
        serving.text = String(model.serving) + " servings"
        preparationTime.text = String(model.preparationTime) + " minutes"
        recipeName = model.recipeName
        imageName = model.imageName
    }
   
    
    required init(coder: NSCoder) {
        fatalError()
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        configureHeartButton()
    }

}
