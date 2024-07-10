//
//  NearbyDoctorCell.swift
//  Doctor Appointment
//
//  Created by Игорь Пустыльник on 07.07.2024.
//

import UIKit

class NearbyDoctorsStackView: UIStackView {
    var nearbyDoctors: [NearbyDoctor]?
    
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
            addArrangedSubview(view)
        }
    }
    
    private func removeAllSubviews() {
        for subview in arrangedSubviews {
            removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
    }
    
    private func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        axis = .vertical
        distribution = .fillEqually
        spacing = 15
    }
    
}
