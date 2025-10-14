//
//  HomeInteractor.swift
//  HabitForge
//
//  Created by 10051688 on 03/10/25.
//  
//

import Foundation

final class HomeInteractor: HomeInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    var entity: HomeEntity?

    init(presenter: HomeInteractorOutputProtocol? = nil, localDatamanager: HomeLocalDataManagerInputProtocol? = nil, remoteDatamanager: HomeRemoteDataManagerInputProtocol? = nil) {
        self.presenter = presenter
        self.localDatamanager = localDatamanager
        self.remoteDatamanager = remoteDatamanager
    }
    
    func getNavTitle() -> String? {
        return entity?.strNavBarTitle
    }
    
    func fetchHabits() -> [HabitViewModel] {
        // This method signature is defined in the protocol as returning [HabitViewModel].
        // Adjust the protocol to make this async/callback-based instead. For now, return an empty array and trigger fetch.
        localDatamanager?.fetchHabits()
        return []
    }
}

extension HomeInteractor: HomeLocalDataManagerOutputProtocol {
    func didFetchHabits(_ habits: [HabitViewModel]) {
        presenter?.willUpdateView(data: habits)
    }
    
    
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol { }
