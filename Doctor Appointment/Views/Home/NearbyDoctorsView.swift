//
//  NearbyDoctorCell.swift
//  Doctor Appointment
//
//  Created by Игорь Пустыльник on 07.07.2024.
//

import UIKit

class NearbyDoctorsView: UIView {
    var nearbyDoctors: [NearbyDoctor]?
    
    private lazy var label: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont(name: "Poppins-SemiBold", size: 16)
        $0.textColor = .appMainText
        $0.text = "Nearby doctors".localized()
        return $0
    } (UILabel())
    
    private lazy var stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 12
        return $0
    } (UIStackView())
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setNearbyDoctors(_ nearbyDoctors: [NearbyDoctor]) {
        self.nearbyDoctors = nearbyDoctors
        removeAllSubviews()
        for nd in nearbyDoctors {
            let view = NearbyDoctorView()
            view.configure(with: nd)
            stackView.addArrangedSubview(view)
        }
    }
    
    private func removeAllSubviews() {
        for subview in stackView.arrangedSubviews {
            stackView.removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
    }
    
    private func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(label)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            stackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
    }
    
}
