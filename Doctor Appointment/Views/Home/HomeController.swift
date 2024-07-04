//
//  HomeController.swift
//  Doctor Appointment
//
//  Created by Игорь Пустыльник on 03.07.2024.
//

import UIKit

protocol HomeInputDelegate {
    
}

protocol HomeOutputDelegate {
    
}

class HomeController: UIViewController {
    
    private let presenter = HomePresenter(homeModel: HomeModel())
    private var outputDelegate: HomeOutputDelegate?
    
    private lazy var scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubview(contentView)
        return $0
    } (UIScrollView())
    
    private lazy var contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
    
        $0.addSubview(greetingView)

        return $0
    } (UIView())
    
    private lazy var greetingView = GreetingView(name: "James", profilePicture: "profilePicture")

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        scrollView.contentInset = UIEdgeInsets(top: view.safeAreaInsets.top + 20, left: 0, bottom: 0, right: 0)
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        
        let l1 = UILabel()
        l1.translatesAutoresizingMaskIntoConstraints = false
        l1.text = "TEST"
        l1.textColor = .appMainText
        l1.font = .systemFont(ofSize: 20)
        
        contentView.addSubview(l1)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                        
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            greetingView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            greetingView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            greetingView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),

            l1.topAnchor.constraint(equalTo: greetingView.topAnchor, constant: 900),
            l1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            l1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100)
        ])
    }
}

extension HomeController: HomeInputDelegate {
    func setupGreeting(with name: String) {
        
    }
}
