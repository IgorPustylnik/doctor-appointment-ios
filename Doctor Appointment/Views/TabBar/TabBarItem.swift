//
//  TabBarItem.swift
//  Doctor Appointment
//
//  Created by Игорь Пустыльник on 03.07.2024.
//

import Foundation
import UIKit

class TabBarItem: UIView {
    private var tabItem: TabItem
    private var imageRightConstraints: NSLayoutConstraint?
    var isActive: Bool {
        willSet {
            self.imageRightConstraints?.isActive = !newValue
            self.contentView.backgroundColor = newValue ? .selectedTabBarItem : .clear
            self.tabImage.image = newValue ?
                self.tabImage.image?.withTintColor(.appBlue, renderingMode: .alwaysOriginal) :
                self.tabImage.image?.withTintColor(.appGrey, renderingMode: .alwaysOriginal)
            
            UIView.animate(withDuration: 0.2) {
                self.layoutIfNeeded()
            }
        }
    }
    
    private var isSelected: (TabBarItem) -> Void
    
    private lazy var contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = isActive ? .selectedTabBarItem : .clear
        $0.layer.cornerRadius = 12
        
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapOnTab)))
        $0.addSubview(tabImage)
        $0.addSubview(tabText)
        return $0
    } (UIView())
    
    private lazy var tabImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = isActive ? UIImage(named: tabItem.image)?.withTintColor(.appBlue, renderingMode: .alwaysOriginal) : UIImage(named: tabItem.image)?.withTintColor(.appGrey, renderingMode: .alwaysOriginal)
        
        NSLayoutConstraint.activate([
            $0.widthAnchor.constraint(equalToConstant: 24),
            $0.heightAnchor.constraint(equalToConstant: 24)
        ])
            
        return $0
    } (UIImageView())
    
    private lazy var tabText: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = tabItem.name
        $0.textColor = .appBlue
        $0.font = UIFont(name: "Nunito-Bold", size: 14)
        return $0
    } (UILabel())
    
    init(tabItem: TabItem, imageRightConstraints: NSLayoutConstraint? = nil, isActive: Bool, isSelected: @escaping (TabBarItem) -> Void) {
        self.tabItem = tabItem
        self.imageRightConstraints = imageRightConstraints
        self.isActive = isActive
        self.isSelected = isSelected
        super.init (frame: .zero)
        setupUI()
    }
    
    private func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false //
        self.addSubview(contentView)
    
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            tabImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            tabImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            tabImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            
            tabText.leadingAnchor.constraint(equalTo: tabImage.trailingAnchor, constant: 8),
            tabText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            tabText.centerYAnchor.constraint(equalTo: tabImage.centerYAnchor)
        ])
        
        imageRightConstraints = tabImage.trailingAnchor.constraint(equalTo: tabText.trailingAnchor, constant: -8)
        imageRightConstraints?.isActive = !isActive
        
    }
    
    @objc func tapOnTab() {
        self.isSelected(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
