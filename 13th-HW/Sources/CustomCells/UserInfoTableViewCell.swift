//
//  UserInfoTableViewCell.swift
//  13th-HW
//
//  Created by Максим Солобоев on 27.10.2022.
//

import UIKit
import SnapKit

class UserInfoViewCell: UITableViewCell {
    
    static let indentifier = "userInfoTableViewCell"
    
    // MARK: - Data
    
    private var cellData: CellData?
    
    func fillData(from instance: CellData) {
        self.cellData = instance
        icon.image = cellData?.icon
        mainLabel.text = cellData?.title
        detailLabel.text = cellData?.detailText
        iconView.tintColor = cellData?.iconTintColor
    }
    
    // MARK: - Outlets
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var iconView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var icon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarcy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupHierarcy() {
        contentView.addSubview(mainLabel)
        contentView.addSubview(detailLabel)
        contentView.addSubview(iconView)
        iconView.addSubview(icon)
    }
    
    func setupLayout() {
        iconView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView).offset(20)
            make.width.height.equalTo(70)
        }
        
        icon.snp.makeConstraints { make in
            make.center.equalTo(iconView)
            make.height.width.equalTo(70)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(20)
            make.left.equalTo(iconView.snp.right).offset(20)
        }
        
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(10)
            make.left.equalTo(iconView.snp.right).offset(20)
            make.right.equalTo(contentView).inset(20)
        }
    }
}

