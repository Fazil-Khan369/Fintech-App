//
//  SendMoneyVC.swift
//  Finance-app
//
//  Created by Fazil P on 01/10/2022.
//

import UIKit

class SendMoneyVC: UIViewController {
    
    @IBOutlet var UserImageview: UIImageView!
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var CardNumberLable: UILabel!
    @IBOutlet var UserImageview2: UIImageView!
    
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var AmountTextfield: UITextField!
    @IBOutlet var BankfeeInfoLabel: UILabel!
    @IBOutlet var Notetextview: UITextView!
    
    private var placeHolderLabel = UILabel()
    private var cards: [[String: String]] = []
    private var selectedCardIndex = 0
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Send Money to"
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true

        collectionView.register(UINib(nibName: "SendMoneyCell", bundle: Bundle.main), forCellWithReuseIdentifier: "SendMoneyCell")
        
        placeHolderLabel.text = "Note"
        placeHolderLabel.font = UIFont.systemFont(ofSize: Notetextview.font!.pointSize)
        placeHolderLabel.sizeToFit()
        placeHolderLabel.frame.origin = CGPoint(x: 5, y: Notetextview.font!.pointSize / 2)
        placeHolderLabel.textColor = UIColor.label
        placeHolderLabel.isHidden = !Notetextview.text.isEmpty
        Notetextview.addSubview(placeHolderLabel)
        
        
        loadData()
        
        
    }


  
    func loadData() {
        
        UserImageview.sample("Finance", "BusinessWomen", 17)
        NameLabel.text = "Fazil"
        CardNumberLable.text = "**** 8231"
        UserImageview2.sample("Finance", "BusinessMen", 18)
        AmountTextfield.text = "120.00"
        BankfeeInfoLabel.text = "Bank Fee 2.5%: $1.25 "

        cards.removeAll()

        var dict1: [String: String] = [:]
        dict1["card_number"] = "****2464"
        dict1["card_type"] = "American Express"
        cards.append(dict1)

        var dict2: [String: String] = [:]
        dict2["card_number"] = "****2111"
        dict2["card_type"] = "Visa"
        cards.append(dict2)

        var dict3: [String: String] = [:]
        dict3["card_number"] = "****9083"
        dict3["card_type"] = "Mastercard"
        cards.append(dict3)

        var dict4: [String: String] = [:]
        dict4["card_number"] = "****1026"
        dict4["card_type"] = "Visa"
        cards.append(dict4)

        var dict5: [String: String] = [:]
        dict5["card_number"] = "****7645"
        dict5["card_type"] = "Mastercard"
        cards.append(dict5)
        
        refreshCollectionView()
    }
    
    
    func refreshCollectionView() {

        collectionView.reloadData()
    }

    @IBAction func actionSend(_ sender: Any) {
        
        print(#function)
    }
    
    
}


extension SendMoneyVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SendMoneyCell", for: indexPath) as! SendMoneyCell
        cell.bindData(data: cards[indexPath.row])
        cell.setCell(isSelected: (selectedCardIndex == indexPath.row))
        return cell
    }
    
    
}

extension SendMoneyVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        print(#function)
        selectedCardIndex = indexPath.row
        collectionView.reloadData()
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

extension SendMoneyVC: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (collectionView.frame.size.width-30)*0.75
        let height = collectionView.frame.size.height-20
        return CGSize(width: width, height: height)
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 10
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

        return 10
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    }
    
}



extension SendMoneyVC: UIScrollViewDelegate {
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        if (scrollView == collectionView) {
            let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
            let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)

            if let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint) {
                selectedCardIndex = visibleIndexPath.row
                collectionView.reloadData()
            }
        }
    }
}


extension SendMoneyVC: UITextViewDelegate {

   
    func textViewDidChange(_ textView: UITextView) {

        placeHolderLabel.isHidden = !Notetextview.text.isEmpty
    }
}







