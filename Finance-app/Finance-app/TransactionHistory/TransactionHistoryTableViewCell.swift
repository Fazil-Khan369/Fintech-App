//
//  TransactionHistoryTableViewCell.swift
//  Finance-app
//
//  Created by Fazil P on 18/09/2022.
//

import UIKit

class TransactionHistoryTableViewCell: UITableViewCell {
    
    
    @IBOutlet var UserImageview: UIImageView!
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var TransactionInfoLabel: UILabel!
    @IBOutlet var AmountLabel: UILabel!
    
    
    
    
    func bindData(index: IndexPath, data: [String: String]) {
        
        guard let name = data["name"] else { return }
        guard let status = data["status"] else { return }
        guard let date = data["date"] else { return }
        guard let time = data["time"] else { return }
        guard let amount = data["amount"] else { return }
        
        UserImageview.sample("Finance", "BusinessMen", index.row)
        NameLabel.text = name
        TransactionInfoLabel.text = status + " • " + date + " " + time
        AmountLabel.text = ((status == "Received") ? "+" : "_") + amount
        
        
    }
    
    
    
        
}
