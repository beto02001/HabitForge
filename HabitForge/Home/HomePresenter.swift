//
//  HomePresenter.swift
//  HabitForge
//
//  Created by 10051688 on 03/10/25.
//  
//

import Foundation
import UIKit

final class HomePresenter {

    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var router: HomeRouterProtocol?
    
    init(view: HomeViewProtocol? = nil, router: HomeRouterProtocol? = nil) {
        self.view = view
        self.router = router
    }
}

extension HomePresenter: HomePresenterProtocol {
    func getNavTitle() -> String? {
        return interactor?.getNavTitle()
    }
}

extension HomePresenter: HomeInteractorOutputProtocol { }
