//
//  AddHabitRouter.swift
//  HabitForge
//
//  Created by 10051688 on 03/10/25.
//  
//

import Foundation
import UIKit

final class AddHabitRouter: AddHabitRouterProtocol {
    weak var viewController: UIViewController?

    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    static func createAddHabitModule(withEntity entity: AddHabitEntity = AddHabitEntity()) -> UIViewController {
        let viewController = AddHabitViewController()
        let localDataManager: AddHabitLocalDataManagerInputProtocol = AddHabitLocalDataManager()
        let remoteDataManager: AddHabitRemoteDataManagerInputProtocol = AddHabitRemoteDataManager()
        let router: AddHabitRouterProtocol = AddHabitRouter(viewController: viewController)
        let presenter: AddHabitPresenterProtocol & AddHabitInteractorOutputProtocol = AddHabitPresenter(view: viewController, router: router)
        let interactor: AddHabitInteractorInputProtocol & AddHabitRemoteDataManagerOutputProtocol = AddHabitInteractor(presenter: presenter, localDatamanager: localDataManager, remoteDatamanager: remoteDataManager)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        remoteDataManager.remoteRequestHandler = interactor
        interactor.entity = entity
        return viewController
    }
}
