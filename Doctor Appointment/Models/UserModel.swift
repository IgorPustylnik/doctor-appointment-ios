//
//  UserModel.swift
//  Doctor Appointment
//
//  Created by Игорь Пустыльник on 05.07.2024.
//

import Foundation

struct User {
    var name: String
    var profilePicture: String
}

class UserModel {
    static let shared = User(name: "James", profilePicture: "profilePicture")
}
