//
//  StatisticsProtocols.swift
//  HabitForge
//
//  Created by 10051688 on 03/10/25.
//  
//

import Foundation
import UIKit

// MARK: - View
/// Presenter -> View
protocol StatisticsViewProtocol: AnyObject {
    var presenter: StatisticsPresenterProtocol? { get set }
}

// MARK: - Interactor
/// Interactor -> Presenter
protocol StatisticsInteractorOutputProtocol: AnyObject { }

/// Presenter -> Interactor
protocol StatisticsInteractorInputProtocol: AnyObject {

    var presenter: StatisticsInteractorOutputProtocol? { get set }
    var localDatamanager: StatisticsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: StatisticsRemoteDataManagerInputProtocol? { get set }
    var entity: StatisticsEntity? { get set }

    func getNavTitle() -> String?
}

// MARK: - Presenter
/// View -> Presenter
protocol StatisticsPresenterProtocol: AnyObject {
    var view: StatisticsViewProtocol? { get set }
    var interactor: StatisticsInteractorInputProtocol? { get set }
    var router: StatisticsRouterProtocol? { get set }

    func getNavTitle() -> String?
}

// MARK: - Router
/// Presenter -> Router
protocol StatisticsRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }

    static func createStatisticsModule(withEntity entity: StatisticsEntity) -> UIViewController
}

// MARK: - Data Manager
/// Interactor -> Remote data manager
protocol StatisticsRemoteDataManagerInputProtocol: AnyObject {
    var remoteRequestHandler: StatisticsRemoteDataManagerOutputProtocol? { get set }
}

/// Remote data manager -> Interactor
protocol StatisticsRemoteDataManagerOutputProtocol: AnyObject { }

/// Interactor -> Local data manager
protocol StatisticsLocalDataManagerInputProtocol: AnyObject { }
