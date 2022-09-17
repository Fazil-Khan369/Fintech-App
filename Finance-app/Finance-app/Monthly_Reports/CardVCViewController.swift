//
//  CardVCViewController.swift
//  Finance-app
//
//  Created by Fazil P on 15/09/2022.
//

import UIKit

class CardVCViewController: UIViewController {
    
    
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var cellCardName: UITableViewCell!
    @IBOutlet var cellAccountnumber: UITableViewCell!
    @IBOutlet var cellCardholder: UITableViewCell!
    @IBOutlet var cellExpiredate: UITableViewCell!
    
    @IBOutlet var cell3Dsecurity: UITableViewCell!
    
    
    @IBOutlet var CardNameLabel: UILabel!
    @IBOutlet var AccountNumberLabel: UILabel!
    @IBOutlet var CardholderLabel: UILabel!
    @IBOutlet var ExpiredateLabel: UILabel!
    @IBOutlet var securityLabel: UILabel!
    
    
    private var cards: [[String: String]] = []
    private var currentCardIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
        
        let userImage = UIImage(systemName: "person.circle.fill")?.withTintColor(UIColor.systemGray, renderingMode: .alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: userImage, style: .plain, target: self, action: #selector(actionProfile(_:)))
        
        collectionView.register(UINib(nibName: "CardDetailsCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "CardDetailsCollectionViewCell")
        
        let cellWidth = UIScreen.main.bounds.width - 60
        let sectionSpacing = CGFloat(30)
        let cellSpacing = CGFloat(10)
        
        if let layout = collectionView.collectionViewLayout as? CardsLayout {
            layout.sectionInset = UIEdgeInsets(top: 0, left: sectionSpacing, bottom: 0, right: sectionSpacing)
            layout.itemSize = CGSize(width: cellWidth, height: collectionView.frame.size.height - 20)
            layout.minimumLineSpacing = cellSpacing
            collectionView.collectionViewLayout = layout
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.decelerationRate = .fast
        }

        
        loadData()
        pageControl.numberOfPages = cards.count
        
    }

//    MARK: - Data methods
    
    func loadData() {
        
        CardNameLabel.text = "Visa Platinum"
        AccountNumberLabel.text = "983478911"
        CardholderLabel.text = "Fazil"
        ExpiredateLabel.text = "04/2023"
        securityLabel.text = "Enable"
        
        cards.removeAll()
        
        var dict1: [String: String] = [:]
        dict1["name"] = "FAZIL"
        dict1["expiry_date"] = "10/2023"
        dict1["card_number"] = "3582 0629 5501 7280"
        dict1["amount"] = "$1099336"
        cards.append(dict1)

        
        var dict2: [String: String] = [:]
        dict2["name"] = "Tony Stark"
        dict2["expiry_date"] = "10/2023"
        dict2["card_number"] = "3582 0629 5501 7280"
        dict2["amount"] = "$2467890"
        cards.append(dict2)
        
        var dict3: [String: String] = [:]
        dict3["name"] = "Cristiano ronaldo"
        dict3["expiry_date"] = "10/2023"
        dict3["card_number"] = "3582 0629 5501 7280"
        dict3["amount"] = "$10033478"
        cards.append(dict3)
        
        var dict4: [String: String] = [:]
        dict4["name"] = "Messi"
        dict4["expiry_date"] = "10/2023"
        dict4["card_number"] = "3582 0629 5501 7280"
        dict4["amount"] = "$458200"
        cards.append(dict4)
        
        var dict5: [String: String] = [:]
        dict5["name"] = "Amy Robert"
        dict5["expiry_date"] = "10/2023"
        dict5["card_number"] = "3582 0629 5501 7280"
        dict5["amount"] = "$30000"
        cards.append(dict5)

        refreshCollectionView()
    }
    
    func refreshCollectionView() {
        
        collectionView.reloadData()
    }
    
    @objc func actionProfile(_ sender: UIButton) {
        
        print(#function)
    }
    
    
    @IBAction func actionReport(_ sender: Any) {
        
        print(#function)
    }
    
    
    @IBAction func actionTransaction(_ sender: Any) {
        
        print(#function)
    }
    

    @IBAction func actionActions(_ sender: Any) {
        
        print(#function)
    }
    

}


// MARK: - UITableViewDataSource


extension CardVCViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) { return cellCardName }
        if (indexPath.row == 1) { return cellAccountnumber }
        if (indexPath.row == 2) { return cellCardholder }
        if (indexPath.row == 3) { return cellExpiredate }
        if (indexPath.row == 4) { return cell3Dsecurity }
        
        return UITableViewCell()
    }
}


//  MARK: - UITableViewDelegate

extension CardVCViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
}


// MARK: - UICollectionViewDataSource

extension CardVCViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardDetailsCollectionViewCell", for: indexPath) as! CardDetailsCollectionViewCell
        cell.bindData(index: indexPath, data: cards[indexPath.row])
        cell.setCell(isSelected: (currentCardIndex == indexPath.row))
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension CardVCViewController: UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(#function)
        currentCardIndex = indexPath.row
        pageControl.currentPage = indexPath.row
        collectionView.reloadData()
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
}

// MARK: - UICollectionViewDeleagetFlowLayout


extension CardVCViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.size.width - 60
        let height = collectionView.frame.size.height - 20
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30)
    }
}


// MARK: - UIScrollViewDelegate

extension CardVCViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        if (scrollView == collectionView) {
            let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
            let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
            
            if let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint) {
                currentCardIndex = visibleIndexPath.row
                pageControl.currentPage = currentCardIndex
                collectionView.reloadData()
            }
        }
    }
}





