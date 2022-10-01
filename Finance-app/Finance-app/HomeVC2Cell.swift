//
//  HomeVC2Cell.swift
//  Finance-app
//
//  Created by Fazil P on 30/09/2022.
//

import UIKit

class HomeVC2Cell: UICollectionViewCell {
    
    
    @IBOutlet var ProfileimageView: UIImageView!
    @IBOutlet var NameLabel: UILabel!
    
    
    
    func bindData(index: IndexPath, data: [String: String]) {

        guard let name = data["name"] else { return }

        ProfileimageView.sample("Finance", "BusinessWomen", index.row)
        NameLabel.text = name
    }

}
