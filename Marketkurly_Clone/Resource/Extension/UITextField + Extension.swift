//
//  UITextField + Extension.swift
//  Marketkurly_Clone
//
//  Created by Thisisme Hi on 2021/06/19.
//

import UIKit

extension UITextField {
    
    // 텍스트필드의 placeholder에 왼쪽 마진값을 주기 위함
    func placeholderPadding() {
        
        // 너비가 leftPadding 값으로 들어갈 예정
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        // leftViewMode의 default 값은 보이지 않는 모드인데 이걸 always로 해주면 항상 보이도록 설정해줘서
        // paddingView가 보일 수 있게 해준다.
    }
    
}
