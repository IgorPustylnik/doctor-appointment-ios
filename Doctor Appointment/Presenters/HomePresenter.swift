//
//  HomePresenter.swift
//  Doctor Appointment
//
//  Created by Игорь Пустыльник on 03.07.2024.
//

import Foundation

class HomePresenter {
    private let homeModel: HomeModel
    private var inputDelegate: HomeInputDelegate?
    
    init(homeModel: HomeModel) {
        self.homeModel = homeModel
    }
    
    func setInputDelegate(homeInputDelegate: HomeInputDelegate?) {
        self.inputDelegate = homeInputDelegate
    }
}

extension HomePresenter: HomeOutputDelegate {
    func fetchUser() {
        let user = UserModel.shared
        inputDelegate?.setUser(user)
    }
    
    func fetchNextAppointment() {
        let appointment = homeModel.nextAppointment
        inputDelegate?.setNextAppointment(appointment)
    }
}
