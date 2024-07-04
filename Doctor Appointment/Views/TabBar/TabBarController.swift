//
//  TabBarController.swift
//  Doctor Appointment
//
//  Created by Игорь Пустыльник on 03.07.2024.
//

import UIKit

protocol TabBarInputDelegate {
    func setupVCs(with vcs: [UIViewController])
    func setupTabs(with tabs: [TabItem])
}

protocol TabBarOutputDelegate {
    func setupVCs()
    func setupTabs()
}

class TabBarController: UITabBarController {
    
    private let presenter = TabBarPresenter(tabBarModel: TabBarModel())
    private var outputDelegate: TabBarOutputDelegate?
    
    private lazy var tabView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemBackground
        $0.clipsToBounds = true
        
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .opaqueSeparator
        $0.addSubview(line)
        
        NSLayoutConstraint.activate([
            line.topAnchor.constraint(equalTo: $0.topAnchor),
            line.leadingAnchor.constraint(equalTo: $0.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: $0.trailingAnchor),
            line.heightAnchor.constraint(equalToConstant: 1 / UIScreen.main.scale),
        ])
        
        $0.addSubview(tabViewStack)
        return $0
    } (UIView())
    
    private lazy var tabViewStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .equalSpacing
        return $0
    } (UIStackView())
    
    override func viewWillAppear(_ animated: Bool) {
        outputDelegate?.setupTabs()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.outputDelegate = presenter
        presenter.setViewDelegate(tabBarViewDelegate: self)
        outputDelegate?.setupVCs()
        setupUI()
    }
    
    private func setupUI() {
        tabBar.isHidden = true
        
        view.addSubview(tabView)
        
        NSLayoutConstraint.activate([
            tabView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tabView.heightAnchor.constraint(equalToConstant: 80),
            
            tabViewStack.topAnchor.constraint(equalTo: tabView.topAnchor),
            tabViewStack.bottomAnchor.constraint(equalTo: tabView.bottomAnchor),
            tabViewStack.leadingAnchor.constraint(equalTo: tabView.leadingAnchor, constant: 24),
            tabViewStack.trailingAnchor.constraint(equalTo: tabView.trailingAnchor, constant: -24),
        ])
    }
    
    private func createTabItem(item: TabItem, isFirst: Bool = false) -> UIView {
        TabBarItem(tabItem: item, isActive: isFirst) { [weak self] selectedItem in
            guard let self = self else { return }
            
            self.tabViewStack.arrangedSubviews.forEach {
                guard let tabItem = $0 as? TabBarItem else { return }
                tabItem.isActive = false
            }
            
            selectedItem.isActive.toggle()
            self.selectedIndex = item.index
        }
    }
}

extension TabBarController: TabBarInputDelegate {
    func setupTabs(with tabs: [TabItem]) {
        tabs.enumerated().forEach { item in
            if item.offset == 0 {
                tabViewStack.addArrangedSubview(createTabItem(item: item.element, isFirst: true))
            } else {
                tabViewStack.addArrangedSubview(createTabItem(item: item.element))
            }
        }
    }
    
    func setupVCs(with vcs: [UIViewController]) {
        setViewControllers(vcs, animated: true)
    }
        
}
