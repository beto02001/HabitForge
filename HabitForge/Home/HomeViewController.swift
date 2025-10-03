//
//  HomeViewController.swift
//  HabitForge
//
//  Created by Luis Humberto on 03/10/25.
//  
//

import Foundation
import UIKit

class HomeViewController: UIViewController {

    // MARK: Properties
    private lazy var rootView: UIView = HomeView()
    var presenter: HomePresenterProtocol?

    // MARK: Lifecycle
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: HomeViewProtocol { }
