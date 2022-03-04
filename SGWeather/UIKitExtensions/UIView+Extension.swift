//
//  UIView+Extension.swift
//  SGWeather
//
//  Created by Subramanian Chockalingam on 03/03/22.
//

import UIKit

public extension UIView {
  func addSubviews(_ views: UIView...) {
    for view in views {
      addSubview(view)
    }
  }
}

