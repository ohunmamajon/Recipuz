//
//  CookingGuideCell.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/06.
//

import UIKit

class CookingGuideCell: UITableViewCell {
    static let identifier = "CookingGuideCell"
    
    let step: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let guide: UILabel = {
        let label = UILabel()
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        return label
    }()
    
   private func applyConstraints(){
       step.topAnchor.constraint(equalTo: contentView.topAnchor, constant:10).isActive = true
       step.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
       
       guide.topAnchor.constraint(equalTo: step.bottomAnchor, constant: 10).isActive = true
       guide.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
       guide.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
       guide.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
   }
    
    public func configure(with model: CookingGuide){
        step.text = "Step " + String(model.step)
        guide.text = model.guide
    }

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(step)
        contentView.addSubview(guide)
        applyConstraints()
    }

    required init(coder: NSCoder) {
       fatalError()
    }
}
