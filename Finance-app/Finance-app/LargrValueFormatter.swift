//
//  LargrValueFormatter.swift
//  Finance-app
//
//  Created by Fazil P on 21/09/2022.
//

import Foundation
import Charts


private let MAX_LENGTH = 5

@objc protocol Testing123 { }

//-----------------------------------------------------------------------------------------------------------------------------------------------
public class IntAxisValueFormatter: NSObject, IAxisValueFormatter {
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        
        return "\(Int(value))"
    }
}

//-----------------------------------------------------------------------------------------------------------------------------------------------
public class LargeValueFormatter: NSObject, IValueFormatter, IAxisValueFormatter {
    
    public var suffix = ["", "k", "m", "b", "t"]
    public var appendix: String?
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    public init(appendix: String? = nil) {
        
        self.appendix = appendix
    }
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    fileprivate func format(value: Double) -> String {
        
        var sig = value
        var length = 0
        let maxLength = suffix.count - 1
        
        while sig >= 1000.0 && length < maxLength {
            sig /= 1000.0
            length += 1
        }
        
        var r = String(format: "%2.f", sig) + suffix[length]
        
        if let appendix = appendix {
            r += appendix
        }
        return r
    }
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return format(value: value)
    }
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    public func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        
        return format(value: value)
    }
}
