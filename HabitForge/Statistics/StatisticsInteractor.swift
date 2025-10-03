//
//  StatisticsInteractor.swift
//  HabitForge
//
//  Created by 10051688 on 03/10/25.
//  
//

import Foundation

final class StatisticsInteractor: StatisticsInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: StatisticsInteractorOutputProtocol?
    var localDatamanager: StatisticsLocalDataManagerInputProtocol?
    var remoteDatamanager: StatisticsRemoteDataManagerInputProtocol?
    var entity: StatisticsEntity?

    init(presenter: StatisticsInteractorOutputProtocol? = nil, localDatamanager: StatisticsLocalDataManagerInputProtocol? = nil, remoteDatamanager: StatisticsRemoteDataManagerInputProtocol? = nil) {
        self.presenter = presenter
        self.localDatamanager = localDatamanager
        self.remoteDatamanager = remoteDatamanager
    }
    
    func getNavTitle() -> String? {
        return entity?.strNavBarTitle
    }
}

extension StatisticsInteractor: StatisticsRemoteDataManagerOutputProtocol { }
