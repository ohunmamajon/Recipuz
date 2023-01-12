//
//  EventTableViewCell.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/13.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    static let identifier = "EventTableViewCell"
 
    let label : UILabel = {
       let label = UILabel()
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        return label
    }()
  
    override func layoutSubviews() {
        super.layoutSubviews()
       applyConstaints()
    }
    private func applyConstaints(){
        
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
    }
    required init(coder: NSCoder) {
        fatalError()
    }
}
