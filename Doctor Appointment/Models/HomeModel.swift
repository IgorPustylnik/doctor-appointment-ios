//
//  HomeModel.swift
//  Doctor Appointment
//
//  Created by Игорь Пустыльник on 03.07.2024.
//

import Foundation

struct Appointment {
    let doctor: Doctor
    let dateFrom: Date?
    let dateTill: Date?
}

struct CircularButton {
    let index: Int
    let name: String
    let image: String
}

struct NearDoctor {
    let doctor: Doctor
    let distance: Double
    let rating: Double
    let ratingCount: Int
    let openTime: Date?
}

class HomeModel {
    private let doctorsModel = DoctorsModel()
    
    lazy var nextAppointment = Appointment(
        doctor: doctorsModel.getDoctor(id: 0)!,
        dateFrom: createDate(year: 2022, month: 6, day: 12, hour: 11, minute: 00),
        dateTill: createDate(year: 2022, month: 7, day: 12, hour: 12, minute: 00))
    
    let circularButtons: [CircularButton] = [
        CircularButton(index: 0, name: "Covid 19", image: "covid"),
        CircularButton(index: 1, name: "Doctor", image: "doctor"),
        CircularButton(index: 2, name: "Medicine", image: "medicine"),
        CircularButton(index: 3, name: "Hospital", image: "hospital"),
    ]
    
    lazy var nearDoctors: [NearDoctor] = [
        NearDoctor(doctor: doctorsModel.getDoctor(id: 1)!,
                   distance: 1.2, rating: 4.8, ratingCount: 120,
                   openTime: createDate(year: 2022, month: 7, day: 12, hour: 17, minute: 00)),
        NearDoctor(doctor: doctorsModel.getDoctor(id: 2)!,
                   distance: 0.8, rating: 4.6, ratingCount: 74,
                   openTime: createDate(year: 2022, month: 7, day: 12, hour: 10, minute: 00))
    ]
}

extension HomeModel {
    private func createDate(year: Int, month: Int, day: Int, hour: Int, minute: Int) -> Date? {
        if !(1...12).contains(month) { return nil }
        if !(1...31).contains(day) { return nil }
        if !(0...23).contains(hour) { return nil }
        if !(0...59).contains(minute) { return nil}
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
