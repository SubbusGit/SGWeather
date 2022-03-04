//
//  SGWeatherViewModel.swift
//  SGWeather
//
//  Created by Subramanian Chockalingam on 04/03/22.
//

import UIKit

class SGWeatherViewModel {
    var sgWeatherData:SGWeather?
    var location:String!

    init(withLocation location: String){
        self.location = location
    }
    
    func getData(handler: @escaping (_ isSuccess:Bool)->Void){
        NetworkManager.shared.getdata(forLocation: location, handler: { data in
            guard let model = data else {
                handler(false)
                return
            }
            self.sgWeatherData = model
            handler(true)
        })
    }
    func imageFromURL(string:String?, handler: @escaping (_ image:UIImage?)->Void)  {
     NetworkManager.shared.getImage(url: string!, handler: { image in
         handler(image)
        })
    }
    func getDailyForecast()->[Forecastday]?{
        return self.sgWeatherData?.forecast?.forecastday
    }
    

}
