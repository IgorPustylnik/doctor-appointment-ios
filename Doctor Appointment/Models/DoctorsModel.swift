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
    let rating: (Double, Int)
    let photo: String?
}

class DoctorsModel {
    static var shared = DoctorsModel()
    
    private var doctors: [Doctor] = [
        Doctor(id: 0, name: "Imran Syahir", rank: "General Doctor", rating: (3.2, 91) ,photo: "imran_syahir"),
        Doctor(id: 1, name: "Joseph Brostito", rank: "Dental Specialist", rating: (4.8, 120), photo: "joseph_brostito"),
        Doctor(id: 2, name: "Bessie Coleman", rank: "Dental Specialist", rating: (4.1, 154), photo: "bessie_coleman"),
        Doctor(id: 3, name: "Babe Didrikson", rank: "Dental Specialist", rating: (2.7, 190) , photo: "babe_didrikson"),
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
