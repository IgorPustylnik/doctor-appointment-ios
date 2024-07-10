//
//  TabBarPresenter.swift
//  Doctor Appointment
//
//  Created by Игорь Пустыльник on 03.07.2024.
//

import Foundation
import UIKit

class TabBarPresenter {
    private let tabBarModel: TabBarModel
    private var tabBarInputDelegate: TabBarInputDelegate?
    
    init(tabBarModel: TabBarModel) {
        self.tabBarModel = tabBarModel
    }
    
    func setViewDelegate(tabBarViewDelegate: TabBarInputDelegate?) {
        self.tabBarInputDelegate = tabBarViewDelegate
    }
}

extension TabBarPresenter: TabBarOutputDelegate {
    func setupVCs() {
        tabBarInputDelegate?.setupVCs(with: tabBarModel.controllers)
    }
    
    func setupTabs() {
        tabBarInputDelegate?.setupTabs(with: tabBarModel.tabItems)
    }
}
