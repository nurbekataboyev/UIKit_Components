//
//  TableView.swift
//  UIKit_Components
//
//  Created by Nurbek on 19/12/23.
//

import UIKit
import SnapKit

class profile: UIViewController {
    
    var customData = [CellSection]()
    
    private lazy var uzumLogo: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(named: "uzumlogo")
        image.backgroundColor = .white
        image.layer.cornerRadius = 70 / 2
        image.clipsToBounds = true
        
        return image
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Авторизуйтесь и начните совершать умные покупки на Uzum."
        label.numberOfLines = .max
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .regular)
        
        return label
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .uzum
        button.layer.cornerRadius = 4
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        
        button.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.backgroundColor = .white
        tableView.rowHeight = 50
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
//        tableView.allowsSelection = true
        tableView.isScrollEnabled = false
        
//        tableView.separatorInset
        
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
        
        return tableView
    }()
    
    private lazy var versionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Версия: 1.4.4"
        label.textColor = .systemGray2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .regular)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        title = "Профиль"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        [uzumLogo, infoLabel, signInButton, tableView, versionLabel].forEach { item in
            view.addSubview(item)
        }
        
        setData()
        layout()
    }
    
    private func layout() {
        uzumLogo.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(UzumConstants.big)
            $0.centerX.equalTo(view.snp.centerX)
            $0.height.width.equalTo(70)
        }
        
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(uzumLogo.snp.bottom).offset(UzumConstants.big)
            $0.leading.equalToSuperview().offset(UzumConstants.medium)
            $0.trailing.equalToSuperview().offset(-UzumConstants.medium)
        }
        
        signInButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-UzumConstants.medium)
            $0.leading.equalToSuperview().offset(UzumConstants.medium)
            $0.trailing.equalToSuperview().offset(-UzumConstants.medium)
            $0.height.equalTo(45)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).offset(UzumConstants.big)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
//            let height = tableView.bounds.size.height
//            $0.height.equalTo(height)
            $0.bottom.equalTo(signInButton.snp.top).offset(-50)
        }
        
        versionLabel.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom).offset(-UzumConstants.small)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
    
    private func setData() {
        customData.append(CellSection(options: [
            ProfileTableViewCellModel(leftImage: UIImage(named: "russia"), leftImageCornerRadius: 22 / 2, leftTitle: "Язык приложения", rightTitle: "Русский"),
        ]))
        
        customData.append(CellSection(options: [
            ProfileTableViewCellModel(leftImage: UIImage(systemName: "location"), leftImageCornerRadius: 0, leftTitle: "Город", rightTitle: "Ташкент"),
            ProfileTableViewCellModel(leftImage: UIImage(systemName: "map"), leftImageCornerRadius: 0, leftTitle: "Пункты выдачи на карте", rightTitle: ""),
        ]))
        
        customData.append(CellSection(options: [
            ProfileTableViewCellModel(leftImage: UIImage(systemName: "bell"), leftImageCornerRadius: 0, leftTitle: "Уведомления", rightTitle: ""),
        ]))
        
        customData.append(CellSection(options: [
            ProfileTableViewCellModel(leftImage: UIImage(systemName: "envelope"), leftImageCornerRadius: 0, leftTitle: "Связаться с нами", rightTitle: ""),
            ProfileTableViewCellModel(leftImage: UIImage(systemName: "questionmark.circle"), leftImageCornerRadius: 0, leftTitle: "Справка", rightTitle: ""),
        ]))
    }
    
//    MARK: - ACTIONS
    @objc private func signInTapped() {
        print("Войти")
    }
    
}

extension profile: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(customData[indexPath.section].options[indexPath.row].leftTitle)")
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return customData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customData[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as! ProfileTableViewCell
        
        let model = customData[indexPath.section].options[indexPath.row]
        
        cell.configure(model: model)
        
        return cell
    }
    
    
}
