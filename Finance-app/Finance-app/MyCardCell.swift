//
//  MyCardCell.swift
//  Finance-app
//
//  Created by Fazil P on 27/09/2022.
//

import UIKit

class MyCardCell: UICollectionViewCell {
    
    
    
    
    @IBOutlet var Backgroundview: UIView!
    @IBOutlet var CardView: UIView!
    @IBOutlet var Imagecard: UIImageView!
    @IBOutlet var CardNumber: UILabel!
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var ExpiryDateLabel: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
        CardView.layer.borderWidth = 1
        CardView.layer.borderColor = AppColor.Border.cgColor
    }
    
    func bindData(index: IndexPath, data: [String: String]) {

        guard let card_number = data["card_number"] else { return }
        guard let name = data["name"] else { return }
        guard let expiry_date = data["expiry_date"] else { return }

        CardNumber.text = card_number
        NameLabel.text = name
        ExpiryDateLabel.text = expiry_date
    }
    
    
    func setCell(isSelected: Bool) {
        
        Backgroundview.backgroundColor = isSelected ? UIColor.systemBackground : UIColor.tertiarySystemFill
        Backgroundview.layer.borderWidth = isSelected ? 1 : 0
        Backgroundview.layer.borderColor = isSelected ? AppColor.Border.cgColor : UIColor.clear.cgColor
        
    }

}
