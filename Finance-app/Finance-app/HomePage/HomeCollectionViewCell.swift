//
//  HomeCollectionViewCell.swift
//  Finance-app
//
//  Created by Fazil P on 12/09/2022.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

  
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var CardNumberlabel: UILabel!
    @IBOutlet weak var CardView: UIView!
    @IBOutlet weak var Imageview: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        CardView.layer.borderWidth = 1
        CardView.layer.borderColor = AppColor.Border.cgColor
        
    }
    
    
    func bindData(data: [String: String]) {
        
        guard let card_number = data["card_number"] else { return }
        guard let card_type = data["card_type"] else { return }
        
        CardNumberlabel.text = card_type + " " + card_number
    }
    
    
    func setCell(isSelected: Bool) {
        
        viewBackground.backgroundColor = isSelected ? UIColor.systemBackground : UIColor.tertiarySystemFill
        viewBackground.layer.borderWidth = isSelected ? 1 : 0
        viewBackground.layer.borderColor = isSelected ? AppColor.Border.cgColor : UIColor.clear.cgColor
    }
    
}



