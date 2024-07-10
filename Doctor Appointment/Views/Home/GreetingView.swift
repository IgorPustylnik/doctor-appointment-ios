//
//  GreetingView.swift
//  Doctor Appointment
//
//  Created by Игорь Пустыльник on 04.07.2024.
//

import UIKit

class GreetingView: UIView {
    private var user: User?
    
    // MARK: - UI Elements
    
    private lazy var greetingTextStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 6
        
        let label1 = UILabel()
        label1.text = "Hello".localized() + ","
        label1.textColor = .appGrey
        label1.font = UIFont(name: "Poppins-Regular", size: 16)
        
        $0.addArrangedSubview(label1)
        $0.addArrangedSubview(userNameLabel)
        
        return $0
    } (UIStackView())
    
    private lazy var userNameLabel: UILabel = {
        $0.textColor = .appMainText
        $0.font = UIFont(name: "Poppins-Bold", size: 20)
        return $0
    } (UILabel())
    
    private lazy var profileImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            $0.widthAnchor.constraint(equalToConstant: 56),
            $0.heightAnchor.constraint(equalToConstant: 56),
        ])
        return $0
    } (UIImageView())
    
    // MARK: - Lifecycle
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUser(user: User) {
        self.user = user
        updateUser()
    }
    
    private func updateUser() {
        if let user = user {
            userNameLabel.text = user.name
            profileImageView.image = UIImage(named: user.profilePicture)
        } else {
            userNameLabel.text = "???"
            profileImageView.image = UIImage(systemName: "person.fill.questionmark")?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(greetingTextStackView)
        self.addSubview(profileImageView)
        
        NSLayoutConstraint.activate([
            greetingTextStackView.topAnchor.constraint(equalTo: topAnchor, constant: 4.5),
            greetingTextStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4.5),
            greetingTextStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            profileImageView.topAnchor.constraint(equalTo: topAnchor),
            profileImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
