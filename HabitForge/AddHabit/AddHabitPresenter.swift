//
//  AddHabitPresenter.swift
//  HabitForge
//
//  Created by 10051688 on 03/10/25.
//  
//

import Foundation
import UIKit

final class AddHabitPresenter {

    // MARK: Properties
    weak var view: AddHabitViewProtocol?
    var interactor: AddHabitInteractorInputProtocol?
    var router: AddHabitRouterProtocol?
    
    init(view: AddHabitViewProtocol? = nil, router: AddHabitRouterProtocol? = nil) {
        self.view = view
        self.router = router
    }
}

extension AddHabitPresenter: AddHabitPresenterProtocol {
    func getNavTitle() -> String? {
        return interactor?.getNavTitle()
    }
}

extension AddHabitPresenter: AddHabitInteractorOutputProtocol { }
