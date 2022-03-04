//
//  ForecastView.swift
//  SGWeather
//
//  Created by Subramanian Chockalingam on 03/03/22.
//

import UIKit

class ForecastView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
     lazy var forecastTableView : UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.register(ForecastTableViewCell.self, forCellReuseIdentifier: "forecastcell")
        return tableView
    }()
    private var viewModel:SGWeatherViewModel?
    private var dailyForecast:[Forecastday] = []
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    public convenience init(with viewModel:SGWeatherViewModel){
        self.init(frame: .zero)
        self.viewModel = viewModel
    }
    
    private func setupViews(){
        self.backgroundColor = .white
        addSubviews(forecastTableView)
    }
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            forecastTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Layout.padding),
            forecastTableView.topAnchor.constraint(equalTo: self.topAnchor, constant: Layout.padding),
            forecastTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Layout.padding),
            forecastTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Layout.padding)
        ])
       
    }
    func configureForecastView(){
        guard let foreCast = viewModel?.getDailyForecast(), !foreCast.isEmpty else{
            return
        }
        self.dailyForecast = foreCast
        self.forecastTableView.reloadData()
    }
    

}

extension ForecastView : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyForecast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "forecastcell") as? ForecastTableViewCell else {
            let cell = UITableViewCell()
            return cell
        }
        let data = viewModel?.sgWeatherData?.forecast?.forecastday?[indexPath.row]
        cell.setData(forecast: data)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    
}
