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
    var homeView: HomeView = HomeView()
    var presenter: HomePresenterProtocol?

    // MARK: Lifecycle
    override func loadView() {
        self.view = homeView
        homeView.tableView.reloadData()
        print("entra en loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.tableView.dataSource = self
        homeView.tableView.delegate = self
        homeView.tableView.reloadData()
        homeView.button.addTarget(self, action: #selector(createHabit), for: .touchUpInside)
    }
    
    @objc func createHabit() {
        CoreDataManager.shared.saveHabit(from: .init(title: "titulo", category: "categoria", createdAt: Date())) { result in
            switch result {
            case .success(let success):
                print("se salvó exitoso")
                self.homeView.tableView.reloadData()
            case .failure(let failure):
                print("ERRROOORR")
            }
        }
    }
    
    func addDetail(habit: HabitViewModel?) {
        guard let habit = habit else { return }
        CoreDataManager.shared.setDetailHabit(from: habit)
        reloadData()
    }
    
    func reloadData() {
        homeView.tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getData().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HabitCell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "HabitCell")
        let habit = presenter?.getData()[indexPath.row]
        cell.textLabel?.text = habit?.title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let habit = presenter?.getData()[indexPath.row]
        addDetail(habit: habit)
    }
}

extension HomeViewController: HomeViewProtocol {
    func updateTableView(data: [HabitViewModel]) {
        reloadData()
    }
}
