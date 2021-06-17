//
//  SettingTopHeaderView.swift
//  Marketkurly_Clone
//
//  Created by Thisisme Hi on 2021/06/17.
//

import UIKit

class SettingTopHeaderView: UIView {

    //MARK: - Property
    
    let upperView : UIView = UIView().ductTape
        .backgroundColor(.white)
    
    var headerTitleLabel : UILabel = UILabel().ductTape
        .font(.systemFont(ofSize: 16, weight: .semibold))
        .textColor(.kurlyBlack)
    
    let lineView : UIView = UIView().ductTape
        .backgroundColor(.kurlyLightGray)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(upperView)
        addSubview(headerTitleLabel)
        addSubview(lineView)
       
        upperView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(88)
        }
        
        headerTitleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(12+44)
            make.centerX.equalTo(upperView.snp.centerX)
        }
      
        lineView.snp.makeConstraints { (make) in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
