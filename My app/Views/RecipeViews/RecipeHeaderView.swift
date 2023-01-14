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
    

        
        override init (frame: CGRect){
            super.init(frame: frame)
            addSubview(imageView)
            
            applyConstraints()
        }
        private func  applyConstraints(){
           
                
                imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
                imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
                imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
                
            
        }
    
    public func configure(with model: RecipeHeaderViewModel ){
        imageView.image = UIImage(named: model.imageName)
    }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            imageView.frame = bounds
        }
        
        required init?(coder: NSCoder) {
           fatalError()
        }
        
        
    

}
