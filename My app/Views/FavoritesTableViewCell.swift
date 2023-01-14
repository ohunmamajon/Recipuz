//
//  FavoritesTableViewCell.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/15.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

 
    static let identifier = "FavoriteTableViewCell"
    let recipeImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    let recipeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.textColor = .label
        return label
    }()
    
    
  
    
    
    
    func applyConstaints(){
        recipeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        recipeImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        recipeImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        recipeImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        
        recipeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        recipeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    public func configure(with model: FavoriteCellViewModel){
        recipeImage.image = UIImage(named: model.imageName)
        recipeLabel.text = model.text
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(recipeLabel)
        contentView.addSubview(recipeImage)
        applyConstaints()
    }

    required init(coder: NSCoder) {
       fatalError()
    }

    
}
