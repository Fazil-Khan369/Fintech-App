//
//  PhoneVC.swift
//  Finance-app
//
//  Created by Fazil P on 31/08/2022.
//

import UIKit

class PhoneVC: UIViewController {

    @IBOutlet weak var Titlelable: UILabel!
    @IBOutlet weak var Subtitlelable: UILabel!
    @IBOutlet weak var ConutryCode: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    
    var countires: [[String: String]] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.titleView = UIImageView(image: UIImage(systemName: "circles.hexagongrid.fill"))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Continue", style: .done, target: self, action: #selector(actionContinue))

        loadData()
        
        
    }

    
    func loadData() {
        
        countires.removeAll()
        
        if let url = Bundle.main.url(forResource: "phone_countyCode", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let dictionary = object as? [[String: String]] {
                    countires = dictionary
                }
            } catch {
                
            }
        }
        Titlelable.text = "Start with\n phone number"
        Subtitlelable.text = "Please enter your mobile to get sms for active your account."
        ConutryCode.text = "+971"
        phoneNumber.text = "55 123 4567"
    }

    @objc func actionContinue() {
        
        print(#function)
    }
   
    @IBAction func actionContries(_ sender: Any) {
        
        showPickerView(title: "Select country")
    }
    
    
    func showPickerView(title: String) {
        
        let alterView = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        
        let height: NSLayoutConstraint = NSLayoutConstraint(item: alterView.view!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 300)
        alterView.view.addConstraint(height)
        
        let pickerview = UIPickerView(frame: CGRect(x: 0, y: 35, width: alterView.view.frame.size.width - 16, height: 200))
        pickerview.delegate = self
        pickerview.dataSource = self
        
        alterView.view.addSubview(pickerview)
        
        alterView.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
            self.ConutryCode.text = self.countires[pickerview.selectedRow(inComponent: 0)]["dial_code"]
        }))
            present(alterView, animated: true, completion: nil)
    }
}


extension PhoneVC: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let country = countires[row]
        return "\(country["name"] ?? "") (\(country["dial_code"] ?? ""))"
    }
}

extension PhoneVC: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return countires.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        
        return 30.0
    }
}
