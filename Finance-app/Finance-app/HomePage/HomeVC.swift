//
//  HomeVC.swift
//  Finance-app
//
//  Created by Fazil P on 12/09/2022.
//

import UIKit
import Charts

class HomeVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var AmountLabel: UILabel!
    @IBOutlet weak var chartView: LineChartView!
    @IBOutlet weak var MonthLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var layoutConstraintTableViewHeight: NSLayoutConstraint!
    
    
    private var cards: [[String: String]] = []
    private var transactions: [[String: String]] = []
    private var selectedCardIndex = 0
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell.fill"), style: .plain, target: self, action: #selector(actionNotification(_sender:)))
        
        let userImage = UIImage(systemName: "person.circle.fill")?.withTintColor(UIColor.systemGray, renderingMode: .alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: userImage, style: .plain, target: self, action: #selector(actionProfile(_:)))
        
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        
       
        tableView.register(UINib.init(nibName: "HomeTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "HomeTableViewCell")
        
        
        loadData()
        setChartUI()
        layoutConstraintTableViewHeight.constant = CGFloat(140 * transactions.count)
        
        
    }
    
    
    func loadData() {
        
        AmountLabel.text = "$950.59"
        MonthLabel.text = "September"
        
        cards.removeAll()
        transactions.removeAll()
        
        var dict1: [String: String] = [:]
        dict1["card_number"] = "****4832"
        dict1["card_type"] = "American Express"
        transactions.append(dict1)
        
        var dict2: [String: String] = [:]
        dict2["card_number"] = "****2389"
        dict2["card_type"] = "MasterCard"
        cards.append(dict2)
        
        var dict3: [String: String] = [:]
        dict3["card_number"] = "****1320"
        dict3["card_type"] = "Visa"
        cards.append(dict3)
        
        var dict4: [String: String] = [:]
        dict4["card_number"] = "****1899"
        dict4["card_type"] = "Visa"
        cards.append(dict4)
        
        var dict5: [String: String] = [:]
        dict5["card_number"] = "****5687"
        dict5["card_type"] = "MasterCard"
        cards.append(dict5)
        
        var dict6: [String: String] = [:]
        dict6["card_number"] = "****9933"
        dict6["card_type"] = "American Express"
        cards.append(dict6)
        
        var dict7: [String: String] = [:]
        dict7["name"] = "Fazil"
        dict7["status"] = "Received"
        dict7["date"] = "12 Sep"
        dict7["time"] = "8:26 PM"
        dict7["amount"] = "$565"
        transactions.append(dict7)
        
        
        var dict8: [String: String] = [:]
        dict8["name"] = "Tony Stark"
        dict8["status"] = "Sent"
        dict8["date"] = "21 Dec"
        dict8["time"] = "10:26 am"
        dict8["amount"] = "$50"
        transactions.append(dict8)
        
        var dict9: [String: String] = [:]
        dict9["name"] = "Manu"
        dict9["status"] = "Received"
        dict9["date"] = "04 Mar"
        dict9["time"] = "12:26 PM"
        dict9["amount"] = "$1000"
        transactions.append(dict9)
        
        var dict10: [String: String] = [:]
        dict10["name"] = "chris hemsworth"
        dict10["status"] = "Received"
        dict10["date"] = "04 Mar"
        dict10["time"] = "12:26 PM"
        dict10["amount"] = "$1000"
        transactions.append(dict10)
        
        
        var dict11: [String: String] = [:]
        dict11["name"] = "chris hemsworth"
        dict11["status"] = "Received"
        dict11["date"] = "04 Jun"
        dict11["time"] = "1:26 PM"
        dict11["amount"] = "$1233"
        transactions.append(dict11)
        
        var dict12: [String: String] = [:]
        dict12["name"] = "Fabia Smith"
        dict12["status"] = "Received"
        dict12["date"] = "20 Sep"
        dict12["time"] = "9:44 A"
        dict12["amount"] = "$307"
        transactions.append(dict12)

        
        refreshCollectionView()
        refreshTableView()
        
        
        
    }
    
    func refreshTableView() {
        
        tableView.reloadData()
    }
    
    func refreshCollectionView() {
        
        collectionView.reloadData()
    }
    
    
    func setChartUI() {
        
        chartView.delegate = self
        chartView.chartDescription?.enabled = false
        chartView.setScaleEnabled(false)
        chartView.xAxis.enabled = false
        chartView.leftAxis.enabled = false
        chartView.rightAxis.enabled = false
        chartView.legend.enabled = false
        chartView.setViewPortOffsets(left: 0, top: 0, right: 0, bottom: 0)
        
        let marker = ChartViewMaker()
        marker.chartView = chartView
        marker.minimumSize = CGSize(width: 80, height: 35)
        chartView.marker = marker
        
        let arrData = [10,12,18,23,25,19,24,16,30,35,38,32,31,19,24,16,30,35,38,32,31]
        self.setDataCount(arrData)
        
        chartView.animate(xAxisDuration: 2.5)
        
    }
    
    
    func setDataCount(_ values: [Int]) {
        
        chartView.data = nil
        
        let values = (0..<values.count).map { (i) -> ChartDataEntry in
            
            return ChartDataEntry(x: Double(i+1), y: Double(values[i]))
        }
        
        let set1 = LineChartDataSet(entries: values, label: "")
        set1.axisDependency = .left
        set1.drawIconsEnabled = false
        set1.setColor(AppColor.Theme)
        set1.setCircleColor(AppColor.Theme)
        set1.lineWidth = 2
        set1.drawCircleHoleEnabled = false
        set1.valueFont = .systemFont(ofSize: 0)
        set1.formLineWidth = 0
        set1.formSize = 0
        set1.mode = .cubicBezier
        set1.drawCirclesEnabled = false
        set1.drawVerticalHighlightIndicatorEnabled = false
        set1.drawHorizontalHighlightIndicatorEnabled = false
        
        let gradientColors = [AppColor.Theme.withAlphaComponent(0.01).cgColor, AppColor.Theme.withAlphaComponent(0.25).cgColor]
        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
        
        set1.fillAlpha = 1
        set1.fill = Fill(linearGradient: gradient, angle: 90)
        set1.drawFilledEnabled = true
        
        let data = LineChartData(dataSet: set1)
        data.setValueTextColor(.clear)
        data.setValueFont(.systemFont(ofSize: 0))
        chartView.data = data
        
    }
    
    @objc func actionNotification(_sender: UIBarButtonItem) {
        
        print(#function)
        dismiss(animated: true)
    }
    
    @objc func actionProfile(_ sender: UIButton) {
        
        print(#function)
        dismiss(animated: true)
    }
    
    
    @IBAction func actionCalender(_ sender: Any) {
        print(#function)
        dismiss(animated: true)
    }
    
    @IBAction func actionAdd(_ sender: Any) {
        
        print(#function)
        dismiss(animated: true)
    }
    
}



// MARK: - UICollectionViewDataSource


extension HomeVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
     
        
        cell.bindData(data: cards[indexPath.row])
        cell.setCell(isSelected: (selectedCardIndex == indexPath.row))
        return cell
    }
}

extension HomeVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(#function)
        selectedCardIndex = indexPath.row
        collectionView.reloadData()
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.frame.size.width - 30) * 0.75
        let height = collectionView.frame.size.height - 20
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    }
}


// MARK: - UITableViewDataSource


extension HomeVC: UITableViewDataSource {


    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return transactions.count
        
    }

  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.bindData(index: indexPath, data: transactions[indexPath.row])
        
        print("Table TEST")
    
        return cell
    }
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension HomeVC: UITableViewDelegate {


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 70
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print(#function)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


//  MARK: - ChartViewDelegate


extension HomeVC: ChartViewDelegate {
    
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









