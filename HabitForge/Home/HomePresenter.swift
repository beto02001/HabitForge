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
    private var data: [HabitViewModel] = []
    
    init(view: HomeViewProtocol? = nil, router: HomeRouterProtocol? = nil) {
        self.view = view
        self.router = router
    }
}

extension HomePresenter: HomePresenterProtocol {
    func getNavTitle() -> String? {
        return interactor?.getNavTitle()
    }
    
    func getData() -> [HabitViewModel] {
        //return data
        CoreDataManager.shared.fetchHabit { response in
            switch response {
            case .success(let success):
                self.data = success
            case .failure(let failure):
                print("error")
            }
        }
        print("valor CoreData: ", data)
        return data
    }
    
    func willUpdateView(data: [HabitViewModel]) {
        self.data = data
        view?.updateTableView(data: self.data)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol { }
