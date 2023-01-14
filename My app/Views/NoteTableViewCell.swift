//
//  EventTableViewCell.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/13.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    static let identifier = "NoteTableViewCell"
 
    let noteLabel  : UILabel = {
       let label = UILabel()
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        return label
    }()
  
   
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyConstaints()
    }
    
    private func applyConstaints(){
       
        noteLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 2).isActive = true
        noteLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -2).isActive = true
        noteLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        noteLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        contentView.addSubview(noteLabel)
    
       
    }
    required init(coder: NSCoder) {
        fatalError()
    }
}
