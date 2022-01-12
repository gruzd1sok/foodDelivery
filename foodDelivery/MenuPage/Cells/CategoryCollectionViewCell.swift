//
//  CategoryCollectionViewCell.swift
//  foodDelivery.app
//
//  Created by Илья Груздев on 10.01.2022.
//

import Foundation
import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
            contentView.backgroundColor = AppTheme.categoryText
            categoryLabel.font = .boldSystemFont(ofSize: 13)
            categoryLabel.textColor = AppTheme.foodButtonText
            } else {
                contentView.backgroundColor = .clear
                categoryLabel.font = .systemFont(ofSize: 13)
                categoryLabel.textColor = AppTheme.categoryText
            }
        }
    }
    
    var categoryLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        categoryLabel.textColor = AppTheme.categoryText
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.font = .systemFont(ofSize: 13)
        
        contentView.layer.cornerRadius = 18
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = AppTheme.categoryBorder
        contentView.addSubview(categoryLabel)
        contentView.backgroundColor = AppTheme.backgroundMain
        
        NSLayoutConstraint.activate([
            categoryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            categoryLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
