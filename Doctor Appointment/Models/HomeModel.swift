//
//  HomeModel.swift
//  Doctor Appointment
//
//  Created by Игорь Пустыльник on 03.07.2024.
//

import Foundation
import UIKit

struct Appointment {
    let doctor: Doctor
    let dateFrom: Date?
    let dateTill: Date?
}

struct Shortcut {
    let name: String
    let image: String
    let link: UIViewController.Type

    func clicked(completion: @escaping (UIViewController) -> Void) {
        if link == DummyController.self {
            completion(DummyController(text: name))
        } else {
            completion(UIViewController())
        }
    }
}

struct NearbyDoctor {
    let doctor: Doctor
    let distance: Double
    let openTime: Date?
}

class HomeModel {
    private let doctorsModel = DoctorsModel()
    
    lazy var nextAppointment = Appointment(
        doctor: doctorsModel.getDoctor(id: 0)!,
        dateFrom: createDate(year: 2022, month: 6, day: 12, hour: 11, minute: 00),
        dateTill: createDate(year: 2022, month: 7, day: 12, hour: 12, minute: 00))
    
    let shortcuts: [Shortcut] = [
        Shortcut(name: "Covid-19", image: "covid", link: DummyController.self),
        Shortcut(name: "Doctor".localized(), image: "doctor", link: DummyController.self),
        Shortcut(name: "Medicine".localized(), image: "medicine", link: DummyController.self),
        Shortcut(name: "Hospital".localized(), image: "hospital", link: DummyController.self),
        Shortcut(name: "Hospital".localized(), image: "hospital", link: DummyController.self),
    ]
    
    lazy var nearbyDoctors: [NearbyDoctor] = [
        NearbyDoctor(doctor: doctorsModel.getDoctor(id: 1)!,
                   distance: 1.2, openTime: createDate(year: 2022, month: 7, day: 12, hour: 17, minute: 00)),
        NearbyDoctor(doctor: doctorsModel.getDoctor(id: 2)!,
                   distance: 0.8, openTime: createDate(year: 2022, month: 7, day: 12, hour: 10, minute: 00))
    ]
}

extension HomeModel {
    private func createDate(year: Int, month: Int, day: Int, hour: Int, minute: Int) -> Date? {
        if !(1...12).contains(month) { return nil }
        if !(1...31).contains(day) { return nil }
        if !(0...23).contains(hour) { return nil }
        if !(0...59).contains(minute) { return nil }
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        return calendar.date(from: dateComponents)
    }
}
