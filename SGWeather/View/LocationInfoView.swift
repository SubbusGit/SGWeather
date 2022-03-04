//
//  LocationInfoView.swift
//  SGWeather
//
//  Created by Subramanian Chockalingam on 03/03/22.
//

import UIKit

final class LocationInfoView: UIView {

    private lazy var locationLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        return label
    }()
    private lazy var dateLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    public convenience init(with location:Location){
        self.init(frame: .zero)
        configureLocationView(location: location)
    }
    
    private func setupViews(){
        self.backgroundColor = .white
        addSubviews(locationLabel,dateLabel)
    }
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            locationLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            dateLabel.heightAnchor.constraint(equalToConstant: Layout.padding),
        ])
    }
     func configureLocationView(location:Location){
        locationLabel.text = location.name!.capitalized + ", " + location.country!.capitalized
         dateLabel.text = Date().today(format: .displayFormatDateWithTime)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
