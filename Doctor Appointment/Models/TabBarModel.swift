//
//  TabBarService.swift
//  Doctor Appointment
//
//  Created by Игорь Пустыльник on 03.07.2024.
//

import Foundation
import UIKit

struct TabItem {
    let index: Int
    let name: String
    let image: String
}

class TabBarModel {
    let controllers: [UIViewController] = [
        HomeController(),
        ScheduleController(),
        MessagesController(),
        ProfileController()
    ]
    
    let tabItems: [TabItem] = [
        TabItem(index: 0, name: "Home".localized(), image: "home"),
        TabItem(index: 1, name: "Schedule".localized(), image: "calendar"),
        TabItem(index: 2, name: "Messages".localized(), image: "messages"),
        TabItem(index: 3, name: "Profile".localized(), image: "profile"),
    ]
}
