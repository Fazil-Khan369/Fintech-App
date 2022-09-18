//
//  TransactionHistoryVC.swift
//  Finance-app
//
//  Created by Fazil P on 17/09/2022.
//

import UIKit

class TransactionHistoryVC: UIViewController {
    
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var AmountLabel: UILabel!
    @IBOutlet var MonthLabel: UILabel!
    @IBOutlet var layoutConstraintTableViewHeight: NSLayoutConstraint!
    
    
    private var cards: [[String: String]] = []
    private var transactions: [[String: String]] = []
    private var selectedCardIndex = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell.fill"), style: .plain, target: self, action: #selector(actionNotification(_:)))

        let userImage = UIImage(systemName: "person.circle.fill")?.withTintColor(UIColor.systemGray, renderingMode: .alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: userImage, style: .plain, target: self, action: #selector(actionProfile(_:)))
        
        collectionView.register(UINib(nibName: "TransactionHistoryCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "TransactionHistoryCollectionViewCell")
        
        tableView.register(UINib(nibName: "TransactionHistoryTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "TransactionHistoryTableViewCell")
        
        
//        tableView.register(UINib.init(nibName: "HomeTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "HomeTableViewCell")
//
//        layoutConstraintTableViewHeight.constant = CGFloat(70 * transactions.count)
//
        loadData()
        
    }

    
    func loadData() {

        AmountLabel.text = "$11654.54"
        MonthLabel.text = "August"

        cards.removeAll()
        transactions.removeAll()

        var dict1: [String: String] = [:]
        dict1["card_number"] = "****7399"
        dict1["card_type"] = "American Express"
        cards.append(dict1)

        var dict2: [String: String] = [:]
        dict2["card_number"] = "****1843"
        dict2["card_type"] = "Visa"
        cards.append(dict2)

        var dict3: [String: String] = [:]
        dict3["card_number"] = "****6092"
        dict3["card_type"] = "Mastercard"
        cards.append(dict3)

        var dict4: [String: String] = [:]
        dict4["card_number"] = "****9194"
        dict4["card_type"] = "Visa"
        cards.append(dict4)

        var dict5: [String: String] = [:]
        dict5["card_number"] = "****9977"
        dict5["card_type"] = "Mastercard"
        cards.append(dict5)

        var dict6: [String: String] = [:]
        dict6["name"] = "Amy Roberts"
        dict6["status"] = "Received"
        dict6["date"] = "22 May"
        dict6["time"] = "8:21 AM"
        dict6["amount"] = "$281"
        transactions.append(dict6)

        var dict7: [String: String] = [:]
        dict7["name"] = "Betty Hansen"
        dict7["status"] = "Sent"
        dict7["date"] = "21 Dec"
        dict7["time"] = "4:53 PM"
        dict7["amount"] = "$131"
        transactions.append(dict7)

        var dict8: [String: String] = [:]
        dict8["name"] = "Chloe Adams"
        dict8["status"] = "Sent"
        dict8["date"] = "18 Apr"
        dict8["time"] = "10:24 AM"
        dict8["amount"] = "$396"
        transactions.append(dict8)

        var dict9: [String: String] = [:]
        dict9["name"] = "Doris Royston"
        dict9["status"] = "Received"
        dict9["date"] = "30 Jul"
        dict9["time"] = "3:18 AM"
        dict9["amount"] = "$146"
        transactions.append(dict9)

        var dict10: [String: String] = [:]
        dict10["name"] = "Emma Harris"
        dict10["status"] = "Sent"
        dict10["date"] = "01 Jun"
        dict10["time"] = "9:15 AM"
        dict10["amount"] = "$180"
        transactions.append(dict10)

        var dict11: [String: String] = [:]
        dict11["name"] = "Fabia Smith"
        dict11["status"] = "Received"
        dict11["date"] = "20 Sep"
        dict11["time"] = "9:44 A"
        dict11["amount"] = "$307"
        transactions.append(dict11)

        var dict12: [String: String] = [:]
        dict12["name"] = "Alan Nickerson"
        dict12["status"] = "Received"
        dict12["date"] = "30 Oct"
        dict12["time"] = "12:32 AM"
        dict12["amount"] = "$156"
        transactions.append(dict12)

        var dict13: [String: String] = [:]
        dict13["name"] = "Brian Elwood"
        dict13["status"] = "Received"
        dict13["date"] = "12 Mar"
        dict13["time"] = "5:44 AM"
        dict13["amount"] = "$280"
        transactions.append(dict13)

        var dict14: [String: String] = [:]
        dict14["name"] = "Chris Michael"
        dict14["status"] = "Sent"
        dict14["date"] = "13 Jan"
        dict14["time"] = "2:22 PM"
        dict14["amount"] = "$27"
        transactions.append(dict14)

        var dict15: [String: String] = [:]
        dict15["name"] = "Dave Smith"
        dict15["status"] = "Received"
        dict15["date"] = "30 Aug"
        dict15["time"] = "5:03 AM"
        dict15["amount"] = "$363"
        transactions.append(dict15)

        refreshCollectioView()
        refreshTableView()
    }
    
    
    
    func refreshCollectioView() {
        
        collectionView.reloadData()
    }
    
    func refreshTableView() {
        
        tableView.reloadData()
    }
    
    
    @objc func actionNotification(_ sender: UIBarButtonItem) {
        
        print(#function)
        dismiss(animated: true)
    }
    
    @objc func actionProfile(_ sender: UIButton) {
        
        print(#function)
        dismiss(animated: true)
    }
    

    @IBAction func actionCalendar(_ sender: Any) {
        
        print(#function)
        dismiss(animated: true)
        
    }
    
    @IBAction func actionAdd(_ sender: Any) {
        
        print(#function)
        dismiss(animated: true)
    }
    
}


// MARK: - UITableViewDataSource


extension TransactionHistoryVC: UITableViewDataSource {

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return transactions.count
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionHistoryTableViewCell", for: indexPath) as! TransactionHistoryTableViewCell
        cell.bindData(index: indexPath, data: transactions[indexPath.row])
        print("TTTT")
        return cell
    }
}



// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension TransactionHistoryVC: UITableViewDelegate {

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 70
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print(#function)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}




// MARK: - UICollectionViewDataSource



extension TransactionHistoryVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TransactionHistoryCollectionViewCell", for: indexPath) as! TransactionHistoryCollectionViewCell
        cell.bindData(data: cards[indexPath.row])
        cell.setCell(isSelected: (selectedCardIndex == indexPath.row))
        return cell
    }
}


// MARK: - UICollectionViewDelegate


extension TransactionHistoryVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(#function)
        selectedCardIndex = indexPath.row
        collectionView.reloadData()
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
}


// MARK: - UICollectionViewDelegateFlowLayout

extension TransactionHistoryVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.frame.size.width-30)*0.75
        let height = collectionView.frame.size.height-20
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    }
}
























