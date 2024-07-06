//
//  DoctorsModel.swift
//  Doctor Appointment
//
//  Created by Игорь Пустыльник on 05.07.2024.
//

import Foundation

struct Doctor {
    let id: Int
    let name: String
    let rank: String
    let photo: String
}

class DoctorsModel {
    static var shared = DoctorsModel()
    
    private var doctors: [Doctor] = [
        Doctor(id: 0, name: "Imran Syahir", rank: "General Doctor", photo: "imran_syahir"),
        Doctor(id: 1, name: "Joseph Brostito", rank: "Dental Specialist", photo: "joseph_brostito"),
        Doctor(id: 2, name: "Bessie Coleman", rank: "Dental Specialist", photo: "bessie_coleman"),
        Doctor(id: 3, name: "Babe Didrikson", rank: "Dental Specialist", photo: "babe_didrikson"),
    ]
    
    func getDoctor(id: Int) -> Doctor? {
        for doc in doctors {
            if doc.id == id {
                return doc
            }
        }
        return nil
    }
}
