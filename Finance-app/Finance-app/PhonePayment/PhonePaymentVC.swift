//
//  PhonePaymentVC.swift
//  Finance-app
//
//  Created by Fazil P on 03/10/2022.
//

import UIKit

class PhonePaymentVC: UIViewController {
    
    @IBOutlet var PrepaidButton: UIButton!
    @IBOutlet var PostpainButton: UIButton!
    @IBOutlet var PrepaidView: UIView!
    @IBOutlet var PostpaidView: UIView!
    @IBOutlet var MobileImageview: UIImageView!
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var PhoneNumber: UITextField!
    @IBOutlet var Amount: UITextField!
    @IBOutlet var switchMonthlyAutoPay: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Phone Payment"
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        PrepaidButton.isSelected = true
        updateUI()
        loadData()
        
    }
    
    
    func loadData() {
        
        MobileImageview.sample("Finance", "Payments", 11)
        NameLabel.text = "Fazil"
        PhoneNumber.text = "+971 55 643 7900"
        Amount.text = "210"
        switchMonthlyAutoPay.setOn(false, animated: true)
    }
    
    
    func updateUI() {
        
        PrepaidButton.titleLabel?.textColor = PrepaidButton.isSelected ? AppColor.Theme : UIColor.label
        PostpainButton.titleLabel?.textColor = PostpainButton.isSelected ? AppColor.Theme : UIColor.label
        
        PrepaidView.backgroundColor = PrepaidButton.isSelected ? AppColor.Theme : UIColor.tertiarySystemFill
        PostpaidView.backgroundColor = PostpainButton.isSelected ? AppColor.Theme : UIColor.tertiarySystemFill
    }
    
    
    
    @IBAction func actionPrepaid(_ sender: Any) {
        
        print(#function)
        PrepaidButton.isSelected = true
        PostpainButton.isSelected = false
        updateUI()
    }
    
    @IBAction func actionPostpaid(_ sender: Any) {
        
        print(#function)
        PrepaidButton.isSelected = false
        PostpainButton.isSelected = true
        updateUI()
    }
    
    @IBAction func actionMobile(_ sender: Any) {
        
        print(#function)
    }
    
    
    @IBAction func actionswitchMonthlyAutoPay(_ sender: Any) {
        
        print(#function)
    }
    
    @IBAction func actionPaynow(_ sender: Any) {
        
        print(#function)
    }
    
    
}
