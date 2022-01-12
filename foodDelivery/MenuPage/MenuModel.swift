//
//  MenuModel.swift
//  foodDelivery.app
//
//  Created by Илья Груздев on 10.01.2022.
//

import Foundation
import UIKit

enum CategoryFood {
    case pizza
    case combo
    case dessert
    case drinks
    case sauce
}
struct foodItem {
    let image: UIImage
    let name: String
    let description: String
    let price: Int
    let category: CategoryFood
}

class MenuModel {
    public let citiesList = ["Москва, Санкт-Петербург, Краснодар, Уфа"]
    
    public let categories: [(String, CategoryFood)] = [("Пицца", .pizza), ("Комбо", .combo), ("Десерты", .dessert), ("Напитки", .drinks), ("Соусы", .sauce)]
    
    public let foodList = [
        foodItem(image: UIImage(named: "testPizza")!, name: "Ветчина и грибы", description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус", price: 345, category: .pizza),
        foodItem(image: UIImage(named: "testPizza")!, name: "Баварские колбаски", description: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус", price: 345, category:  .pizza),
        foodItem(image: UIImage(named: "testPizza")!, name: "Нежный лосось", description: "Лосось, томаты черри, моцарелла, соус песто", price: 449, category: .pizza),
        foodItem(image: UIImage(named: "testPizza")!, name: "Пицца четыре сыра", description: "Соус Карбонара, Сыр Моцарелла, Сыр Пармезан, Сыр Роккфорти, Сыр Чеддер (тёртый)", price: 399, category: .pizza),
        foodItem(image: UIImage(named: "testPizza")!, name: "Пицца четыре сыра", description: "Соус Карбонара, Сыр Моцарелла, Сыр Пармезан, Сыр Роккфорти, Сыр Чеддер (тёртый)", price: 399, category: .pizza),
        foodItem(image: UIImage(named: "testPizza")!, name: "TEST COMBO 1", description: "SOME DESCRIPTION FOR COMBO", price: 1199, category: .combo),
        foodItem(image: UIImage(named: "testPizza")!, name: "TEST COMBO 2", description: "SOME DESCRIPTION FOR COMBO", price: 1199, category: .combo),
        foodItem(image: UIImage(named: "testPizza")!, name: "TEST COMBO 3", description: "SOME DESCRIPTION FOR COMBO", price: 1199, category: .combo),
        foodItem(image: UIImage(named: "testPizza")!, name: "TEST COMBO 4", description: "SOME DESCRIPTION FOR COMBO", price: 1199, category: .combo),
        foodItem(image: UIImage(named: "testPizza")!, name: "TEST COMBO 5", description: "SOME DESCRIPTION FOR COMBO", price: 1199, category: .combo),
        foodItem(image: UIImage(named: "testPizza")!, name: "TEST DESSERT 1", description: "SOME DESCRIPTION FOR DESSERT", price: 699, category: .dessert),
        foodItem(image: UIImage(named: "testPizza")!, name: "TEST DESSERT 2", description: "SOME DESCRIPTION FOR DESSERT", price: 699, category: .dessert),
        foodItem(image: UIImage(named: "testPizza")!, name: "TEST DESSERT 3", description: "SOME DESCRIPTION FOR DESSERT", price: 699, category: .dessert),
        foodItem(image: UIImage(named: "testPizza")!, name: "TEST DESSERT 4", description: "SOME DESCRIPTION FOR DESSERT", price: 699, category: .dessert),
        foodItem(image: UIImage(named: "testPizza")!, name: "TEST DESSERT 5", description: "SOME DESCRIPTION FOR DESSERT", price: 699, category: .dessert),
        foodItem(image: UIImage(named: "testPizza")!, name: "TEST DRINK 1", description: "SOME DESCRIPTION FOR DRINK", price: 99, category: .drinks),
        foodItem(image: UIImage(named: "testPizza")!, name: "TEST DRINK 2", description: "SOME DESCRIPTION FOR DRINK", price: 99, category: .drinks),
        foodItem(image: UIImage(named: "testPizza")!, name: "TEST DRINK 3", description: "SOME DESCRIPTION FOR DRINK", price: 99, category: .drinks),
        foodItem(image: UIImage(named: "testPizza")!, name: "TEST DRINK 4", description: "SOME DESCRIPTION FOR DRINK", price: 99, category: .drinks),
        foodItem(image: UIImage(named: "testPizza")!, name: "TEST DRINK 5", description: "SOME DESCRIPTION FOR DRINK", price: 99, category: .drinks),
        foodItem(image: UIImage(named: "testPizza")!, name: "TEST SAUCE 1", description: "SOME DESCRIPTION FOR SAUCE", price: 39, category: .sauce),
        foodItem(image: UIImage(named: "testPizza")!, name: "TEST SAUCE 2", description: "SOME DESCRIPTION FOR SAUCE", price: 39, category: .sauce),
        foodItem(image: UIImage(named: "testPizza")!, name: "TEST SAUCE 3", description: "SOME DESCRIPTION FOR SAUCE", price: 39, category: .sauce),
        foodItem(image: UIImage(named: "testPizza")!, name: "TEST SAUCE 4", description: "SOME DESCRIPTION FOR SAUCE", price: 39, category: .sauce),
        foodItem(image: UIImage(named: "testPizza")!, name: "TEST SAUCE 5", description: "SOME DESCRIPTION FOR SAUCE", price: 39, category: .sauce),
    ]
}
