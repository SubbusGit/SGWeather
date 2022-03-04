//
//  UIImage+Extenion.swift
//  SGWeather
//
//  Created by Subramanian Chockalingam on 04/03/22.
//

import UIKit

extension UIImage {
    func imageFromURL(string:String?) -> UIImage? {
        guard let str = string,let url = URL(string: "https:"+str) else { return nil }
        let data = try? Data(contentsOf: url)
        
        guard let imageData = data else {
            return nil
        }
        let image = UIImage(data: imageData)
        return image
    }
}
