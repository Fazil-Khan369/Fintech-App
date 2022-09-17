//
//  CardDetailsCollectionViewCell.swift
//  Finance-app
//
//  Created by Fazil P on 15/09/2022.
//

import UIKit

class CardDetailsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var viewbackground: UIView!
    @IBOutlet var cardView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var AmountLabel: UILabel!
    @IBOutlet var CardnumberLabel: UILabel!
    @IBOutlet var CardNameLAbel: UILabel!
    @IBOutlet var ExpiredateLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.layer.borderWidth = 1
        cardView.layer.borderColor = AppColor.Border.cgColor
        
    }
    
    
    
    
    func bindData(index: IndexPath, data: [String: String]) {
        
        guard let amount = data["amount"] else { return }
        guard let card_number = data["card_number"] else { return }
        guard let name = data["name"] else { return }
        guard let expiry_date = data["expiry_date"] else { return }
        
        AmountLabel.text = amount
        CardnumberLabel.text = card_number
        CardNameLAbel.text = name
        ExpiredateLabel.text = expiry_date
    }
    
    
    func setCell(isSelected: Bool) {
        
        viewbackground.backgroundColor = isSelected ? UIColor.systemBackground : UIColor.tertiarySystemFill
        viewbackground.layer.borderWidth = isSelected ? 1 : 0
        viewbackground.layer.borderColor = isSelected ? AppColor.Border.cgColor : UIColor.clear.cgColor
        
    }
}










