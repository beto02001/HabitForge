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
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol { }
