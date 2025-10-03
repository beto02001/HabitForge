//
//  AddHabitProtocols.swift
//  HabitForge
//
//  Created by 10051688 on 03/10/25.
//  
//

import Foundation
import UIKit

// MARK: - View
/// Presenter -> View
protocol AddHabitViewProtocol: AnyObject {
    var presenter: AddHabitPresenterProtocol? { get set }
}

// MARK: - Interactor
/// Interactor -> Presenter
protocol AddHabitInteractorOutputProtocol: AnyObject { }

/// Presenter -> Interactor
protocol AddHabitInteractorInputProtocol: AnyObject {

    var presenter: AddHabitInteractorOutputProtocol? { get set }
    var localDatamanager: AddHabitLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: AddHabitRemoteDataManagerInputProtocol? { get set }
    var entity: AddHabitEntity? { get set }

    func getNavTitle() -> String?
}

// MARK: - Presenter
/// View -> Presenter
protocol AddHabitPresenterProtocol: AnyObject {
    var view: AddHabitViewProtocol? { get set }
    var interactor: AddHabitInteractorInputProtocol? { get set }
    var router: AddHabitRouterProtocol? { get set }

    func getNavTitle() -> String?
}

// MARK: - Router
/// Presenter -> Router
protocol AddHabitRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }

    static func createAddHabitModule(withEntity entity: AddHabitEntity) -> UIViewController
}

// MARK: - Data Manager
/// Interactor -> Remote data manager
protocol AddHabitRemoteDataManagerInputProtocol: AnyObject {
    var remoteRequestHandler: AddHabitRemoteDataManagerOutputProtocol? { get set }
}

/// Remote data manager -> Interactor
protocol AddHabitRemoteDataManagerOutputProtocol: AnyObject { }

/// Interactor -> Local data manager
protocol AddHabitLocalDataManagerInputProtocol: AnyObject { }
