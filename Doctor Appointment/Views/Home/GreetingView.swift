//
//  GreetingView.swift
//  Doctor Appointment
//
//  Created by Игорь Пустыльник on 04.07.2024.
//

import UIKit

class GreetingView: UIView {
    private var name: String
    private var profilePicture: String
    
    private lazy var greetingTextStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
//        $0.alignment = .fill
//        $0.distribution = .fillProportionally
        $0.spacing = 6
        
        let label1 = UILabel()
        label1.text = "Hello".localized() + ","
        label1.textColor = .appGrey
        label1.font = UIFont(name: "Poppins-Regular", size: 16)
        
        let label2 = UILabel()
        label2.text = name
        label2.textColor = .appMainText
        label2.font = UIFont(name: "Poppins-Bold", size: 20)
        
        $0.addArrangedSubview(label1)
        $0.addArrangedSubview(label2)
        
        return $0
    } (UIStackView())
    
    private lazy var profileImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: profilePicture)
        
        NSLayoutConstraint.activate([
            $0.widthAnchor.constraint(equalToConstant: 56),
            $0.heightAnchor.constraint(equalToConstant: 56),
        ])
        return $0
    } (UIImageView())
    
    init(name: String, profilePicture: String) {
        self.name = name
        self.profilePicture = profilePicture
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
