//
//  ProfileTableViewCell.swift
//  UIKit_Components
//
//  Created by Nurbek on 20/12/23.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    static let identifier = "ProfileTableViewCell"
    
    func configure(model: ProfileTableViewCellModel) {
        leftImage.image = model.leftImage
        leftImage.layer.cornerRadius = model.leftImageCornerRadius
        leftTitle.text = model.leftTitle
        rightTitle.text = model.rightTitle
    }
    
    private lazy var leftImage: UIImageView = {
        let image = UIImageView()
        
        image.tintColor = .black
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        
        return image
    }()
    
    private lazy var leftTitle: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        
        return label
    }()
    
    private lazy var rightImage: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(systemName: "chevron.right")
        image.tintColor = .systemGray2
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private lazy var rightTitle: UILabel = {
        let label = UILabel()
        
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 15, weight: .regular)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [leftImage, leftTitle, rightTitle, rightImage].forEach { item in
            self.addSubview(item)
        }
        
        layout()
    }
    
    private func layout() {
        leftImage.snp.makeConstraints {
            $0.centerY.equalTo(self.snp.centerY)
            $0.leading.equalToSuperview().offset(UzumConstants.medium)
            $0.height.width.equalTo(22)
        }
        
        leftTitle.snp.makeConstraints {
            $0.centerY.equalTo(self.snp.centerY)
            $0.leading.equalTo(leftImage.snp.trailing).offset(UzumConstants.medium)
        }
        
        rightImage.snp.makeConstraints {
            $0.centerY.equalTo(self.snp.centerY)
            $0.trailing.equalToSuperview().offset(-UzumConstants.medium)
            $0.height.width.equalTo(18)
        }
        
        rightTitle.snp.makeConstraints {
            $0.centerY.equalTo(self.snp.centerY)
            $0.trailing.equalTo(rightImage.snp.leading).offset(-UzumConstants.small)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
