//
//  MonthlyReportCell.swift
//  Finance-app
//
//  Created by Fazil P on 13/09/2022.
//

import UIKit

class MonthlyReportCell: UITableViewCell {
    
    @IBOutlet var CategoryimageView: UIImageView!
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var Description: UILabel!
    @IBOutlet var AmountLabel: UILabel!
    
    

 
    func bindData(index: IndexPath, data: [String: String]) {
        
        guard let name = data["name"] else { return }
        guard let description = data["description"] else { return }
        guard let amount = data["amount"] else { return }
        
        CategoryimageView.sample("Finance", "Accounting", index.row)
        NameLabel.text = name
        Description.text = description
        AmountLabel.text = amount
    }
    
    
}
