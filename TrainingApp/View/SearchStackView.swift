//
//  SearchStackView.swift
//  TrainingApp
//
//  Created by Şükrü Şimşek on 18.09.2023.
//

import UIKit

class SearchStackView: UIStackView {
    
    //MARK: - Properties
    private let locationButton = UIButton(type: .system)
    private let searchButton = UIButton(type: .system)
    private let searchTextField = UITextField()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    //MARK: - Helpers
extension SearchStackView{
    private func style(){
        //locationButton style
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.setImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        locationButton.tintColor = .lightGray
        locationButton.contentVerticalAlignment = .fill
        locationButton.contentHorizontalAlignment = .fill
        //searchButton style
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.setImage(UIImage(systemName: "magnifyingglass.circle"), for: .normal)
        searchButton.tintColor = .lightGray
        searchButton.contentVerticalAlignment = .fill
        searchButton.contentHorizontalAlignment = .fill
        //searchTextField style
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.placeholder = "Search"
        searchTextField.font = .boldSystemFont(ofSize: 20)
        searchTextField.borderStyle = .roundedRect
        searchTextField.textAlignment = .left
        searchTextField.backgroundColor = .systemFill
        searchTextField.textColor = .white
    }
    private func layout(){
        addArrangedSubview(locationButton)
        addArrangedSubview(searchTextField)
        addArrangedSubview(searchButton)
        
        NSLayoutConstraint.activate([
            locationButton.widthAnchor.constraint(equalToConstant: 35),
            locationButton.heightAnchor.constraint(equalToConstant: 35),
            searchButton.widthAnchor.constraint(equalToConstant: 35),
            searchButton.heightAnchor.constraint(equalToConstant: 35),
        ])
    }
}
