//
//  NextAppoinmentView.swift
//  Doctor Appointment
//
//  Created by Игорь Пустыльник on 05.07.2024.
//

import UIKit

class NextAppointmentView: UIView {
    private var appointment: Appointment?
    
    // MARK: - UI Elements
    
    private lazy var topView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubview(doctorImageView)
        $0.addSubview(doctorTextView)
        $0.addSubview(chevronView)
        
        NSLayoutConstraint.activate([
            doctorImageView.topAnchor.constraint(equalTo: $0.topAnchor),
            doctorImageView.bottomAnchor.constraint(equalTo: $0.bottomAnchor),
            doctorImageView.leadingAnchor.constraint(equalTo: $0.leadingAnchor),
            
            doctorTextView.topAnchor.constraint(equalTo: $0.topAnchor),
            doctorTextView.leadingAnchor.constraint(equalTo: doctorImageView.trailingAnchor, constant: 12),
            doctorTextView.centerYAnchor.constraint(equalTo: $0.centerYAnchor),
            
            chevronView.centerYAnchor.constraint(equalTo: $0.centerYAnchor),
            chevronView.trailingAnchor.constraint(equalTo: $0.trailingAnchor),
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
        $0.textColor = .white
        $0.font = UIFont(name: "Poppins-Bold", size: 16)
        return $0
    } (UILabel())
    
    private lazy var doctorRankLabel: UILabel = {
        $0.textColor = .appLightBlue
        $0.font = UIFont(name: "Poppins-Regular", size: 14)
        return $0
    } (UILabel())
    
    private lazy var chevronView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.image = UIImage(systemName: "chevron.right")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        return $0
    } (UIImageView())
    
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
        
        $0.addArrangedSubview(dateView)
        $0.addArrangedSubview(timeView)
        
        return $0
    } (UIStackView())
    
    private lazy var dateView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        let icon = UIImageView(image: UIImage(named: "calendar")?.withTintColor(.white))
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        
        $0.addSubview(icon)
        $0.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: $0.topAnchor),
            icon.leadingAnchor.constraint(equalTo: $0.leadingAnchor),
            icon.widthAnchor.constraint(equalToConstant: 16),
            icon.heightAnchor.constraint(equalToConstant: 16),
            
            dateLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 8),
            dateLabel.centerYAnchor.constraint(equalTo: $0.centerYAnchor)
        ])
        
        return $0
    } (UIView())
    
    private lazy var dateLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .white
        $0.font = UIFont(name: "Poppins-Regular", size: 12)
        return $0
    } (UILabel())
    
    private lazy var timeView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        let icon = UIImageView(image: UIImage(systemName: "clock")?.withTintColor(.white, renderingMode: .alwaysOriginal))
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        $0.addSubview(icon)
        $0.addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: $0.topAnchor),
            icon.leadingAnchor.constraint(equalTo: $0.leadingAnchor),
            icon.widthAnchor.constraint(equalToConstant: 16),
            icon.heightAnchor.constraint(equalToConstant: 16),
            
            timeLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 8),
            timeLabel.centerYAnchor.constraint(equalTo: $0.centerYAnchor)
        ])
        return $0
    } (UIView())
    
    private lazy var timeLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .white
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
    
    func setAppointment(appointment: Appointment) {
        self.appointment = appointment
        updateAppointment()
    }
    
    private func updateAppointment() {
        if let doctor = appointment?.doctor {
            doctorImageView.image = UIImage(named: doctor.photo)
            doctorNameLabel.text = "Dr. " + doctor.name
            doctorRankLabel.text = doctor.rank
        } else {
            doctorImageView.image = UIImage(systemName: "person.fill.questionmark")?.withRenderingMode(.alwaysOriginal)
            doctorNameLabel.text = "???"
            doctorRankLabel.text = "???"
        }
        
        let dateFormatter = DateFormatter()
        var from: String
        var till: String
        
        if let dateFrom = appointment?.dateFrom {
            dateFormatter.locale = Locale(identifier: Locale.current.identifier)
            dateFormatter.dateFormat = "EEEE, d MMMM"
            dateLabel.text = dateFormatter.string(from: dateFrom)
            
            dateFormatter.dateFormat = "HH:mm"
            from = dateFormatter.string(from: dateFrom)
        } else {
            from = "??:??"
            dateLabel.text = "???, ?? ???"
        }
        
        if let dateTill = appointment?.dateTill {
            till = dateFormatter.string(from: dateTill)
        } else {
            till = "??:??"
        }
        
        timeLabel.text = from + " – " + till
        
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .appDarkBlue
        layer.cornerRadius = 12
        
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
            bottomView.heightAnchor.constraint(equalTo: dateLabel.heightAnchor),
            bottomView.leadingAnchor.constraint(equalTo: lineView.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: lineView.trailingAnchor),
        ])
    }
}
