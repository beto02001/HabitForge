//
//  AddHabitInteractor.swift
//  HabitForge
//
//  Created by 10051688 on 03/10/25.
//  
//

import Foundation

final class AddHabitInteractor: AddHabitInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: AddHabitInteractorOutputProtocol?
    var localDatamanager: AddHabitLocalDataManagerInputProtocol?
    var remoteDatamanager: AddHabitRemoteDataManagerInputProtocol?
    var entity: AddHabitEntity?

    init(presenter: AddHabitInteractorOutputProtocol? = nil, localDatamanager: AddHabitLocalDataManagerInputProtocol? = nil, remoteDatamanager: AddHabitRemoteDataManagerInputProtocol? = nil) {
        self.presenter = presenter
        self.localDatamanager = localDatamanager
        self.remoteDatamanager = remoteDatamanager
    }
    
    func getNavTitle() -> String? {
        return entity?.strNavBarTitle
    }
}

extension AddHabitInteractor: AddHabitRemoteDataManagerOutputProtocol { }
