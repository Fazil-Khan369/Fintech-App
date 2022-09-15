//
//  SignUpVC.swift
//  Finance-app
//
//  Created by Fazil P on 30/08/2022.
//

import UIKit

class SignUpVC: UIViewController {
    
    
    @IBOutlet weak var FirstnameTextfield: UITextField!
    @IBOutlet weak var LastnameTextfield: UITextField!
    @IBOutlet weak var EmailTextfield: UITextField!
    @IBOutlet weak var PasswordTextfield: UITextField!
    @IBOutlet weak var ConfirmPasswordTextfield: UITextField!
    @IBOutlet weak var TermLabel: UIButton!
    @IBOutlet weak var Agreelabel: UILabel!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var ConditionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()

        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.titleView = UIImageView(image: UIImage(systemName: "circles.hexagongrid.fill"))
        
        FirstnameTextfield.setLeftPadding(value: 15)
        LastnameTextfield.setLeftPadding(value: 15)
        EmailTextfield.setLeftPadding(value: 15)
        PasswordTextfield.setLeftPadding(value: 15)
        ConfirmPasswordTextfield.setLeftPadding(value: 15)
        
        
    }
    
    
    func loadData() {
        label.text = "and"
        Agreelabel.text = "By signing up, you agree to our"
    }


    @IBAction func actionFacebook(_ sender: Any) {
        
        print(#function)
        dismiss(animated: true)
        
    }
    
    @IBAction func actionContinue(_ sender: Any) {
        
        print(#function)
        dismiss(animated: true)
    }
    
    @IBAction func actionTerms(_ sender: Any) {
        print(#function)
        dismiss(animated: true)
        
    }
    @IBAction func actionPrivacy(_ sender: Any) {
        print(#function)
        dismiss(animated: true)
        
    }
    
}
