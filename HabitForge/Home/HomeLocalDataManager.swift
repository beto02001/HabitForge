//
//  HomeLocalDataManager.swift
//  HabitForge
//
//  Created by 10051688 on 03/10/25.
//  
//

import Foundation

final class HomeLocalDataManager: HomeLocalDataManagerInputProtocol {
    
    private var bd = CoreDataManager.shared
    weak var localRequestHandler: HomeLocalDataManagerOutputProtocol?
    
    func fetchHabits() {
        bd.fetchHabit { result in
            switch result {
            case .success(let habits):
                self.localRequestHandler?.didFetchHabits(habits)
            case .failure:
                self.localRequestHandler?.didFetchHabits([])
            }
        }
    }
}
