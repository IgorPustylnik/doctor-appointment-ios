//
//  ShortcutCell.swift
//  Doctor Appointment
//
//  Created by Игорь Пустыльник on 06.07.2024.
//

import Foundation
import UIKit

class ShortcutCell: UICollectionViewCell {
    static let identifier = "ShortcutCell"
    
    private lazy var iconView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage()
        $0.tintColor = .appDarkBlue
        $0.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            $0.widthAnchor.constraint(equalToConstant: 24),
            $0.heightAnchor.constraint(equalToConstant: 24)
        ])
        return $0
    } (UIImageView())
    
    private lazy var circleView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .appSecondaryBackground
        $0.layer.cornerRadius = 36
        
        $0.addSubview(iconView)
        
        NSLayoutConstraint.activate([
            iconView.centerXAnchor.constraint(equalTo: $0.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: $0.centerYAnchor)
        ])
        
        return $0
    } (UIView())
    
    private lazy var label: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .appGrey
        $0.font = UIFont(name: "Poppins-Regular", size: 15)
        return $0
    } (UILabel())
    
    public func configure(with shortcut: Shortcut) {
        iconView.image = UIImage(named: shortcut.image)
        label.text = shortcut.name
        setupUI()
    }
    
    private func setupUI() {
        addSubview(circleView)
        addSubview(label)
        
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: topAnchor),
            circleView.heightAnchor.constraint(equalToConstant: 72),
            circleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            circleView.widthAnchor.constraint(equalToConstant: 72),
            
            label.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconView.image = nil
        label.text = nil
    }
}
