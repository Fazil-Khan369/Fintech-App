//
//  Transaction2Cell.swift
//  Finance-app
//
//  Created by Fazil P on 20/09/2022.
//

import UIKit

class Transaction2Cell: UITableViewCell {
    
    @IBOutlet var ImageTransactionStatus: UIImageView!
    @IBOutlet var TransactionLabel: UILabel!
    @IBOutlet var TransactionInfoLabel: UILabel!
    @IBOutlet var AmountLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
    func bindData(index: IndexPath, data: [String: String]) {
        
        guard let name = data["name"] else { return }
        guard let status = data["status"] else { return }
        guard let date = data["date"] else { return }
        guard let time = data["time"] else { return }
        guard let amount = data["amount"] else { return }
        
        var imageName = "arrow.up"
        if (status == "Sent") { imageName = "arrow.up"}
        if (status == "Received") { imageName = "arrow.down" }
        if (status == "Paid") { imageName = "checkmark" }
        
        ImageTransactionStatus.image = UIImage(systemName: imageName)
        TransactionLabel.text = name
        TransactionInfoLabel.text = status + " • " + date + " " + time
        AmountLabel.text = ((status == "Received") ? "+" : "-") + amount
    }
 
}
