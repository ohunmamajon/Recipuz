//
//  RecipeCollectionViewCell.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/07.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RecipeCollectionViewCell"
        
        private let imageView: UIImageView = {
           let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            return imageView
        }()
        
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.addSubview(imageView)
        }

        required init?(coder: NSCoder) {
            fatalError()
        }
        override func layoutSubviews() {
            super.layoutSubviews()
            imageView.frame = contentView.bounds
        }
    public func configure(with model: RecipeHeaderViewModel){
        imageView.image = model.image
    }
}
