//
//  CoinRateCollectionViewCell.swift
//  Finance-app
//
//  Created by Fazil P on 24/09/2022.
//

import UIKit
import Charts


class CoinRateCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var viewBackground: UIView!
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var ValueLabel: UILabel!
    @IBOutlet var PercentageLabel: UILabel!
    @IBOutlet var ImageViewIn: UIImageView!
    @IBOutlet var chartView: LineChartView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
    
    func bindData(data: [String: String]) {

        guard let name = data["name"] else { return }
        guard let amount = data["amount"] else { return }
        guard let percentage = data["percentage"] else { return }
        guard let isPlus = data["isPlus"] else { return }

        NameLabel.text = name.uppercased()
        ValueLabel.text = amount
        PercentageLabel.text = ((isPlus == "Plus") ? "+ " : "- ") + percentage
        ImageViewIn.image = UIImage(systemName: ((isPlus == "Plus") ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill"))
        setChartUI()
    }
    
    
    func setCell(isSelected: Bool) {
        
        viewBackground.backgroundColor = isSelected ? UIColor.systemBackground : UIColor.tertiarySystemFill
        viewBackground.layer.borderWidth = isSelected ? 1 : 0
        viewBackground.layer.borderColor = isSelected ? AppColor.Border.cgColor : UIColor.clear.cgColor
    }
    
    
    func setChartUI() {

        chartView.delegate = self
        chartView.chartDescription?.enabled = false
        chartView.setScaleEnabled(false)
        chartView.xAxis.enabled = false
        chartView.leftAxis.enabled = false
        chartView.rightAxis.enabled = false
        chartView.legend.enabled = false
        chartView.isUserInteractionEnabled = false
        chartView.setViewPortOffsets(left: 0, top: 0, right: 0, bottom: 0)

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

        let gradientColors = [AppColor.Theme.withAlphaComponent(0.01).cgColor,
                              AppColor.Theme.withAlphaComponent(0.25).cgColor]
        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!

        set1.fillAlpha = 1
        set1.fill = Fill(linearGradient: gradient, angle: 90)
        set1.drawFilledEnabled = true

        let data = LineChartData(dataSet: set1)
        data.setValueTextColor(.clear)
        data.setValueFont(.systemFont(ofSize: 0))
        chartView.data = data
    }

}


extension CoinRateCollectionViewCell: ChartViewDelegate {
    
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




















