//
//  TransfermoneyVC.swift
//  Finance-app
//
//  Created by Fazil P on 20/09/2022.
//

import UIKit

class TransfermoneyVC: UIViewController {

    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var cellTransferType: UITableViewCell!
    @IBOutlet var cellCardNumber: UITableViewCell!
    @IBOutlet var cellBankName: UITableViewCell!
    @IBOutlet var cellBeneficiaryNumber: UITableViewCell!
    @IBOutlet var cellBICcode: UITableViewCell!
    @IBOutlet var cellAccountNumber: UITableViewCell!
    @IBOutlet var cellAddress: UITableViewCell!
    @IBOutlet var cellAmount: UITableViewCell!
    
    
    @IBOutlet var TransferTypeLabel: UILabel!
    @IBOutlet var CardNumberLabel: UILabel!
    @IBOutlet var BankNametextField: UITextField!
    @IBOutlet var BeneficiaryNumbertextField: UITextField!
    @IBOutlet var BICcodetextField: UITextField!
    @IBOutlet var AccountNumbertextField: UITextField!
    @IBOutlet var AddresstextField: UITextField!
    @IBOutlet var AmounttextField: UITextField!
    
    
    var sections = ["Info", "Info", "Amount"]
    var transactions = ["", "", "", "", ""]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Wire Transfer"
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
        
        loadData()
        
    }

    func loadData() {
        
        TransferTypeLabel.text = "Regular"
        CardNumberLabel.text = "Visa **** 1234"
        BankNametextField.text = "Emirates NBD"
        BeneficiaryNumbertextField.text = "7965468"
        BICcodetextField.text = "NGRE34U8L"
        AccountNumbertextField.text = "0466824906457"
        AddresstextField.text = "Down town Dubai"
        AmounttextField.text = "655"
        
    }


    @IBAction func actionSend(_ sender: Any) {
        
        print(#function)
        dismiss(animated: true)
    }
    
}

extension TransfermoneyVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (section == 0) { return 2 }
        if (section == 1) { return 5 }
        if (section == 2) { return 1 }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0) && (indexPath.row == 0) { return cellTransferType        }
        if (indexPath.section == 0) && (indexPath.row == 1) { return cellCardNumber            }

        if (indexPath.section == 1) && (indexPath.row == 0) { return cellBankName            }
        if (indexPath.section == 1) && (indexPath.row == 1) { return cellBeneficiaryNumber    }
        if (indexPath.section == 1) && (indexPath.row == 2) { return cellBICcode            }
        if (indexPath.section == 1) && (indexPath.row == 3) { return cellAccountNumber        }
        if (indexPath.section == 1) && (indexPath.row == 4) { return cellAddress            }

        if (indexPath.section == 2) && (indexPath.row == 0) { return cellAmount                }

        return UITableViewCell()
    }
    
}

extension TransfermoneyVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if(indexPath.section == 2) && (indexPath.row == 0) { return 80 }
        return 45
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if (section == 0) { return 30 }
        return 55
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.font = UIFont.systemFont(ofSize: 12)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(#function)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}















