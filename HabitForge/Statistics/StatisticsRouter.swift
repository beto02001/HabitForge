//
//  StatisticsRouter.swift
//  HabitForge
//
//  Created by 10051688 on 03/10/25.
//  
//

import Foundation
import UIKit

final class StatisticsRouter: StatisticsRouterProtocol {
    weak var viewController: UIViewController?

    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    static func createStatisticsModule(withEntity entity: StatisticsEntity = StatisticsEntity()) -> UIViewController {
        let viewController = StatisticsViewController()
        let localDataManager: StatisticsLocalDataManagerInputProtocol = StatisticsLocalDataManager()
        let remoteDataManager: StatisticsRemoteDataManagerInputProtocol = StatisticsRemoteDataManager()
        let router: StatisticsRouterProtocol = StatisticsRouter(viewController: viewController)
        let presenter: StatisticsPresenterProtocol & StatisticsInteractorOutputProtocol = StatisticsPresenter(view: viewController, router: router)
        let interactor: StatisticsInteractorInputProtocol & StatisticsRemoteDataManagerOutputProtocol = StatisticsInteractor(presenter: presenter, localDatamanager: localDataManager, remoteDatamanager: remoteDataManager)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        remoteDataManager.remoteRequestHandler = interactor
        interactor.entity = entity
        return viewController
    }
}
