//
//  CoinRateTableViewCell.swift
//  Finance-app
//
//  Created by Fazil P on 24/09/2022.
//

import UIKit

class CoinRateTableViewCell: UITableViewCell {
    
    @IBOutlet var AccountImageview: UIImageView!
    @IBOutlet var AmountLabel: UILabel!
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var PercentageLabel: UILabel!
    
   
    
    func bindData(index: IndexPath, data: [String: String]) {

        guard let amount = data["amount"] else { return }
        guard let name = data["name"] else { return }
        guard let percentage = data["percentage"] else { return }
        guard let isPlus = data["isPlus"] else { return }

        AccountImageview.sample("Finance", "Stocks", index.row)
        AmountLabel.text = amount
        NameLabel.text = name
        PercentageLabel.text = ((isPlus == "Plus") ? "+ " : "- ") + percentage
    }

    
}
