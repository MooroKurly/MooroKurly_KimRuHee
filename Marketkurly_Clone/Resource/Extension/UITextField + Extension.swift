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
    
    // 키보드 상단의 done/완료 버튼 추가하는 함수
    func addDoneButtonOnKeyboard() {
        
        // 툴바를 선언해주고 width, height 값 초기화
        let doneToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolBar.barStyle = .default
        
        // flexSpace는 연관 단어 나오는 부분
        // done은 keyboard 상단의 완료 버튼
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(doneAction(_:)))
        done.tintColor = .systemBlue
        
        let items = [flexSpace, done]
        doneToolBar.items = items
        doneToolBar.sizeToFit()
        
        self.inputAccessoryView = doneToolBar
        
    }
    
    @objc func doneAction(_ sender: UIButton) {
        self.resignFirstResponder()
    }
    
}
