//
//  RecipeHeaderView.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/02.
//

import UIKit

class RecipeHeaderView: UIView {
    
        
        
    let imageView : UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let heartButton : UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .large)
        let image = UIImage(systemName: "heart.fill", withConfiguration: largeConfig)
        button.setImage(image, for: .normal)
        button.tintColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
        
        
        override init (frame: CGRect){
            super.init(frame: frame)
            addSubview(imageView)
            addSubview(heartButton)
            applyConstraints()
        }
        private func  applyConstraints(){
           
                
                imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
                imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
                imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
                
                heartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
                heartButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
               
            
        }
    
    public func configure(with model: RecipeHeaderViewModel ){
        imageView.image = model.image
    }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            imageView.frame = bounds
        }
        
        required init?(coder: NSCoder) {
           fatalError()
        }
        
        
    

}
