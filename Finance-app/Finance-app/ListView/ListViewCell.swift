//
//  ListViewCell.swift
//  Finance-app
//
//  Created by Fazil P on 04/10/2022.
//

import UIKit

class ListViewCell: UITableViewCell {
    
    @IBOutlet var StoreLabel: UILabel!
    @IBOutlet var DistanceView: UIView!
    @IBOutlet var DistanceLabel: UILabel!
    @IBOutlet var AddressLabel: UILabel!
    @IBOutlet var OpenStatusLabel: UILabel!
    @IBOutlet var TimeLabel: UILabel!
    
    
    
    func bindData(data: [String: String]) {

        guard let name = data["name"] else { return }
        guard let distance = data["distance"] else { return }
        guard let address = data["address"] else { return }
        guard let status = data["status"] else { return }
        guard let time = data["time"] else { return }

        StoreLabel.text = name
        DistanceLabel.text = distance
        AddressLabel.text = address
        OpenStatusLabel.text = status
        TimeLabel.text = time
        OpenStatusLabel.textColor = (status == "Open Now") ? AppColor.Theme : UIColor.label
    }
    
    
}
