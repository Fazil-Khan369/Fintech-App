//
//  TransactionHistoryCollectionViewCell.swift
//  Finance-app
//
//  Created by Fazil P on 18/09/2022.
//

import UIKit

class TransactionHistoryCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var viewBackground: UIView!
    @IBOutlet var CardNumberLabel: UILabel!
    @IBOutlet var Cardview: UIView!
    @IBOutlet var Cardimage: UIImageView!
    
  

    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        Cardview.layer.borderWidth = 1
        Cardview.layer.borderColor = AppColor.Border.cgColor
        
    }
    
    func bindData(data: [String: String]) {
        
        guard let card_number = data["card_number"] else { return }
        guard let card_type = data["card_type"] else { return }
        
        CardNumberLabel.text = card_type + " " + card_number
    }
    
    func setCell(isSelected: Bool) {
        viewBackground.backgroundColor = isSelected ? UIColor.systemBackground : UIColor.tertiarySystemFill
        viewBackground.layer.borderWidth = isSelected ? 1 : 0
        viewBackground.layer.borderColor = isSelected ? AppColor.Border.cgColor : UIColor.clear.cgColor
    }

}
















