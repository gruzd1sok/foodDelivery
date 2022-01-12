//
//  BannersCollectionViewCell.swift
//  foodDelivery.app
//
//  Created by Илья Груздев on 10.01.2022.
//

import Foundation
import UIKit

class BannersCollectionViewCell: UICollectionViewCell {
    private let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = UIImage(named: "frontBanner")!
        iv.layer.cornerRadius = 10
        iv.sizeToFit()
        return iv
    }()
    
    public func cellSize() -> CGSize {
        return CGSize(width: backgroundImageView.frame.width-30, height: backgroundImageView.frame.height)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(backgroundImageView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
}
