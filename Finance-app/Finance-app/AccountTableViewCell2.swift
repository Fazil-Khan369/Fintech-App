//
//  AccountTableViewCell2.swift
//  Finance-app
//
//  Created by Fazil P on 24/09/2022.
//

import UIKit

class AccountTableViewCell2: UITableViewCell {
    
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var InfoLable: UILabel!
    @IBOutlet var AmountLabel: UILabel!
    
    
    func bindData(index: IndexPath, data: [String: String]) {

        guard let name = data["name"] else { return }
        guard let description = data["description"] else { return }
        guard let amount = data["amount"] else { return }

        NameLabel.text = name
        InfoLable.text = description
        AmountLabel.text = amount
    }
    
}
