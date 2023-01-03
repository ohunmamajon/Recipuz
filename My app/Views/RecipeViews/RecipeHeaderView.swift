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
        view.image = Recipes.Plov.image
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
            addGradient()
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
        
        private func addGradient(){
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [
                UIColor.clear.cgColor,UIColor.clear.cgColor,UIColor.clear.cgColor, UIColor.systemBackground.cgColor
            ]
            gradientLayer.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
            layer.addSublayer(gradientLayer)
        }
        
       
        
        override func layoutSubviews() {
            super.layoutSubviews()
            imageView.frame = bounds
        }
        
        required init?(coder: NSCoder) {
           fatalError()
        }
        
        
    

}
