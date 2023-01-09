//
//  CollectionViewTableViewCell.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2022/12/27.
//

import UIKit
protocol CollectionViewTableViewCellDelegate: AnyObject {
    func CollectionViewTableViewCellDidTapCell(_ cell : CollectionViewTableViewCell, currentModel: Recipe)
}

class CollectionViewTableViewCell: UITableViewCell {
    weak var delegate: CollectionViewTableViewCellDelegate?
    private var recipes: [Recipe] = [Recipe]()
    static let identifier = "CollectionViewTableViewCell"
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        layout.itemSize = CGSize(width: 152, height: 190)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: RecipeCollectionViewCell.identifier)
        return view
        
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGreen
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    public func configure(with model: [Recipe]){
        self.recipes = model
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
}
extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.identifier, for: indexPath) as! RecipeCollectionViewCell
        cell.backgroundColor = .systemCyan
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        cell.configure(with: RecipeHeaderViewModel(image: recipes[indexPath.row].image))
        return cell
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        recipes.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        
        self.delegate?.CollectionViewTableViewCellDidTapCell(self, currentModel: recipes[indexPath.row])
    }
}
