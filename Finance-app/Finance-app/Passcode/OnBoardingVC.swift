//
//  OnBoardingVC.swift
//  Finance-app
//
//  Created by Fazil P on 11/09/2022.
//

import UIKit

class OnBoardingVC: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var collections: [[String: String]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "OnBoardingCell", bundle: nil), forCellWithReuseIdentifier: "OnBoardingCell")
        
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = AppColor.Theme
        

        loadCollections()
        
    }
    
    func loadCollections() {
        
        collections.removeAll()
        
        var dict1: [String: String] = [:]
        dict1["title"] = "Discover your expenses"
        dict1["description"] = "Easily create budgets, and see our suggestions based on your spending."
        collections.append(dict1)
        
        var dict2: [String: String] = [:]
        dict2["title"] = "You're Safe With Us"
        dict2["description"] = "We bring all of your money to one place, from balances and bills to credit score and more."
        collections.append(dict2)
        
        collections.append(dict1)
        collections.append(dict1)
        collections.append(dict1)
        
        refreshCollectionView()
    }
    

    @IBAction func actionSkip(_ sender: Any) {
        
        dismiss(animated: true)
        
        print(#function)
    }
    
    func refreshCollectionView() {
        
        collectionView.reloadData()
    }

}


extension OnBoardingVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return collections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardingCell", for: indexPath) as! OnBoardingCell
        cell.bindData(index: indexPath.item, data: collections[indexPath.row])
        return cell
    }
    
}



extension OnBoardingVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("didSelectItemAt \(indexPath.row)")
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        pageControl.currentPage = indexPath.row
    }
}

extension OnBoardingVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = collectionView.frame.size.height
        let width = collectionView.frame.size.width
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
}
















