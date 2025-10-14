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
    func updateTableView(data: [HabitViewModel])
}

// MARK: - Interactor
/// Interactor -> Presenter
protocol HomeInteractorOutputProtocol: AnyObject {
    func willUpdateView(data: [HabitViewModel])
}

/// Presenter -> Interactor
protocol HomeInteractorInputProtocol: AnyObject {

    var presenter: HomeInteractorOutputProtocol? { get set }
    var localDatamanager: HomeLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol? { get set }
    var entity: HomeEntity? { get set }

    func getNavTitle() -> String?
    func fetchHabits() -> [HabitViewModel]
}

// MARK: - Presenter
/// View -> Presenter
protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var router: HomeRouterProtocol? { get set }

    func getNavTitle() -> String?
    func getData() -> [HabitViewModel]
    
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

/// Interactor -> Local data manager
protocol HomeLocalDataManagerInputProtocol: AnyObject {
    var localRequestHandler: HomeLocalDataManagerOutputProtocol? { get set }
    func fetchHabits()
}

/// Remote data manager -> Interactor
protocol HomeRemoteDataManagerOutputProtocol: AnyObject { }

/// Local  data manager -> Interactor
protocol HomeLocalDataManagerOutputProtocol: AnyObject {
    func didFetchHabits(_ habits: [HabitViewModel])
}
