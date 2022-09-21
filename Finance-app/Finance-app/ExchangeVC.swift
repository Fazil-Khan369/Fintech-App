//
//  ExchangeVC.swift
//  Finance-app
//
//  Created by Fazil P on 20/09/2022.
//

import UIKit
import IQKeyboardManagerSwift


class ExchangeVC: UIViewController {
    
    @IBOutlet var CoinNameLabel: UILabel!
    @IBOutlet var CoinID1view: UIView!
    @IBOutlet var CoinID1Label: UILabel!
    @IBOutlet var Coin1textField: UITextField!
    @IBOutlet var Coin2textField: UITextField!
    @IBOutlet var SwapValueview: UIView!
    @IBOutlet var CoinName2Label: UILabel!
    @IBOutlet var CoinID2view: UIView!
    @IBOutlet var CoinID2Label: UILabel!
    @IBOutlet var CoinInfoLabel: UILabel!
    @IBOutlet var layoutConstraintBottom: NSLayoutConstraint!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Exchange"
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        CoinID1view.layer.borderWidth = 1
        CoinID1view.layer.borderColor = AppColor.Border.cgColor
        
        SwapValueview.layer.borderWidth = 1
        SwapValueview.layer.borderColor = AppColor.Border.cgColor
        
        CoinID2view.layer.borderWidth = 1
        CoinID2view.layer.borderColor = AppColor.Border.cgColor
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        IQKeyboardManager.shared.enable = false

       
        
        loadData()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {

        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
        IQKeyboardManager.shared.enable = true
    }
    
    func loadData() {
        
        CoinNameLabel.text = "Bitcoin"
        CoinID1Label.text = "BTC"
        
        CoinName2Label.text = "US Dollar"
        CoinID2Label.text = "USD"
        
        CoinInfoLabel.text = "1 BTC - $7538.69"
        
        Coin1textField.text = "4.7"
        Coin2textField.text = "16539.84"
    }
    

    
//    @objc func keyboardWillShow(_ notification: Notification) {
//
//        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//            let keyboardRectangle = keyboardFrame.cgRectValue
//            let keyboardHeight = keyboardRectangle.height
//            UIView.animate(withDuration: 0.5) {
//                self.layoutConstraintBottom.constant = keyboardHeight
//            }
//            UIView.animate(withDuration: 0.5, animations: {
//                self.layoutConstraintBottom.constant = keyboardHeight
//            }) { (isComplete) in
//                self.layoutConstraintBottom.constant -= self.view.safeAreaInsets.bottom
//
//            }
//        }
//    }
//
//
//    @objc func keyboardWillHide(_ notification: Notification) {
//
//        UIView.animate(withDuration: 0.5) {
//            self.layoutConstraintBottom.constant = 0
//        }
//    }

    
    

    @IBAction func actionCoin1(_ sender: Any) {
        
        print(#function)
    }
    
    @IBAction func actionCoin2(_ sender: Any) {
        
        print(#function)
    }
    
    
    @IBAction func actionCoinSwap(_ sender: Any) {
        
        print(#function)
    }
    
    @IBAction func actionExchange(_ sender: Any) {
        
        print(#function)
    }
    
}
