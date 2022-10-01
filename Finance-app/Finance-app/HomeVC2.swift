//
//  HomeVC2.swift
//  Finance-app
//
//  Created by Fazil P on 29/09/2022.
//

import UIKit

class HomeVC2: UIViewController {
    
    
    @IBOutlet var Titleview: UIView!
    @IBOutlet var TitleLabel: UILabel!
    @IBOutlet var imageViewHeader: UIImageView!
    @IBOutlet var BalanceLabel: UILabel!
    @IBOutlet var RecevieButton: UIButton!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var imageViewSpentThisMonth: UIImageView!
    @IBOutlet var SpentThisMonthAmount: UILabel!
    
    
    private var recentTransfer: [[String: String]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: Titleview)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell.fill"), style: .plain, target: self, action: #selector(actionProfile))

        RecevieButton.layer.borderWidth = 1
        RecevieButton.layer.borderColor = AppColor.Border.cgColor
        
        collectionView.register(UINib(nibName: "HomeVC2Cell", bundle: Bundle.main), forCellWithReuseIdentifier: "HomeVC2Cell")
      
        loadData()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        if let navController = navigationController as? NavigationController {
            navController.setBackground(color: .clear)
        }
    }

    
    override func viewWillDisappear(_ animated: Bool) {

        super.viewWillDisappear(animated)

        if let navBar = navigationController as? NavigationController {
            navBar.setNavigationBar()
        }
    }
    
    
    
    func loadData() {
        
        
        imageViewHeader.sample("Finance", "BusinessWomen", 15)
        BalanceLabel.text = "$2500.00"
        imageViewSpentThisMonth.sample("Finance", "Stocks", 2)
        SpentThisMonthAmount.text = "$8320"

        recentTransfer.removeAll()

        var dict1: [String: String] = [:]
        dict1["name"] = "Fazil"
        recentTransfer.append(dict1)

        var dict2: [String: String] = [:]
        dict2["name"] = "Tony stark"
        recentTransfer.append(dict2)

        var dict3: [String: String] = [:]
        dict3["name"] = "Elon"
        recentTransfer.append(dict3)

        var dict4: [String: String] = [:]
        dict4["name"] = "John"
        recentTransfer.append(dict4)

        var dict5: [String: String] = [:]
        dict5["name"] = "peter"
        recentTransfer.append(dict5)

        var dict6: [String: String] = [:]
        dict6["name"] = "Fabia"
        recentTransfer.append(dict6)

        var dict7: [String: String] = [:]
        dict7["name"] = "Alan"
        recentTransfer.append(dict7)

        var dict8: [String: String] = [:]
        dict8["name"] = "Brian"
        recentTransfer.append(dict8)

        var dict9: [String: String] = [:]
        dict9["name"] = "Chris"
        recentTransfer.append(dict9)

        var dict10: [String: String] = [:]
        dict10["name"] = "Dave"
        recentTransfer.append(dict10)

        refreshCollectionView()

        
    }

    func refreshCollectionView() {
        
        collectionView.reloadData()
    }
    
    @objc func actionProfile(_ sender: UIButton) {
        
        print(#function)
        dismiss(animated: true)
    }
  
    @IBAction func actionViewStatement(_ sender: Any) {
        
        print(#function)
    }
    
    @IBAction func actionReceiveMoney(_ sender: Any) {
        
        print(#function)
    }
    
    @IBAction func actionAdd(_ sender: Any) {
        
        print(#function)
    }
    
    @IBAction func actionAddRecentTransfer(_ sender: Any) {
        
        print(#function)
    }
    
    @IBAction func actionSeeAllQuickServices(_ sender: Any) {
        
        print(#function)
    }
    
    
    @IBAction func actionCreditCards(_ sender: Any) {
        
        print(#function)
    }
    
    @IBAction func actionInvestments(_ sender: Any) {
        
        print(#function)
    }
    
    @IBAction func actionLoans(_ sender: Any) {
        
        print(#function)
    }
    
    
    @IBAction func actionSpentThisMonth(_ sender: Any) {
        
        print(#function)
    }
    
    
}




extension HomeVC2: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return recentTransfer.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeVC2Cell", for: indexPath) as! HomeVC2Cell
        cell.bindData(index: indexPath, data: recentTransfer[indexPath.row])
        return cell
        
    }
    
}

extension HomeVC2: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(#function)
    }
    
}


extension HomeVC2: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let height = (collectionView.frame.size.height-20)
        return CGSize(width: 70, height: height)
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 5
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

        return 5
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    }
    
}

extension HomeVC2: UIScrollViewDelegate {

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        if scrollView.tag == 11 {
            if let navController = navigationController as? NavigationController {
                if (scrollView.contentOffset.y > RecevieButton.frame.origin.y) {
                    navController.setBackground(color: .systemBackground)
                } else {
                    navController.setBackground(color: .clear)
                }
            }
        }
    }
}





















