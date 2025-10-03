//
//  HomeRouter.swift
//  HabitForge
//
//  Created by 10051688 on 03/10/25.
//  
//

import Foundation
import UIKit

final class HomeRouter: HomeRouterProtocol {
    weak var viewController: UIViewController?

    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    static func createHomeModule(withEntity entity: HomeEntity = HomeEntity()) -> UIViewController {
        let viewController = HomeViewController()
        let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
        let remoteDataManager: HomeRemoteDataManagerInputProtocol = HomeRemoteDataManager()
        let router: HomeRouterProtocol = HomeRouter(viewController: viewController)
        let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter(view: viewController, router: router)
        let interactor: HomeInteractorInputProtocol & HomeRemoteDataManagerOutputProtocol = HomeInteractor(presenter: presenter, localDatamanager: localDataManager, remoteDatamanager: remoteDataManager)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        remoteDataManager.remoteRequestHandler = interactor
        interactor.entity = entity
        return viewController
    }
}
