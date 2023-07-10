//
//  ShoppingTableViewCell.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/09.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {

    static let identifier = "ShoppingTableViewCell"
     
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22)
        label.textColor = .label
        return label
    }()
    
    let image : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(systemName: "circle")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
  private func applyConstraints(){
      image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:20).isActive = true
        image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
      

      label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50).isActive = true
      label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
      label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(image)
        applyConstraints()
    }
   
    public func configure(newImage: UIImage){
        image.image = newImage
    }
    
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}
