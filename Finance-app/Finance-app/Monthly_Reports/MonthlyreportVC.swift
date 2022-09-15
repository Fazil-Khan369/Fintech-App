//
//  MonthlyreportVC.swift
//  Finance-app
//
//  Created by Fazil P on 13/09/2022.
//

import UIKit
import Charts

class MonthlyreportVC: UIViewController {
    
    @IBOutlet var MonthLabel: UILabel!
    @IBOutlet var chartview: PieChartView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var layoutConstraintTableViewHeight: NSLayoutConstraint!
    
    
    private var categories: [[String: String]] = []
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Monthly Report"
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(actionSearch(_:)))
        
        tableView.register(UINib(nibName: "MonthlyReportCell", bundle: Bundle.main), forCellReuseIdentifier: "MonthlyReportCell")
        
        loadData()
        setChartUI()
        layoutConstraintTableViewHeight.constant = CGFloat((70 * categories.count) + 35)

       
    }



//    MARK: -  Data Methods
    
    
    func loadData() {
        
        MonthLabel.text = "April 2022"
        categories.removeAll()
        
        var dict1: [String: String] = [:]
        dict1["name"] = "Mobile Services"
        dict1["description"] = "Apple Mobile, Telia"
        dict1["amount"] = "$246"
        categories.append(dict1)
        
        
        var dict2: [String: String] = [:]
        dict2["name"] = "Transport"
        dict2["description"] = "Uber, Metro"
        dict2["amount"] = "$309"
        categories.append(dict2)
        
        var dict3: [String: String] = [:]
        dict3["name"] = "Shopping"
        dict3["description"] = "Noon, Amazon, Talabat"
        dict3["amount"] = "$1830"
        categories.append(dict3)
        
        var dict4: [String: String] = [:]
        dict4["name"] = "Food"
        dict4["description"] = "Talabat, Noon, Starbucks"
        dict4["amount"] = "$645"
        categories.append(dict4)
        
        var dict5: [String: String] = [:]
        dict5["name"] = "Recreation & Entertainment"
        dict5["description"] = "Amazon Prime, Netflix"
        dict5["amount"] = "$220"
        categories.append(dict5)
        
        var dict6: [String: String] = [:]
        dict6["name"] = "Utilities"
        dict6["description"] = " DEWA, Garbage"
        dict6["amount"] = "$1120"
        categories.append(dict6)
        
        
        var dict7: [String: String] = [:]
        dict7["name"] = "Medical/Healthcare"
        dict7["description"] = " Primary care"
        dict7["amount"] = "$789"
        categories.append(dict7)
        
        var dict8: [String: String] = [:]
        dict8["name"] = "Grocery"
        dict8["description"] = " Supermarket, Online"
        dict8["amount"] = "$532"
        categories.append(dict8)
        
        
        var dict9: [String: String] = [:]
        dict9["name"] = "Personal"
        dict9["description"] = " Expenses en"
        dict9["amount"] = "$222"
        categories.append(dict9)
        
        
        refreshTableView()
        
        
        
        
        
        
    }
    
//    MARK: - Refresh mothods
    
    func refreshTableView() {
        
        tableView.reloadData()
    }

//    MARK: - Helper methods
    
    
//    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
    
    func setChartUI() {
        
        
        chartview.delegate = self
        chartview.chartDescription?.enabled = false
        chartview.drawEntryLabelsEnabled = false
        chartview.usePercentValuesEnabled = false
        chartview.drawCenterTextEnabled = false
        chartview.legend.enabled = false
        chartview.transparentCircleColor = .clear
        chartview.holeColor = UIColor.systemBackground
        
        let marker = MonthlyReportChartview()
        marker.chartView = chartview
        marker.minimumSize = CGSize(width: 80, height: 35)
        chartview.marker = marker
        
        let arrData = [60,34,40]
        self.setDataCount(arrData)
        
        chartview.animate(xAxisDuration: 1.4, easingOption: .easeOutBack)
        
        
    }
    
    
    func setDataCount(_ values: [Int]) {

        chartview.data = nil
        let values = (0..<values.count).map { (i) -> ChartDataEntry in
            return PieChartDataEntry(value: Double(values[i]), label: "")
        }

        let set = PieChartDataSet(entries: values, label: "")
        set.drawIconsEnabled = false
        set.sliceSpace = 0

        set.colors = [AppColor.Theme.withAlphaComponent(1.0), AppColor.Theme.withAlphaComponent(0.6), AppColor.Theme.withAlphaComponent(0.3)]

        let data = PieChartData(dataSet: set)
        data.setValueTextColor(UIColor.clear)
        chartview.data = data
    }
    
// MARK: -  User actions
    
    
    @objc func actionSearch(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction func actionCalendar(_ sender: UIButton) {
        
        print(#function)
    }
    
    
    
}



//  MARK: -  UITableViewDataSource

extension MonthlyreportVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categories.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MonthlyReportCell", for: indexPath) as! MonthlyReportCell
        cell.bindData(index: indexPath, data: categories[indexPath.row])
        
        return cell
    }
}


extension MonthlyreportVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 35
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Categories"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(#function)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

// MARK: - ChartViewDelegate

extension MonthlyreportVC: ChartViewDelegate {
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        
        print(#function)
    }
    
    func chartViewDidEndPanning(_ chartView: ChartViewBase) {
        
        print(#function)
    }
    
    func chartValueNothingSelected(_ chartView: ChartViewBase) {
        
        print(#function)
    }
    
    func chartScaled(_ chartView: ChartViewBase, scaleX: CGFloat, scaleY: CGFloat) {
        
        print(#function)
    }
    
    func chartTranslated(_ chartView: ChartViewBase, dX: CGFloat, dY: CGFloat) {
        
        print(#function)
    }
    
    func chartView(_ chartView: ChartViewBase, animatorDidStop animator: Animator) {
        
        print(#function)
    }
}































