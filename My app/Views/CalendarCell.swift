//
//  CalendarCell.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/11.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    static let identifier = "CalendarCell"
    let dayOfMonth: UILabel = {
       let label = UILabel()
        label.text = "1"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(dayOfMonth)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        applyConstraints()
    }
    private func applyConstraints() {
        dayOfMonth.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        dayOfMonth.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
