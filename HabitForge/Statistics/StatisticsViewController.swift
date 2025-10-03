//
//  StatisticsViewController.swift
//  HabitForge
//
//  Created by Luis Humberto on 03/10/25.
//  
//

import Foundation
import UIKit

class StatisticsViewController: UIViewController {

    // MARK: Properties
    private lazy var rootView: UIView = StatisticsView()
    var presenter: StatisticsPresenterProtocol?

    // MARK: Lifecycle
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension StatisticsViewController: StatisticsViewProtocol { }
