//
//  HomeEntity.swift
//  HabitForge
//
//  Created by 10051688 on 03/10/25.
//  
//

import Foundation

struct HomeEntity {
    var strNavBarTitle: String = ""
}

struct HabitViewModel: Identifiable {
    var id: UUID = UUID()
    var title: String
    var category: String
    var createdAt: Date
    var reminderTime: Date?
    var colorTag: Int16
    var detail: NSSet?
    
    init(from: Habit) {
        self.id = from.id ?? UUID()
        self.reminderTime = from.reminderTime
        self.title = from.title ?? ""
        self.category = from.category ?? ""
        self.createdAt = from.createdAt ?? Date()
        self.reminderTime = from.reminderTime
        self.colorTag = from.color
        self.detail = from.habitToDetail
    }
    
    init(title: String, category: String, createdAt: Date, reminderTime: Date? = nil, colorTag: Int16 = 0) {
        self.title = title
        self.category = category
        self.createdAt = createdAt
        self.reminderTime = reminderTime
        self.colorTag = colorTag
    }
}
