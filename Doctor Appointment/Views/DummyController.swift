//
//  DummyController.swift
//  Doctor Appointment
//
//  Created by Игорь Пустыльник on 06.07.2024.
//

import UIKit

class DummyController: UIViewController {
    
    private lazy var label: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    } (UILabel())
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .appSecondaryBackground
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    init(text: String) {
        super.init(nibName: nil, bundle: nil)
        self.label.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
