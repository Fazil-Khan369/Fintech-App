//
//  HomeTableViewCell.swift
//  Finance-app
//
//  Created by Fazil P on 12/09/2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var TransactionInfoLabel: UILabel!
    @IBOutlet weak var AmountLabel: UILabel!
    
        
    func bindData(index: IndexPath, data: [String: String]) {

        guard let name = data["name"] else { return }
        guard let status = data["status"] else { return }
        guard let date = data["date"] else { return }
        guard let time = data["time"] else { return }
        guard let amount = data["amount"] else { return }

        UserImage.sample("Finance", "BusinessMen", index.row)
        NameLabel.text = name
        TransactionInfoLabel.text = status + " • " + date + " " + time
        AmountLabel.text = ((status == "Received") ? "+" : "-") + amount
    }
    
}
