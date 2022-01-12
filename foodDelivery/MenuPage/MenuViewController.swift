//
//  ViewController.swift
//  foodDelivery.app
//
//  Created by Илья Груздев on 10.01.2022.
//

import UIKit

class MenuViewController: UIViewController {
//    MARK: -Props
    private let model = MenuModel()
    private let topStackView = UIStackView()
    private let cityPickerButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Москва", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.sizeToFit()
        return btn
    }()
    private let cityPickerImage: UIImageView = {
        var img = UIImageView()
        img.image = AppAssets.arrowDown!
        return img
    }()
    private var bannersCollectionView: UICollectionView!
    private var categoryCollectionView: UICollectionView!
    private var foodTableView: UITableView!
    private var cityPicker: UIPickerView!
    private var lastContentOffset: CGFloat = 0
    private var backgroundView: UIView!
    
    
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = AppTheme.backgroundMain
        UISetup()
        
        cityPickerButton.addTarget(self, action: #selector(showPicker), for: .touchUpInside)
        categoryCollectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .left)
    }
    
    @objc func showPicker() {
        cityPicker.isHidden = false
    }
    
    func UISetup() {
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topStackView)
        
        cityPickerButton.translatesAutoresizingMaskIntoConstraints = false
        cityPickerImage.translatesAutoresizingMaskIntoConstraints = false
        topStackView.addSubview(cityPickerButton)
        topStackView.addSubview(cityPickerImage)
        
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: view.topAnchor),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topStackView.bottomAnchor.constraint(equalTo: cityPickerImage.bottomAnchor),
            
            cityPickerButton.topAnchor.constraint(equalTo: topStackView.topAnchor, constant: 60),
            cityPickerButton.leadingAnchor.constraint(equalTo: topStackView.leadingAnchor, constant: 16),
            cityPickerImage.centerYAnchor.constraint(equalTo: cityPickerButton.centerYAnchor),
            cityPickerImage.leadingAnchor.constraint(equalTo: cityPickerButton.trailingAnchor, constant: 8)
        ])
        
        
        cityPicker = UIPickerView(frame: .zero)
        cityPicker.translatesAutoresizingMaskIntoConstraints = false
        cityPicker.backgroundColor = .black
        cityPicker.delegate = self
        cityPicker.dataSource = self
        cityPicker.isHidden = true
        view.addSubview(cityPicker)
        
        NSLayoutConstraint.activate([
            cityPicker.topAnchor.constraint(equalTo: cityPickerButton.bottomAnchor),
            cityPicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 2),
            cityPicker.widthAnchor.constraint(equalToConstant: 200)
        ])
        
//        MARK: - bannersCollectionView
        let bannersLayout = UICollectionViewFlowLayout()
        bannersLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 10)
        bannersLayout.scrollDirection = .horizontal
        
        bannersCollectionView = UICollectionView(frame: .zero, collectionViewLayout: bannersLayout)
        bannersCollectionView.register(BannersCollectionViewCell.self, forCellWithReuseIdentifier: "banners")
        
        bannersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        bannersCollectionView.isUserInteractionEnabled = true
        bannersCollectionView.frame = view.bounds
        bannersCollectionView.delegate = self
        bannersCollectionView.dataSource = self
        bannersCollectionView.showsHorizontalScrollIndicator = false
        bannersCollectionView.backgroundColor = AppTheme.backgroundMain
        
        view.addSubview(bannersCollectionView)
        
        NSLayoutConstraint.activate([
            bannersCollectionView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 29),
            bannersCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bannersCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bannersCollectionView.heightAnchor.constraint(equalToConstant: 112)
        ])
    
        //        MARK: - categoryCollectionView
        let categoryLayout = UICollectionViewFlowLayout()
        categoryLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 10)
        categoryLayout.scrollDirection = .horizontal
        
        categoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: categoryLayout)
        categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "category")
        
        categoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        categoryCollectionView.isUserInteractionEnabled = true
        categoryCollectionView.frame = view.bounds
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.showsHorizontalScrollIndicator = false
        categoryCollectionView.backgroundColor = AppTheme.backgroundMain
        
        view.addSubview(categoryCollectionView)
        
        NSLayoutConstraint.activate([
            categoryCollectionView.topAnchor.constraint(equalTo: bannersCollectionView.bottomAnchor, constant: 24),
            categoryCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            categoryCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 50)
        ])
    
        
        //   MARK: -foodTableView
        foodTableView = UITableView(frame: .zero)
        foodTableView.register(FoodTableViewCell.self, forCellReuseIdentifier: "food")
        foodTableView.translatesAutoresizingMaskIntoConstraints = false
        foodTableView.frame = view.bounds
        foodTableView.delegate = self
        foodTableView.dataSource = self
        foodTableView.rowHeight = UITableView.automaticDimension
        foodTableView.separatorColor = AppTheme.tableViewSeparatorColor
        foodTableView.showsVerticalScrollIndicator = false
        foodTableView.backgroundColor = UIColor.white
        foodTableView.layer.cornerRadius = 24
        foodTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        view.addSubview(foodTableView)
        
        NSLayoutConstraint.activate([
            foodTableView.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 24),
            foodTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            foodTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            foodTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

    }
}

extension MenuViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == bannersCollectionView {
            print("clicked at \(indexPath.item) banner")
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "category", for: indexPath) as! CategoryCollectionViewCell
            cell.contentView.backgroundColor = AppTheme.categoryText
            cell.categoryLabel.font = .boldSystemFont(ofSize: 13)
            cell.categoryLabel.textColor = AppTheme.foodButtonText
            let category = model.categories[indexPath.item].1
            let index = model.foodList.firstIndex(where: {$0.category == category})!
            foodTableView.scrollToRow(at: IndexPath(row: index, section: 0), at: .top, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == bannersCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "banners", for: indexPath) as! BannersCollectionViewCell
            return cell.cellSize()
        } else {
            let someX = UILabel()
            someX.text = model.categories[indexPath.item].0
            someX.sizeToFit()
            return CGSize(width: someX.frame.width+49, height: someX.frame.height+16)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bannersCollectionView {
            return 3
        } else {
            return model.categories.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == bannersCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "banners", for: indexPath) as! BannersCollectionViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "category", for: indexPath) as! CategoryCollectionViewCell
            cell.categoryLabel.text = model.categories[indexPath.item].0
            return cell
        }
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.foodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "food", for: indexPath) as! FoodTableViewCell
        cell.imgView.image = model.foodList[indexPath.item].image
        cell.nameLabel.text = model.foodList[indexPath.item].name
        cell.descLabel.text = model.foodList[indexPath.item].description
        cell.priceButton.setTitle("от \(model.foodList[indexPath.item].price) р", for: .normal)
        return cell
    }

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
       lastContentOffset = scrollView.contentOffset.y
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if lastContentOffset <= 200 {
            UIView.animate(withDuration: 0.25, animations: { [weak self] in
                self?.bannersCollectionView.alpha = 1.0
                self?.bannersCollectionView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: nil)
//            categoryCollectionView.topAnchor.constraint(equalTo: bannersCollectionView.bottomAnchor, constant: 24).isActive = true
//            categoryCollectionView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 29).isActive = false
        } else if lastContentOffset < scrollView.contentOffset.y {
            UIView.animate(withDuration: 0.25, animations: { [weak self] in
                self?.bannersCollectionView.alpha = 0
                self?.bannersCollectionView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            }, completion: nil)
//            categoryCollectionView.topAnchor.constraint(equalTo: bannersCollectionView.bottomAnchor, constant: 24).isActive = false
//            categoryCollectionView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 29).isActive = true
        }
    }
}

extension MenuViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return model.citiesList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return model.citiesList[row]
    }
}




