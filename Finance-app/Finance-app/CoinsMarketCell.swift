//
//  CoinsMarketCell.swift
//  Finance-app
//
//  Created by Fazil P on 25/09/2022.
//

import UIKit

class CoinsMarketCell: UITableViewCell {
    
    @IBOutlet var CoinImageview: UIImageView!
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var CoinInfoLabel: UILabel!
    @IBOutlet var AmountLabel: UILabel!
    
    
    func bindData(index: IndexPath, data: [String: String]) {

        guard let name = data["name"] else { return }
        guard let coin_id = data["coin_id"] else { return }
        guard let amount = data["amount"] else { return }
        guard let percentage = data["percentage"] else { return }
        guard let isPlus = data["isPlus"] else { return }

        CoinImageview.sample("Finance", "Stocks", index.row+10)
        NameLabel.text = name
        CoinInfoLabel.text = coin_id + ((isPlus == "Plus") ? " • +" : " • -") + percentage
        AmountLabel.text = amount
    }
    
    
}
