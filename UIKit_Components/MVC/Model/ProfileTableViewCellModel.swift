//
//  ProfileTableViewCellModel.swift
//  UIKit_Components
//
//  Created by Nurbek on 20/12/23.
//

import UIKit

struct ProfileTableViewCellModel {
    let leftImage: UIImage?
    let leftImageCornerRadius: CGFloat
    let leftTitle: String
    let rightTitle: String
}

struct CellSection {
    let options: [ProfileTableViewCellModel]
}
