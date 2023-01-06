//
//  DetailViewController.swift
//  13th-HW
//
//  Created by Максим Солобоев on 27.10.2022.
//

import UIKit
import SnapKit

final class DetailViewController: UIViewController {
    
    // MARK: - Data
    
    private var cellData: CellData?
    
    var getData: CellData? {
        self.cellData
    }
    
    func fillData(from instance: CellData) {
        self.cellData = instance
        icon.image = cellData?.icon
        detailTitleText.text = cellData?.title
        iconView.backgroundColor = cellData?.imageBackgroundColor
        icon.tintColor = cellData?.iconTintColor
    }
    
    // MARK: - Outlets
    
    private lazy var iconView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.tintColor = .white
        return view
    }()
    
    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = .white
        return imageView
    }()
    
    private lazy var detailTitleText: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return lable
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(iconView)
        view.addSubview(detailTitleText)
        iconView.addSubview(icon)
    }
    
    private func setupLayout() {
        iconView.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.height.width.equalTo(80)
        }
        
        icon.snp.makeConstraints { make in
            make.center.equalTo(iconView)
            make.height.width.equalTo(60)
        }
        
        detailTitleText.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(90)
        }
    }
}
