//
//  AppTheme.swift
//  foodDelivery.app
//
//  Created by Илья Груздев on 10.01.2022.
//

import Foundation
import UIKit

enum AppTheme {
    //MARK: - Window background color
    public static var backgroundMain: UIColor {
        return UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
    }
    
    public static var menuBackground: UIColor {
        return UIColor(red: 0.958, green: 0.958, blue: 0.958, alpha: 1)
    }
    
    public static var tabBarTint: UIColor {
        return UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1)
    }
    
    public static var categoryText: UIColor {
        return UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4)
    }
    
    public static var categoryBorder: CGColor {
        return UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4).cgColor
    }
    
    public static var tableViewSeparatorColor: UIColor {
        return UIColor(red: 0.953, green: 0.961, blue: 0.976, alpha: 1)
    }
    
    public static var foodButtonBorder: CGColor {
        return UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1).cgColor
    }
    
    public static var foodButtonText: UIColor {
        return UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1)
    }
}

