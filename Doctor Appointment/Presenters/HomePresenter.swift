//
//  HomePresenter.swift
//  Doctor Appointment
//
//  Created by Игорь Пустыльник on 03.07.2024.
//

import Foundation

class HomePresenter {
    private let homeModel: HomeModel
    private var homeInputDelegate: HomeInputDelegate?
    
    init(homeModel: HomeModel) {
        self.homeModel = homeModel
    }
    
    func setViewDelegate(homeInputDelegate: HomeInputDelegate?) {
        self.homeInputDelegate = homeInputDelegate
    }
}
