//
//  MapCalloutView.swift
//  Finance-app
//
//  Created by Fazil P on 05/10/2022.
//

import UIKit
import MapKit


class MapCalloutView: UIView {

    @IBOutlet var viewContect: UIView!
    @IBOutlet var viewBackground: UIView!
    @IBOutlet var StoreNameLAbel: UILabel!
    @IBOutlet var Distanceview: UIView!
    @IBOutlet var DistanceLabel: UILabel!
    @IBOutlet var AddressLabel: UILabel!
    @IBOutlet var OpenStatusLabel: UILabel!
    @IBOutlet var TimeLabel: UILabel!
    
    
    override init(frame: CGRect) {

        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    
    private func commonInit() {

        Bundle.main.loadNibNamed("MapCalloutView", owner: self, options: nil)
        addSubview(viewContect)
        viewContect.frame = self.bounds
    }
    
    
    func bindData(data: [String: String]) {

        guard let name = data["name"] else { return }
        guard let distance = data["distance"] else { return }
        guard let address = data["address"] else { return }
        guard let status = data["status"] else { return }
        guard let time = data["time"] else { return }

        StoreNameLAbel.text = name
        DistanceLabel.text = distance
        AddressLabel.text = address
        OpenStatusLabel.text = status
        TimeLabel.text = time
        OpenStatusLabel.textColor = (status == "Open Now") ? AppColor.Theme : UIColor.label
    }

    
}


