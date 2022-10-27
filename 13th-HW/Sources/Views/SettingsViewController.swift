//
//  SettingsViewController.swift
//  13th-HW
//
//  Created by Максим Солобоев on 27.10.2022.
//

import UIKit
import SnapKit

private var cellData: [[CellData]]?

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData?[section].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let standartCell = tableView.dequeueReusableCell(withIdentifier: CellType.standart.rawValue) as? StandartTableViewCell
        standartCell?.cellData = cellData?[indexPath.section][indexPath.row]
        standartCell?.accessoryType = .disclosureIndicator
        
        let userInfoCell = tableView.dequeueReusableCell(withIdentifier: CellType.userInfo.rawValue) as? UserInfoViewCell
        userInfoCell?.cellData = cellData?[indexPath.section][indexPath.row]
        userInfoCell?.accessoryType = .disclosureIndicator
        
        let withSwitchInfoCell = tableView.dequeueReusableCell(withIdentifier: CellType.withSwitch.rawValue) as? WithSwitchTableViewCell
        withSwitchInfoCell?.cellData = cellData?[indexPath.section][indexPath.row]
        withSwitchInfoCell?.selectionStyle = .none
//        withSwitchInfoCell?.
        withSwitchInfoCell?.accessoryType = .none
        
        let cellType = cellData?[indexPath.section][indexPath.row].type
        switch cellType {
        case .userInfo:
            return userInfoCell ?? UITableViewCell()
        case .standart:
            return standartCell ?? UITableViewCell()
        case .withSwitch:
            return withSwitchInfoCell ?? UITableViewCell()
        case .none:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let type = cellData?[indexPath.section][indexPath.row].type else { return 45 }
        if type == .userInfo {
            return 90
        }
        return 45
    }

}

class SettingsViewController: UIViewController {
    
    // MARK: - Outlets
    
    private lazy var searcher: UISearchController = {
        let search = UISearchController()
        search.searchBar.placeholder = "Поиск"
        return search
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(StandartTableViewCell.self, forCellReuseIdentifier: CellType.standart.rawValue)
        tableView.register(UserInfoViewCell.self, forCellReuseIdentifier: CellType.userInfo.rawValue)
        tableView.register(WithSwitchTableViewCell.self, forCellReuseIdentifier: CellType.withSwitch.rawValue)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemGray6
        cellData = CellData.cellInstances
        setupHierarcy()
        setupLayout()
    }
    
    // MARK: - Setup
    
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
