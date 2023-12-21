//
//  TextFieldPadding.swift
//  UIKit_Components
//
//  Created by Nurbek on 12/12/23.
//

import UIKit

extension UITextField {
    func setLeftPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
