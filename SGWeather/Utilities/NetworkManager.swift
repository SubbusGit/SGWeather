//
//  NetworkManager.swift
//  SGWeather
//
//  Created by Subramanian Chockalingam on 04/03/22.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    let API_KEY = "522db6a157a748e2996212343221502"
    typealias CompletionHandler = (_ sgData:SGWeather?) -> Void
    
    public func getdata(forLocation location:String,  handler: @escaping CompletionHandler) {
        let session = URLSession(configuration: .default)
        var request = URLRequest(url: URL(string: "https://api.weatherapi.com/v1/forecast.json?key=\(API_KEY)&q=\(location)&days=30&aqi=no&alerts=no")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        session.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
              }
            let sgWeatherModel = try? JSONDecoder().decode(SGWeather.self, from: data)
               handler(sgWeatherModel)
        }.resume()
    }
    public func getImage(url:String, handler: @escaping (_ image:UIImage?)->Void){
        let session = URLSession(configuration: .default)
        var request = URLRequest(url: URL(string: "https:"+url)!)
        request.httpMethod = "GET"
        session.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
              }
            
            let image = UIImage(data: data)
            handler(image)
        }.resume()
        
    }

}
