//
//  StatisticsPresenter.swift
//  HabitForge
//
//  Created by 10051688 on 03/10/25.
//  
//

import Foundation
import UIKit

final class StatisticsPresenter {

    // MARK: Properties
    weak var view: StatisticsViewProtocol?
    var interactor: StatisticsInteractorInputProtocol?
    var router: StatisticsRouterProtocol?
    
    init(view: StatisticsViewProtocol? = nil, router: StatisticsRouterProtocol? = nil) {
        self.view = view
        self.router = router
    }
}

extension StatisticsPresenter: StatisticsPresenterProtocol {
    func getNavTitle() -> String? {
        return interactor?.getNavTitle()
    }
}

extension StatisticsPresenter: StatisticsInteractorOutputProtocol { }
