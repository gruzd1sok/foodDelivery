//
//  FoodTableViewCell.swift
//  foodDelivery.app
//
//  Created by Илья Груздев on 12.01.2022.
//

import Foundation
import UIKit

class FoodTableViewCell: UITableViewCell {
    let imgView = UIImageView()
    let nameLabel = UILabel()
    let descLabel = UILabel()
    let priceButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        
        imgView.layer.masksToBounds = true
        imgView.contentMode = .scaleAspectFit
        nameLabel.font = .systemFont(ofSize: 17)
        nameLabel.textColor = .black
        descLabel.textColor = .gray
        descLabel.numberOfLines = 0
        descLabel.font = .systemFont(ofSize: 13)
        priceButton.layer.cornerRadius = 6
        priceButton.layer.borderWidth = 1
        priceButton.layer.borderColor = AppTheme.foodButtonBorder
        priceButton.titleLabel?.font = .systemFont(ofSize: 13)
        priceButton.setTitleColor(AppTheme.foodButtonText, for: .normal)
        
        contentView.addSubview(imgView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descLabel)
        contentView.addSubview(priceButton)
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        priceButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            imgView.widthAnchor.constraint(equalToConstant: 132),
            imgView.heightAnchor.constraint(equalToConstant: 132),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            nameLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 32),
            
            descLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            descLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 32),
            descLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            priceButton.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 16),
            priceButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            priceButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
            priceButton.widthAnchor.constraint(equalToConstant: 87),
            priceButton.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
