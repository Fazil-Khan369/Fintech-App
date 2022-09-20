//
//  Transaction2VC.swift
//  Finance-app
//
//  Created by Fazil P on 20/09/2022.
//

import UIKit

class Transaction2VC: UIViewController {
    
    
    @IBOutlet var SearchBar: UISearchBar!
    
    @IBOutlet var tableView: UITableView!
    
    
    var sections = ["Today", "Yesterday"]
    var transactions: [[[String: String]]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Transactions"
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UINib(nibName: "Transaction2Cell", bundle: Bundle.main), forCellReuseIdentifier: "Transaction2Cell")
        
        
        loadData()
        
    }
    
    
    func loadData() {
        
        transactions.removeAll()
        
        var dataArr1: [[String: String]] = []
        var dataArr2: [[String: String]] = []
        
        var dict1: [String: String] = [:]
        dict1["name"] = "Fazil"
        dict1["status"] = "Sent"
        dict1["date"] = "9 Sep"
        dict1["time"] = "9:44 A"
        dict1["amount"] = "$307"
        dataArr1.append(dict1)
        
        var dict2: [String: String] = [:]
        dict2["name"] = "Paypal"
        dict2["status"] = "Received"
        dict2["date"] = "9 Sep"
        dict2["time"] = "12:32 AM"
        dict2["amount"] = "$2560"
        dataArr1.append(dict2)
        
        var dict3: [String: String] = [:]
        dict3["name"] = "Apple Music"
        dict3["status"] = "Paid"
        dict3["date"] = "9 Sep"
        dict3["time"] = "5:44 AM"
        dict3["amount"] = "$280"
        dataArr1.append(dict3)
        
        var dict4: [String: String] = [:]
        dict4["name"] = "Amazon prime"
        dict4["status"] = "Sent"
        dict4["date"] = "9 Sep"
        dict4["time"] = "2:22 PM"
        dict4["amount"] = "$27"
        dataArr1.append(dict4)
        
        var dict5: [String: String] = [:]
        dict5["name"] = "Cori Courvert"
        dict5["status"] = "Sent"
        dict5["date"] = "8 Sep"
        dict5["time"] = "5:03 AM"
        dict5["amount"] = "$363"
        dataArr2.append(dict5)
        
        var dict6: [String: String] = [:]
        dict6["name"] = "Youtube Payment"
        dict6["status"] = "Received"
        dict6["date"] = "8 Sep"
        dict6["time"] = "8:21 AM"
        dict6["amount"] = "$5210"
        dataArr2.append(dict6)
        
        var dict7: [String: String] = [:]
        dict7["name"] = "Netflix"
        dict7["status"] = "Paid"
        dict7["date"] = "8 Sep"
        dict7["time"] = "4:53 PM"
        dict7["amount"] = "$131"
        dataArr2.append(dict7)
        
        var dict8: [String: String] = [:]
        dict8["name"] = "Chris Michael"
        dict8["status"] = "Sent"
        dict8["date"] = "8 Sep"
        dict8["time"] = "10:24 AM"
        dict8["amount"] = "$396"
        dataArr2.append(dict8)
        
        var dict9: [String: String] = [:]
        dict9["name"] = "Brian Elwood"
        dict9["status"] = "Sent"
        dict9["date"] = "8 Sep"
        dict9["time"] = "3:18 AM"
        dict9["amount"] = "$146"
        dataArr2.append(dict9)
        
        var dict10: [String: String] = [:]
        dict10["name"] = "Emma Harris"
        dict10["status"] = "Sent"
        dict10["date"] = "8 Sep"
        dict10["time"] = "9:15 AM"
        dict10["amount"] = "$180"
        dataArr2.append(dict10)
        
        transactions.append(dataArr1)
        transactions.append(dataArr2)
        
        refreshTableView()
    }
    
    func refreshTableView() {
        
        tableView.reloadData()
    }
    
}


// MARK: - UItableviewDataSource


extension Transaction2VC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return transactions[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Transaction2Cell", for: indexPath) as! Transaction2Cell
        cell.bindData(index: indexPath, data: transactions[indexPath.section][indexPath.row])
        return cell
    }
    
}

extension Transaction2VC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sections[section]
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.textColor = UIColor.label
            header.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(#function)
        tableView.deselectRow(at: indexPath, animated: true)
        dismiss(animated: true)
    }
    
    
}
















