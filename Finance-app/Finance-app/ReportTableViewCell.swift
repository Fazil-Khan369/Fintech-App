//
//  ReportTableViewCell.swift
//  Finance-app
//
//  Created by Fazil P on 21/09/2022.
//

import UIKit

class ReportTableViewCell: UITableViewCell {
    
    @IBOutlet var CategoryImageview: UIImageView!
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var DescriptionLabel: UILabel!
    @IBOutlet var AmountLabel: UILabel!
    
    
    
    func bindData(index: IndexPath, data: [String: String]) {
        
        guard let name = data["name"] else { return }
        guard let description = data["description"] else { return }
        guard let amount = data["amount"] else { return }
        
        CategoryImageview.sample("Finance", "Accounting", index.row)
        NameLabel.text = name
        DescriptionLabel.text = description
        AmountLabel.text = amount
    }
    
}
