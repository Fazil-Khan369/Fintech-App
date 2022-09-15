//
//  LoginView1.swift
//  Finance-app
//
//  Created by Fazil P on 25/08/2022.
//

import UIKit

class LoginView1: UIViewController {
    
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var lableSubtitle: UILabel!
    @IBOutlet weak var EmailtextField: UITextField!
    @IBOutlet weak var Passwordtextfield: UITextField!
    @IBOutlet weak var imageviewLogo: UIImageView!
    @IBOutlet weak var passwordHideShowButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EmailtextField.setLeftPadding(value: 15)
        Passwordtextfield.setLeftPadding(value: 12)
        Passwordtextfield.setRightPadding(value: 40)
        
        loadData()
        
        
    }
    
    
    func loadData() {
        
        labelTitle.text = "Welcome to \nTech-World"
        lableSubtitle.text = "An exciting place for the whole family to shop."
    }
    
    

    @IBAction func actionHideshow(_ sender: Any) {
        passwordHideShowButton.isSelected = !passwordHideShowButton.isSelected
        Passwordtextfield.isSecureTextEntry = !passwordHideShowButton.isSelected
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        
        print(#function)
        dismiss(animated: true)
        
    }
    
    @IBAction func actionForgotpassworf(_ sender: Any) {
        
        print(#function)
        dismiss(animated: true)
        
    }
    
    @IBAction func actionSignip(_ sender: Any) {
        
        print(#function)
        dismiss(animated: true)
        
    }
}
