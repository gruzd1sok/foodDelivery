//
//  SFUIDisplay.swift
//  foodDelivery.app
//
//  Created by Илья Груздев on 10.01.2022.
//

import UIKit

enum SFUIDisplay {
    case normal
    case bold
    
    public func font(size: CGFloat) -> UIFont {
        switch self {
        case .normal:
            if let font = UIFont(name: "SFUIDisplay-Light", size: size) {
                return font
            }
            return UIFont.systemFont(ofSize: size, weight: .light)
        case .bold:
            if let font = UIFont(name: "SFUIDisplay-Bold", size: size) {
                return font
            }
            return UIFont.systemFont(ofSize: size, weight: .light)
        }
    }
}
