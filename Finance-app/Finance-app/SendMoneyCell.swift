//
//  SendMoneyCell.swift
//  Finance-app
//
//  Created by Fazil P on 02/10/2022.
//

import UIKit

class SendMoneyCell: UICollectionViewCell {
    
    @IBOutlet var viewBackground: UIView!
    @IBOutlet var viewcard: UIView!
    @IBOutlet var CardNumberLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewcard.layer.borderWidth = 1
        viewcard.layer.borderColor = AppColor.Border.cgColor
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
