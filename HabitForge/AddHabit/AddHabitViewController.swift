//
//  AddHabitViewController.swift
//  HabitForge
//
//  Created by Luis Humberto on 03/10/25.
//  
//

import Foundation
import UIKit

class AddHabitViewController: UIViewController {

    // MARK: Properties
    private lazy var rootView: UIView = AddHabitView()
    var presenter: AddHabitPresenterProtocol?

    // MARK: Lifecycle
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AddHabitViewController: AddHabitViewProtocol { }
