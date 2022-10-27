//
//  Model.swift
//  13hw-scratch
//
//  Created by Максим Солобоев on 26.10.2022.
//

import UIKit

enum CellType: String {
    case standart
    case withSwitch
    case userInfo
}

struct CellData {
    var type: CellType
    var title: String
    var icon: UIImage?
    var imageBackgroundColor: UIColor?
    var detailText: String?
    var iconTintColor: UIColor? = .white
}

extension CellData {
    static var cellInstances: [[CellData]] = [
        
        // User info area
        [CellData(type: .userInfo,
                  title: "Максим Солобоев",
                  icon: UIImage(systemName: "person.circle"),
                  detailText: "Apple ID, iCloud+, контент и покупки",
                  iconTintColor: .black)
        ],
        
        // Connects area
        [CellData(type: .withSwitch,
                  title: "Авиарежим",
                  icon: UIImage(systemName: "airplane"),
                  imageBackgroundColor: .systemOrange),
         
         CellData(type: .standart,
                  title: "Wi-Fi",
                  icon: UIImage(systemName: "wifi"),
                  imageBackgroundColor: .systemBlue,
                  detailText: "fastest WIFI"),
         
         CellData(type: .standart,
                  title: "Bluetooth",
                  icon: UIImage(named: "bt"),
                  imageBackgroundColor: .systemBlue,
                  detailText: "Вкл."),
         
         CellData(type: .standart,
                  title: "Сотовая связь",
                  icon: UIImage(systemName: "antenna.radiowaves.left.and.right"),
                  imageBackgroundColor: .systemGreen,
                  detailText: "Выкл."),
         
         CellData(type: .standart,
                  title: "VPN",
                  icon: UIImage(named: "vpn"),
                  imageBackgroundColor: .systemBlue,
                  detailText: "Подключен")
        ],
        
        // Notifications area
        [CellData(type: .standart,
                  title: "Уведомления",
                  icon: UIImage(systemName: "bell.badge.fill"),
                  imageBackgroundColor: .systemRed),
         
         CellData(type: .standart,
                  title: "Звуки, тактильные сигналы",
                  icon: UIImage(systemName: "speaker.wave.3.fill"),
                  imageBackgroundColor: .systemPink),
         
         CellData(type: .standart,
                  title: "Фокусирование",
                  icon: UIImage(systemName: "moon.fill"),
                  imageBackgroundColor: .systemIndigo),
         
         CellData(type: .standart,
                  title: "Экранное время",
                  icon: UIImage(systemName: "hourglass"),
                  imageBackgroundColor: .systemIndigo)
        ],
        
        // Main settings area
        [CellData(type: .standart,
                  title: "Основные",
                  icon: UIImage(systemName: "gear"),
                  imageBackgroundColor: .gray),
         
         CellData(type: .standart,
                  title: "Пункт управления",
                  icon: UIImage(systemName: "switch.2"),
                  imageBackgroundColor: .gray),
         
         CellData(type: .standart,
                  title: "Экран и яркость",
                  icon: UIImage(systemName: "textformat.size"),
                  imageBackgroundColor: .systemBlue),
         
         CellData(type: .standart,
                  title: "Экран \"Домой\"",
                  icon: UIImage(systemName: "square.grid.3x3.bottommiddle.filled"),
                  imageBackgroundColor: .systemIndigo),
         
         CellData(type: .standart,
                  title: "Универсальный доступ",
                  icon: UIImage(systemName: "figure.wave.circle"),
                  imageBackgroundColor: .systemBlue),
         
         CellData(type: .standart,
                  title: "Обои",
                  icon: UIImage(systemName: "camera.macro"),
                  imageBackgroundColor: .systemBlue),
         
         CellData(type: .standart,
                  title: "Siri и Поиск",
                  icon: UIImage(named: "siri"),
                  imageBackgroundColor: .black),
         
         CellData(type: .standart,
                  title: "Face ID и код-пароль",
                  icon: UIImage(systemName: "faceid"),
                  imageBackgroundColor: .systemGreen),
         
         CellData(type: .standart,
                  title: "Экстренный вызов - SOS",
                  icon: UIImage(named: "sos"),
                  imageBackgroundColor: .systemRed),
         
         CellData(type: .standart,
                  title: "Уведомление о контакте",
                  icon: UIImage(systemName: "microbe"),
                  imageBackgroundColor: .white,
                  iconTintColor: .systemRed),
         
         CellData(type: .standart,
                  title: "Аккумулятор",
                  icon: UIImage(systemName: "battery.100"),
                  imageBackgroundColor: .systemGreen),
         
         CellData(type: .standart,
                  title: "Конфиденциальность",
                  icon: UIImage(systemName: "hand.raised.fill"),
                  imageBackgroundColor: .systemBlue)]
    ]
}
