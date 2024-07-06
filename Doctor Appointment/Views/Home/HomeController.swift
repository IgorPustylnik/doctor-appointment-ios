//
//  HomeController.swift
//  Doctor Appointment
//
//  Created by Игорь Пустыльник on 03.07.2024.
//

import UIKit

// MARK: - Delegates protocols

protocol HomeInputDelegate {
    func setUser(_ user: User)
    func setNextAppointment(_ appointment: Appointment)
    func setShortcuts(with shortcuts: [Shortcut])
}

protocol HomeOutputDelegate {
    func fetchUser()
    func fetchNextAppointment()
    func fetchShortcuts()
}

// MARK: - HomeController

class HomeController: UIViewController {
    
    private let presenter = HomePresenter(homeModel: HomeModel())
    private var outputDelegate: HomeOutputDelegate?
    
    // MARK: - UI Elements
    
    private lazy var scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alwaysBounceVertical = true
        return $0
    } (UIScrollView())
    
    private lazy var contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    } (UIView())
    
    private lazy var greetingView = GreetingView()
    private lazy var nextAppointmentView = NextAppointmentView()
    private lazy var searchTextField = SearchTextField(searchDelegate: self)
    private lazy var shortcutsCollectionView = ShortcutsCollectionView(shortcutsDelegate: self)
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        outputDelegate = presenter
        presenter.setInputDelegate(homeInputDelegate: self)
        outputDelegate?.fetchUser()
        outputDelegate?.fetchNextAppointment()
        outputDelegate?.fetchShortcuts()
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(greetingView)
        contentView.addSubview(nextAppointmentView)
        contentView.addSubview(searchTextField)
        contentView.addSubview(shortcutsCollectionView)
    
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
            
            greetingView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            greetingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            greetingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            nextAppointmentView.topAnchor.constraint(equalTo: greetingView.bottomAnchor, constant: 32),
            nextAppointmentView.leadingAnchor.constraint(equalTo: greetingView.leadingAnchor),
            nextAppointmentView.trailingAnchor.constraint(equalTo: greetingView.trailingAnchor),
            nextAppointmentView.heightAnchor.constraint(equalToConstant: 138),
            
            searchTextField.topAnchor.constraint(equalTo: nextAppointmentView.bottomAnchor, constant: 20),
            searchTextField.heightAnchor.constraint(equalToConstant: 56),
            searchTextField.leadingAnchor.constraint(equalTo: nextAppointmentView.leadingAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: nextAppointmentView.trailingAnchor),
            
            shortcutsCollectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 24),
            shortcutsCollectionView.heightAnchor.constraint(equalToConstant: 103),
            shortcutsCollectionView.leadingAnchor.constraint(equalTo: searchTextField.leadingAnchor),
            shortcutsCollectionView.trailingAnchor.constraint(equalTo: searchTextField.trailingAnchor),
            
            shortcutsCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100)
        ])
        
        let hConst = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        hConst.isActive = true
        hConst.priority = UILayoutPriority(50)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
//        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - Input Delegate

extension HomeController: HomeInputDelegate {
    func setUser(_ user: User) {
        greetingView.setUser(user: user)
    }
    
    func setNextAppointment(_ appointment: Appointment) {
        nextAppointmentView.setAppointment(appointment: appointment)
    }
    
    func setShortcuts(with shortcuts: [Shortcut]) {
        shortcutsCollectionView.setShortcuts(with: shortcuts)
    }
}

// MARK: - Search Delegate

extension HomeController: SearchDelegate {
    func search(query: String) {
        print("Search: \(query)")
    }
    
}

// MARK: - Shortcuts Delegate

extension HomeController: ShortcutsDelegate {
    func showVC(_ vc: UIViewController) {
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true)
    }
    
}
