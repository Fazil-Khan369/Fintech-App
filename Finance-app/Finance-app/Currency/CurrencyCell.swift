//
//  CurrencyCell.swift
//  Finance-app
//
//  Created by Fazil P on 07/10/2022.
//

import UIKit

class CurrencyCell: UITableViewCell {
    
    
    @IBOutlet var CurrencyimageView: UIImageView!
    @IBOutlet var CurrencyLabel: UILabel!
    @IBOutlet var imageSelected: UIImageView!
    
    

    func bindData(data: [String: String]) {

        guard let currency_name = data["currency_name"] else { return }
        guard let currency = data["currency"] else { return }

        CurrencyLabel.text = currency_name.capitalized + " (\(currency.uppercased()))"
    }

    func setSelected(_ selected: Bool) {

        imageSelected.image = UIImage(systemName: selected ? "checkmark.circle.fill" : "circle.fill")
        imageSelected.tintColor = selected ? AppColor.Theme : UIColor.systemGray
    }

    
}
