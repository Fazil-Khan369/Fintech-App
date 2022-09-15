//
//  PlanCell.swift
//  Finance-app
//
//  Created by Fazil P on 11/09/2022.
//

import UIKit

class PlanCell: UITableViewCell {

    @IBOutlet weak var Titlelabel: UILabel!
    @IBOutlet weak var Descriptionlabel: UILabel!
    @IBOutlet weak var Imageview: UIImageView!
    
    
    func bindData(data: [String: String]) {
        
        guard let title = data["title"] else { return }
        guard let description = data["description"] else { return }
        
        Titlelabel.text = title
        Descriptionlabel.text = description
    }
    
    
}
