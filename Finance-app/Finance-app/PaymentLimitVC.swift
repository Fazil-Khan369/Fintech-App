//
//  PaymentLimitVC.swift
//  Finance-app
//
//  Created by Fazil P on 19/09/2022.
//

import UIKit

class PaymentLimitVC: UIViewController {
    
    
    @IBOutlet var OnlinepaymentLabel: UILabel!
    @IBOutlet var PaymentinStoreAmount: UILabel!
    @IBOutlet var CashWithdrawalsAmount: UILabel!
    
    
    @IBOutlet var OnlinepaymentSlider: UISlider!
    @IBOutlet var PaymentInStoreAmountSlider: UISlider!
    @IBOutlet var CashWithdrawalsAmountSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        title = "Limits"
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true

        let userImage = UIImage(systemName: "person.circle.fill")?.withTintColor(UIColor.systemGray, renderingMode: .alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: userImage, style: .plain, target: self, action: #selector(actionProfile(_:)))
        
        
        loadData()
        
    }

    func loadData() {
        
        OnlinepaymentLabel.text = "$10000.00"
        PaymentinStoreAmount.text = "$1600"
        CashWithdrawalsAmount.text = "$2500"
        
        OnlinepaymentSlider.value = 0.75
        PaymentInStoreAmountSlider.value = 0.35
        CashWithdrawalsAmountSlider.value = 0.55
    }
    
    @objc func actionProfile(_ sender: UIButton) {
        
        print(#function)
    }

    @IBAction func actionUpdateLimits(_ sender: Any) {
        
        print(#function)
    }
    
}
