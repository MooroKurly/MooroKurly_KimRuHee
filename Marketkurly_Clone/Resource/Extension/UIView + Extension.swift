//
//  UIView + Extension.swift
//  Marketkurly_Clone
//
//  Created by 김루희 on 2021/05/30.
//

import Foundation
import UIKit

extension UIView {
    
    func addSubviews(_ views:UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
