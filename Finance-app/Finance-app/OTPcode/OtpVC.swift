//
//  OtpVC.swift
//  Finance-app
//
//  Created by Fazil P on 01/09/2022.
//

import UIKit

class OtpVC: UIViewController {

    @IBOutlet weak var Titltelabel: UILabel!
    @IBOutlet weak var Subtitlelabel: UILabel!
    @IBOutlet weak var SecureCode: UITextField!
    
    @IBOutlet weak var AvailabeltimeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = UIImageView(image: UIImage(systemName: "circles.hexagongrid.fill"))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(actionDone))


       loadData()
        
        
    }

    
    func loadData() {
        
        Titltelabel.text = "Enter secure\nCode to verify"
        Subtitlelabel.text = "Please enter verification code for verify your mobile number."
        SecureCode.text = "080808"
        AvailabeltimeLabel.text = "Available in 15 seconds"
    }
    
    @objc func actionDone() {
        print(#function)
        
    }

    @IBAction func actionResendCode(_ sender: Any) {
        
        print(#function)
    }
    

}
