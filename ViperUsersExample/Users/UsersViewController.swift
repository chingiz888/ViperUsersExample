//
//  ViewController.swift
//  ViperUsersExample
//
//  Created by mac_pro14 on 22.10.2024.
//

import UIKit

// VIEW
class UsersViewController: UIViewController {
    var presenter: UsersViewOutput?
    private var users: [UserViewModel] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension UsersViewController: UsersViewInput {
    // выставляем источник для таблицы и reload'им ее
    func showUsers(users: [UserViewModel]) {
        self.users = users
        tableView.reloadData()
    }
}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
}
