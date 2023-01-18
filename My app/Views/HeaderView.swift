//
//  TableHeader.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2022/12/28.
//

import UIKit

class HeaderView: UIView {

    
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    
    override  init(frame: CGRect) {
        super.init(frame: frame)
       addSubview(imageView)
        layer.addSublayer(gradientLayer)

    }
    
    
    public func configure(name: String ){
        imageView.image = UIImage(named: name)
    }
    
    private func applyConstraints(){
       
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        gradientLayer.frame = bounds

       

    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if (traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection)){
            gradientLayer.colors = [UIColor.clear.cgColor,UIColor.clear.cgColor, UIColor.systemBackground.cgColor]
        }
    }
    
    
    let  gradientLayer : CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor,UIColor.clear.cgColor, UIColor.systemBackground.cgColor]
        return gradient
    }()
       
    
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
        applyConstraints()
       
       
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
