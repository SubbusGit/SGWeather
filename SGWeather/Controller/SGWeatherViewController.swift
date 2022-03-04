//
//  ViewController.swift
//  SGWeather
//
//  Created by Subramanian Chockalingam on 03/03/22.
//

import UIKit

class SGWeatherViewController: UIViewController {
    //City Info View
    //let location = Location(name: "Hyderabad", region: "", country: "India", lat: 100.00, lon: 200.00, tzID: "", localtimeEpoch: 1, localtime: "2022-03-03 21:25")
    lazy var infoView : LocationInfoView = {
        let view = LocationInfoView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var forecastView : ForecastView = {
        let view = ForecastView(with: sgWeatherViewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var regularWidthConstraints :[NSLayoutConstraint] = []
    var compactWidthConstraints:[NSLayoutConstraint] = []
    var sgWeatherViewModel = SGWeatherViewModel(withLocation: "Chennai")
   

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setupConstraints()
        activateTrait(traits: UIScreen.main.traitCollection)
        setupViewModel()
    }
    private func setupViewModel(){
        //show activity indicator
        sgWeatherViewModel.getData(handler: { isSuccess in
            if isSuccess{
                self.updateUI()
            }
        })
    }

    private func setUpViews(){
        view.backgroundColor = .white
        view.addSubviews(infoView,forecastView)
    }
    
    private func setupConstraints() {
      //let safeArea = view.safeAreaLayoutGuide

        compactWidthConstraints.append(contentsOf: [
        infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        infoView.topAnchor.constraint(equalTo: view.topAnchor),
        infoView.widthAnchor.constraint(equalTo: view.widthAnchor),
        infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        infoView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
        
        forecastView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        forecastView.topAnchor.constraint(equalTo: infoView.bottomAnchor),
        forecastView.widthAnchor.constraint(equalTo: view.widthAnchor),
        forecastView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8),
        forecastView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        forecastView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ])
        
        regularWidthConstraints.append(contentsOf: [
        infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        infoView.topAnchor.constraint(equalTo: view.topAnchor),
        infoView.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.4),
        infoView.heightAnchor.constraint(equalTo: view.heightAnchor),
        
        forecastView.leadingAnchor.constraint(equalTo: infoView.trailingAnchor),
        forecastView.topAnchor.constraint(equalTo: view.topAnchor),
        forecastView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
        forecastView.heightAnchor.constraint(equalTo: view.heightAnchor),
        forecastView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        forecastView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ])
    }
    private func activateTrait(traits:UITraitCollection){
        if traits.horizontalSizeClass == .compact {
            if !regularWidthConstraints.isEmpty && regularWidthConstraints[0].isActive {
                NSLayoutConstraint.deactivate(regularWidthConstraints)
            }
            NSLayoutConstraint.activate(compactWidthConstraints)
        }else{
            if !compactWidthConstraints.isEmpty && compactWidthConstraints[0].isActive {
                NSLayoutConstraint.deactivate(compactWidthConstraints)
            }
            NSLayoutConstraint.activate(regularWidthConstraints)
        }
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        activateTrait(traits: traitCollection)
    }
    private func updateUI(){
        DispatchQueue.main.async {
            self.infoView.configureLocationView(location: self.sgWeatherViewModel.sgWeatherData!.location!)
            self.forecastView.configureForecastView()
        }
    }
}

