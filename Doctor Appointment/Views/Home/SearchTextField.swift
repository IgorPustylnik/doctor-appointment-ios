//
//  SearchView.swift
//  Doctor Appointment
//
//  Created by Игорь Пустыльник on 06.07.2024.
//

import UIKit

protocol SearchDelegate {
    func search(query: String)
}

class SearchTextField: UITextField {
    
    private var searchDelegate: SearchDelegate?
    
    private lazy var imageContainerView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.frame = CGRect(x: 10, y: 0, width: 52, height: 24)
        
        let imageView = UIImageView(frame: CGRect(x: 16, y: 0, width: 24, height: 24))
        let image = UIImage(named: "magnifier")?.withTintColor(.appGrey, renderingMode: .alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        $0.addSubview(imageView)
        
        return $0
    } (UIView())
    
    init(searchDelegate: SearchDelegate) {
        self.searchDelegate = searchDelegate
        super.init(frame: .zero)
        self.delegate = self
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .appSecondaryBackgroud
        layer.cornerRadius = 12
        autocorrectionType = .no
        autocapitalizationType = .none
        
        placeholder = "Search doctor or health issue".localized()
        
        font = UIFont(name: "Poppins-Regular", size: 15)
        textColor = .appGrey
    
        leftView = imageContainerView
        leftViewMode = .always
    }
    
}

extension SearchTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self {
            resignFirstResponder()
            guard let query = text else { return true }
            searchDelegate?.search(query: query)
        }
        return true
    }
}
