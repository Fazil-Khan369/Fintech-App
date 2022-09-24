//
//  AccountTableViewCell1.swift
//  Finance-app
//
//  Created by Fazil P on 24/09/2022.
//

import UIKit

class AccountTableViewCell1: UITableViewCell {

    
    @IBOutlet var CardimageView: UIImageView!
    @IBOutlet var CardnameLabel: UILabel!
    @IBOutlet var CardnumberLabel: UILabel!
    @IBOutlet var AmountLabel: UILabel!
    

    func bindData(index: IndexPath, data: [String: String]) {
        
        guard let name = data["name"] else { return }
        guard let card_number = data["card_number"] else { return }
        guard let card_type = data["card_type"] else { return }
        guard let amount = data["amount"] else { return }
        

        CardimageView.sample("Finance", "Payments", index.row)
        CardnameLabel.text = name
        CardnumberLabel.text = card_type.uppercased() + " " + card_number
        AmountLabel.text = amount
    }
 
    
}
