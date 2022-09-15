//
//  OnBoardingCell.swift
//  Finance-app
//
//  Created by Fazil P on 11/09/2022.
//

import UIKit

class OnBoardingCell: UICollectionViewCell {

    @IBOutlet weak var Imageview: UIImageView!
    @IBOutlet weak var Titlelabel: UILabel!
    @IBOutlet weak var Descriptionlabel: UILabel!
    
    
    func bindData(index: Int, data: [String: String]) {
        
        guard let title = data["title"] else { return }
        guard let description = data["description"] else { return }
        
        Imageview.sample("Finance", "Money", index + 6)
        Imageview.layoutIfNeeded()
        Imageview.cornerRadius = Imageview.frame.size.width / 2
        Titlelabel.text = title
        Descriptionlabel.text = description
    }
    

}
