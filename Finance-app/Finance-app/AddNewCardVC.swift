//
//  AddNewCardVC.swift
//  Finance-app
//
//  Created by Fazil P on 27/09/2022.
//

import UIKit

class AddNewCardVC: UIViewController {
    
    @IBOutlet var Scanview: UIView!
    @IBOutlet var Backgroundview: UIView!
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var Cardview: UIView!
    @IBOutlet var ImageCard: UIImageView!
    @IBOutlet var CardNumberLabel: UILabel!
    @IBOutlet var CVVLabel: UILabel!
    @IBOutlet var ExpireDateLabel: UILabel!
    
    @IBOutlet var CardDesignLabel: UILabel!
    @IBOutlet var CardHoldertextField: UITextField!
    @IBOutlet var CardNumbertextField: UITextField!
    @IBOutlet var ExpDatetextField: UITextField!
    @IBOutlet var CVVtextField: UITextField!
    
    
    private var cards = ["", "", "", "", "", "", ""]
    private var currentCardIndex = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Card"
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(actionCancel(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: Scanview)
        
        Backgroundview.layer.borderWidth = 1
        Backgroundview.layer.borderColor = AppColor.Border.cgColor
        
        Cardview.layer.borderWidth = 1
        Cardview.layer.borderColor = AppColor.Border.cgColor
        
        
        loadData()
        
    }
    
    
    func loadData() {
        
        NameLabel.text = "Fazil"
        CardNumberLabel.text = "5643 9901 6530 1865"
        CVVLabel.text = "100"
        ExpireDateLabel.text = "09/2022"
        CardDesignLabel.text = "Light"
        
        CardHoldertextField.text = "Fazil"
        CardNumbertextField.text = "5643 9901 6530 1865"
        ExpDatetextField.text = "09/2022"
        CVVtextField.text = "100"
        
    }
    
    @objc func actionCancel(_ sender: UIButton) {
        
        print(#function)
        dismiss(animated: true)
        
    }
    
    @IBAction func actionCardDesign(_ sender: Any) {
        
        print(#function)
    }
    
    @IBAction func actionScan(_ sender: Any) {
        
        print(#function)
    }
    
    
    @IBAction func actionAddCard(_ sender: Any) {
        
        print(#function)
    }
}
