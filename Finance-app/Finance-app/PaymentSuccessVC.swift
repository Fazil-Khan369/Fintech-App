//
//  PaymentSuccessVC.swift
//  Finance-app
//
//  Created by Fazil P on 02/10/2022.
//

import UIKit

class PaymentSuccessVC: UIViewController {
    
    
    @IBOutlet var AmountLabel: UILabel!
    @IBOutlet var FromCardnumberLabel: UILabel!
    @IBOutlet var Cardview: UIView!
    @IBOutlet var Cardimage: UIImageView!
    @IBOutlet var UserImage: UIImageView!
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var Closebutton: UIButton!
    @IBOutlet var ToCardnumberLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
        
        Cardview.layer.borderWidth = 1
        Cardview.layer.borderColor = AppColor.Border.cgColor
        
        Closebutton.layer.borderWidth = 1
        Closebutton.layer.borderColor = AppColor.Border.cgColor

        
        loadData()
        
    }

    
    func loadData() {
        
        AmountLabel.text = "200.00"
        FromCardnumberLabel.text = "Visa ****1234"
        
        UserImage.sample("Finance", "BusinessMen", 19)
        NameLabel.text = "Fazil"
        ToCardnumberLabel.text = "**** 1289"
        
        
    }
    
    
    @IBAction func actionProfile(_ sender: Any) {
        
        print(#function)
    }
    
    @IBAction func actionSendReceipt(_ sender: Any) {
        
        print(#function)
    }
    
    @IBAction func actionSaveAsTemplate(_ sender: Any) {
        
        print(#function)
    }
    
    
    @IBAction func actionClose(_ sender: Any) {
        
        print(#function)
        dismiss(animated: true)
        
    }
    
}
