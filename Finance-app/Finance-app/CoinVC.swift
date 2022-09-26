//
//  CoinVC.swift
//  Finance-app
//
//  Created by Fazil P on 25/09/2022.
//

import UIKit
import Charts

class CoinVC: UIViewController {
    
    
    @IBOutlet var Titleview: UIView!
    
    @IBOutlet var TitleLabel: UILabel!
    @IBOutlet var SubInfoview: UIView!
    @IBOutlet var SubInfoLabel: UILabel!
    @IBOutlet var Buybutton: UIButton!
    
    @IBOutlet var AmountLabel: UILabel!
    @IBOutlet var ValueLabel: UILabel!
    @IBOutlet var PercentageLabel: UILabel!
    
    @IBOutlet var SegmentedControl: UISegmentedControl!
    @IBOutlet var chartView: LineChartView!
    
    @IBOutlet var MarkerCap1: UILabel!
    @IBOutlet var MarketCap2: UILabel!
    @IBOutlet var Volume1: UILabel!
    @IBOutlet var Volume2: UILabel!
    @IBOutlet var Supply1: UILabel!
    @IBOutlet var Supply2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
        
        navigationItem.titleView = Titleview
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: Buybutton)
        
        SubInfoview.layer.borderWidth = 1
        SubInfoview.layer.borderColor = AppColor.Border.cgColor
        
        loadData()
        updateUI()
        setChartUI()
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

        super.traitCollectionDidChange(previousTraitCollection)
        updateUI()
    }
    
    func loadData() {
        
        TitleLabel.text = "Bitcoin"
        SubInfoLabel.text = "BTC"
        
        AmountLabel.text = "$5000"
        ValueLabel.text = "0.651995028 BTC"
        PercentageLabel.text = "-0.09%"
        
        MarkerCap1.text = "$126,588,346,159 USD"
        MarketCap2.text = "18,339,075 BTC"
        Volume1.text = "$31,692,457,818 USD"
        Volume2.text = "4,591,342 BTC"
        Supply1.text = "18,339,075 BTC"
        Supply2.text = "21,000,000 BTC"
        
    }
    
    func updateUI() {

        let background = UIColor.systemBackground.image(SegmentedControl.frame.size)
        let selected = AppColor.Theme.image(SegmentedControl.frame.size)

        SegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
        SegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : AppColor.Theme], for: .normal)
        SegmentedControl.setBackgroundImage(background, for: .normal, barMetrics: .default)
        SegmentedControl.setBackgroundImage(selected, for: .selected, barMetrics: .default)
        SegmentedControl.setDividerImage(UIColor.clear.image(), forLeftSegmentState: .normal, rightSegmentState: [.normal, .highlighted, .selected], barMetrics: .default)
        SegmentedControl.layer.borderWidth = 1
        SegmentedControl.layer.borderColor = AppColor.Theme.cgColor
    }
    
    
    func setChartUI() {

        chartView.delegate = self
        chartView.chartDescription?.enabled = false
        chartView.setScaleEnabled(false)
        chartView.leftAxis.enabled = false
        chartView.rightAxis.enabled = false
        chartView.legend.enabled = false
        chartView.setViewPortOffsets(left: 0, top: 0, right: 0, bottom: 0)

        let xAxis = chartView.xAxis
        xAxis.axisLineWidth = .zero

        let marker = CoinMarkerView()
        marker.chartView = chartView
        marker.minimumSize = CGSize(width: 80, height: 35)
        chartView.marker = marker

        let arrData = [10,12,18,23,25,19,24,16,30,35,38,32,31,19,24,16,30,35,38,32,31]
        self.setDataCount(arrData)
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
        set1.mode = .linear
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
    
    @IBAction func actionBuy(_ sender: Any) {
        
        print(#function)
    }
    
    



}


extension CoinVC: ChartViewDelegate {

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {

        print(#function)
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func chartViewDidEndPanning(_ chartView: ChartViewBase) {

        print(#function)
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func chartValueNothingSelected(_ chartView: ChartViewBase) {

        print(#function)
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func chartScaled(_ chartView: ChartViewBase, scaleX: CGFloat, scaleY: CGFloat) {

        print(#function)
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func chartTranslated(_ chartView: ChartViewBase, dX: CGFloat, dY: CGFloat) {

        print(#function)
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func chartView(_ chartView: ChartViewBase, animatorDidStop animator: Animator) {

        print(#function)
    }
}


fileprivate extension UIColor {

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {

        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}









