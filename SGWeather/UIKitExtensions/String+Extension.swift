//
//  UIDate+Extension.swift
//  SGWeather
//
//  Created by Subramanian Chockalingam on 04/03/22.
//

import UIKit

extension String {
    public func convertDate(from:DateFormat,to:DateFormat)->String{
        let formatter = DateFormatter()
        formatter.dateFormat = from.rawValue
        guard let date = formatter.date(from: self) else {
            return ""
        }
        formatter.dateFormat = to.rawValue
        let result = formatter.string(from: date)
        return result
    }
}
extension Date{
    func today(format:DateFormat) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        let result = formatter.string(from: Date())
        return result
    }
}
public enum DateFormat:String {
    case serverFormatDateWithTime = "yyyy-MM-dd HH:mm"
    case displayFormatDateWithTime = "MMM dd, yyyy hh:mm a"
    case serverFormatDate = "yyyy-MM-dd"
    case displayFormatDate = "MMM dd"
}
