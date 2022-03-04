//
//  ForecastTableViewCell.swift
//  SGWeather
//
//  Created by Subramanian Chockalingam on 04/03/22.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    
    lazy var dayLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var conditionImage:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var minLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    lazy var maxLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContentView()
        setupConstraints()
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    private func setupContentView(){
        contentView.addSubviews(dayLabel,conditionImage,minLabel,maxLabel)
    }
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            dayLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            dayLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25)
        ])
        NSLayoutConstraint.activate([
            conditionImage.leadingAnchor.constraint(equalTo: dayLabel.trailingAnchor),
            conditionImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            conditionImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            conditionImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25)
        ])
        NSLayoutConstraint.activate([
            minLabel.leadingAnchor.constraint(equalTo: conditionImage.trailingAnchor),
            minLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            minLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            minLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25)
        ])
        NSLayoutConstraint.activate([
            maxLabel.leadingAnchor.constraint(equalTo: minLabel.trailingAnchor),
            maxLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            maxLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            maxLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25),
            maxLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func setData(forecast:Forecastday?){
        dayLabel.text = forecast?.date?.convertDate(from: .serverFormatDate, to: .displayFormatDate)
        conditionImage.image = UIImage().imageFromURL(string: forecast?.day?.condition?.icon)
        minLabel.text = (forecast?.day?.mintemp_c!.description)! + " ℃"
        maxLabel.text = (forecast?.day?.maxtemp_c!.description)! + " ℃"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


