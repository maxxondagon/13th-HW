//
//  SettingsViewController.swift
//  13th-HW
//
//  Created by Максим Солобоев on 27.10.2022.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {
    
    private var cellInstances: [[CellData]] = CellData.getInstances()
    
    // MARK: - Outlets
    
    private lazy var searcher: UISearchController = {
        let search = UISearchController()
        search.searchBar.placeholder = "Поиск"
        return search
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(StandartTableViewCell.self, forCellReuseIdentifier: StandartTableViewCell.indentifier)
        tableView.register(UserInfoViewCell.self, forCellReuseIdentifier: UserInfoViewCell.indentifier)
        tableView.register(WithSwitchTableViewCell.self, forCellReuseIdentifier: WithSwitchTableViewCell.indentifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarcy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    func setupView() {
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemGray6
    }
    
    func setupHierarcy() {
        view.addSubview(tableView)
        navigationItem.searchController = searcher
    }
    
    func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalTo(view)
        }
    }
}

// MARK: - DataSource extension

extension SettingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        cellInstances.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellInstances[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let standartCell = tableView.dequeueReusableCell(withIdentifier: StandartTableViewCell.indentifier) as? StandartTableViewCell
        standartCell?.fillData(from: cellInstances[indexPath.section][indexPath.row])
        standartCell?.accessoryType = .disclosureIndicator
        
        let userInfoCell = tableView.dequeueReusableCell(withIdentifier: UserInfoViewCell.indentifier) as? UserInfoViewCell
        userInfoCell?.fillData(from: cellInstances[indexPath.section][indexPath.row])
        userInfoCell?.accessoryType = .disclosureIndicator
        
        let withSwitchInfoCell = tableView.dequeueReusableCell(withIdentifier: WithSwitchTableViewCell.indentifier) as? WithSwitchTableViewCell
        withSwitchInfoCell?.fillData(from: cellInstances[indexPath.section][indexPath.row])
        withSwitchInfoCell?.selectionStyle = .none
        withSwitchInfoCell?.accessoryType = .none
        
        let cellType = cellInstances[indexPath.section][indexPath.row].type
        switch cellType {
        case .userInfo:
            guard let userInfoCell else { return UITableViewCell() }
            return userInfoCell
        case .standart:
            guard let standartCell else { return UITableViewCell() }
            return standartCell
        case .withSwitch:
            guard let withSwitchInfoCell else { return UITableViewCell() }
            return withSwitchInfoCell
        }
    }
}

// MARK: - Delegate extension

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let type = cellInstances[indexPath.section][indexPath.row].type
        if type == .userInfo {
            return 90
        }
        return 45
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DetailViewController()
        tableView.deselectRow(at: indexPath, animated: true)
        viewController.fillData(from: cellInstances[indexPath.section][indexPath.row])
        if viewController.getData?.type != .withSwitch {
            print("Выбран пункт: \(viewController.getData?.title ?? "")")
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            print("Пункт \(viewController.getData?.title ?? "") не имеет DetailView")
        }
    }
}
