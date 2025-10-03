//
//  HomeProtocols.swift
//  HabitForge
//
//  Created by 10051688 on 03/10/25.
//  
//

import Foundation
import UIKit

// MARK: - View
/// Presenter -> View
protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
}

// MARK: - Interactor
/// Interactor -> Presenter
protocol HomeInteractorOutputProtocol: AnyObject { }

/// Presenter -> Interactor
protocol HomeInteractorInputProtocol: AnyObject {

    var presenter: HomeInteractorOutputProtocol? { get set }
    var localDatamanager: HomeLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol? { get set }
    var entity: HomeEntity? { get set }

    func getNavTitle() -> String?
}

// MARK: - Presenter
/// View -> Presenter
protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var router: HomeRouterProtocol? { get set }

    func getNavTitle() -> String?
}

// MARK: - Router
/// Presenter -> Router
protocol HomeRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }

    static func createHomeModule(withEntity entity: HomeEntity) -> UIViewController
}

// MARK: - Data Manager
/// Interactor -> Remote data manager
protocol HomeRemoteDataManagerInputProtocol: AnyObject {
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol? { get set }
}

/// Remote data manager -> Interactor
protocol HomeRemoteDataManagerOutputProtocol: AnyObject { }

/// Interactor -> Local data manager
protocol HomeLocalDataManagerInputProtocol: AnyObject { }
