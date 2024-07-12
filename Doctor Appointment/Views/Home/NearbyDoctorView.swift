//
//  NearbyDoctorsCollectionView.swift
//  Doctor Appointment
//
//  Created by Игорь Пустыльник on 07.07.2024.
//

import UIKit

class NearbyDoctorView: UIView {
    
    // MARK: - UI Elements
    
    private lazy var topView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubview(doctorImageView)
        $0.addSubview(doctorTextView)
        $0.addSubview(distanceView)
        
        NSLayoutConstraint.activate([
            doctorImageView.topAnchor.constraint(equalTo: $0.topAnchor),
            doctorImageView.bottomAnchor.constraint(equalTo: $0.bottomAnchor),
            doctorImageView.leadingAnchor.constraint(equalTo: $0.leadingAnchor),
            
            doctorTextView.topAnchor.constraint(equalTo: $0.topAnchor),
            doctorTextView.leadingAnchor.constraint(equalTo: doctorImageView.trailingAnchor, constant: 12),
            doctorTextView.centerYAnchor.constraint(equalTo: $0.centerYAnchor),
            
            distanceView.centerYAnchor.constraint(equalTo: $0.centerYAnchor),
            distanceView.trailingAnchor.constraint(equalTo: $0.trailingAnchor),
        ])
        
        return $0
    } (UIView())
    
    private lazy var doctorImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            $0.widthAnchor.constraint(equalToConstant: 48),
            $0.heightAnchor.constraint(equalToConstant: 48),
        ])
        
        return $0
    } (UIImageView())
    
    private lazy var doctorTextView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 8
        
        $0.addArrangedSubview(doctorNameLabel)
        $0.addArrangedSubview(doctorRankLabel)
        
        return $0
    } (UIStackView())
    
    private lazy var doctorNameLabel: UILabel = {
        $0.textColor = .appMainText
        $0.font = UIFont(name: "Poppins-Bold", size: 16)
        return $0
    } (UILabel())
    
    private lazy var doctorRankLabel: UILabel = {
        $0.textColor = .appLightBlue
        $0.font = UIFont(name: "Poppins-Regular", size: 14)
        return $0
    } (UILabel())
    
    private lazy var distanceLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .appGrey
        $0.font = UIFont(name: "Poppins-Regular", size: 14)
        return $0
    } (UILabel())
    
    private lazy var distanceView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        let icon = UIImageView()
        icon.image = UIImage(named: "location")?.withTintColor(.appGrey, renderingMode: .alwaysOriginal)
        icon.clipsToBounds = true
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        $0.addSubview(distanceLabel)
        $0.addSubview(icon)
        
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: $0.centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: $0.leadingAnchor),
            icon.widthAnchor.constraint(equalToConstant: 16),
            icon.heightAnchor.constraint(equalToConstant: 16),
            
            distanceLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 8),
            distanceLabel.trailingAnchor.constraint(equalTo: $0.trailingAnchor),
            distanceLabel.centerYAnchor.constraint(equalTo: $0.centerYAnchor)
        ])
        
        return $0
    } (UIView())
    
    private lazy var lineView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .appDimmedWhite
        return $0
    } (UIView())
    
    private lazy var bottomView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = 0
        $0.alignment = .fill
        $0.distribution = .fillEqually
        
        $0.addArrangedSubview(ratingView)
        $0.addArrangedSubview(openTimeView)
        
        return $0
    } (UIStackView())
    
    private lazy var ratingView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        let icon = UIImageView(image: UIImage(systemName: "star.fill")?.withTintColor(.appYellow, renderingMode: .alwaysOriginal))
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        
        $0.addSubview(icon)
        $0.addSubview(ratingLabel)
        
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: $0.topAnchor),
            icon.leadingAnchor.constraint(equalTo: $0.leadingAnchor),
            icon.widthAnchor.constraint(equalToConstant: 16),
            icon.heightAnchor.constraint(equalToConstant: 16),
            
            ratingLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 8),
            ratingLabel.centerYAnchor.constraint(equalTo: $0.centerYAnchor)
        ])
        
        return $0
    } (UIView())
    
    private lazy var ratingLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .appYellow
        $0.font = UIFont(name: "Poppins-Regular", size: 12)
        return $0
    } (UILabel())
    
    private lazy var openTimeView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        let icon = UIImageView(image: UIImage(systemName: "clock")?.withTintColor(.appBlue, renderingMode: .alwaysOriginal))
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        $0.addSubview(icon)
        $0.addSubview(openTimeLabel)
        
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: $0.topAnchor),
            icon.leadingAnchor.constraint(equalTo: $0.leadingAnchor),
            icon.widthAnchor.constraint(equalToConstant: 16),
            icon.heightAnchor.constraint(equalToConstant: 16),
            
            openTimeLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 8),
            openTimeLabel.centerYAnchor.constraint(equalTo: $0.centerYAnchor)
        ])
        return $0
    } (UIView())
    
    private lazy var openTimeLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .appBlue
        $0.font = UIFont(name: "Poppins-Regular", size: 12)
        return $0
    } (UILabel())
    
    // MARK: - Lifecycle
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with nearbyDoctor: NearbyDoctor) {
        setWithModel(with: nearbyDoctor)
        layoutIfNeeded()
    }
    
    private func setWithModel(with nearbyDoctor: NearbyDoctor) {
        if let photoName = nearbyDoctor.doctor.photo {
            if let photo = UIImage(named: photoName) {
                doctorImageView.image = photo
            } else {
                doctorImageView.image = UIImage(systemName: "person.fill.questionmark")?.withRenderingMode(.alwaysOriginal)
            }
        } else {
            doctorImageView.image = UIImage(systemName: "person.fill.questionmark")?.withRenderingMode(.alwaysOriginal)
        }
        
        doctorNameLabel.text = "Dr.".localized() + " " + nearbyDoctor.doctor.name
        doctorRankLabel.text = nearbyDoctor.doctor.rank
        distanceLabel.text = nearbyDoctor.distance.description + " KM"
        ratingLabel.text = "\(nearbyDoctor.doctor.rating.0) (\(nearbyDoctor.doctor.rating.1) " + "Reviews".localized() + ")"
        guard let openTime = nearbyDoctor.openTime else {
            openTimeLabel.text = "??:??"
            return
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        openTimeLabel.text = "Open at".localized() + " \(dateFormatter.string(from: openTime))"
    }
    
    // MARK: -  UI Setup
    
    private func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .appBackground
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.appShadow.cgColor // doesn't change when changing the system appearance
        layer.shadowRadius = 20
        layer.shadowOpacity = 0.04
        layer.shadowOffset = CGSize(width: 2, height: 12)
        
        addSubview(topView)
        addSubview(lineView)
        addSubview(bottomView)
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            topView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            lineView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 16),
            lineView.heightAnchor.constraint(equalToConstant: 1 / UIScreen.main.scale),
            lineView.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            
            bottomView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 16),
            bottomView.heightAnchor.constraint(equalTo: ratingLabel.heightAnchor),
            bottomView.leadingAnchor.constraint(equalTo: lineView.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: lineView.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
}
