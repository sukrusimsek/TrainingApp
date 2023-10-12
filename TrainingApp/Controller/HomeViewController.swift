//
//  ViewController.swift
//  TrainingApp
//
//  Created by Şükrü Şimşek on 16.09.2023.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController {
    //MARK: - Properties
    private let backgroundImageView = UIImageView()
    private let cityLabel = UILabel()
    private let temperatureLabel = UILabel()
    private let searchStackView = SearchStackView()
    private let mainStackView = UIStackView()
    private let statusImageView = UIImageView()
    private let locationManager = CLLocationManager()
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        configureLocation()
    }

}
//MARK: - Helpers
extension HomeViewController{
    private func style(){
        //backgroundImageView style
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = UIImage(named: "night.jpeg")
        //label style
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.text = "New York"
        cityLabel.font = .boldSystemFont(ofSize: 50)
        cityLabel.textColor = .white
        //temperatureLabel style
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.attributedText = attributedText(with: "25")
        temperatureLabel.textColor = .white
        temperatureLabel.shadowColor = .blue
        //searchStackView style
        searchStackView.translatesAutoresizingMaskIntoConstraints = false
        searchStackView.axis = .horizontal
        searchStackView.spacing = 12
        //mainStackView style
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.spacing = 12
        mainStackView.alignment = .trailing
        //statusImageView style
        statusImageView.translatesAutoresizingMaskIntoConstraints = false
        statusImageView.image = UIImage(systemName: "sun.max")
        statusImageView.tintColor = .white
    }
    private func layout(){
        view.addSubview(backgroundImageView)
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(searchStackView)
        mainStackView.addArrangedSubview(cityLabel)
        mainStackView.addArrangedSubview(statusImageView)
        mainStackView.addArrangedSubview(temperatureLabel)
        
        
        NSLayoutConstraint.activate([
            //background layout
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            //locationButton layout with searchStackView
            
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            
            //searchButton layout with searchStackView
            searchStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -12),
            searchStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            
          
            
            statusImageView.widthAnchor.constraint(equalToConstant: 50),
            statusImageView.heightAnchor.constraint(equalToConstant: 50)
            
            
        ])
    }
    private func attributedText(with text: String) -> NSMutableAttributedString{
        let attributedText = NSMutableAttributedString(string: text, attributes: [.foregroundColor : UIColor.label, .font: UIFont.boldSystemFont(ofSize: 50)])
        attributedText.append(NSAttributedString(string: "°C", attributes: [.font: UIFont.systemFont(ofSize: 35)]))
        return attributedText
    }
    private func configureLocation(){
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        
    }
}
 //MARK: - CLLocationManagerDelegate
extension HomeViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last!
        print(location.coordinate.latitude)
        print(location.coordinate.longitude)
        locationManager.stopUpdatingLocation()
    }
}
