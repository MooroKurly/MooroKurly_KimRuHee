//
//  TopHeaderView.swift
//  Marketkurly_Clone
//
//  Created by 김루희 on 2021/06/03.
//

import UIKit

import DuctTape

class TopHeaderView: UIView {
    
    //MARK: - Property
    
    let upperView : UIView = UIView().ductTape
        .backgroundColor(.kurlyPurple)
    
    var headerTitleLabel : UILabel = UILabel().ductTape
        .font(.systemFont(ofSize: 15, weight: .semibold))
        .textColor(.white)
    
    let mapButton : UIButton = UIButton().ductTape
        .reinforce { (mapButton) in
            mapButton.setBackgroundImage(UIImage(named: "buttonMap"), for: .normal)
        }
    
    let cartButton : UIButton = UIButton().ductTape
        .reinforce { (cartButton) in
            cartButton.setBackgroundImage(UIImage(named: "buttonCart"), for: .normal)
        }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(upperView)
        addSubview(headerTitleLabel)
        addSubview(mapButton)
        addSubview(cartButton)
        
        upperView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(88)
        }
        
        headerTitleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(12+44)
            make.centerX.equalTo(upperView.snp.centerX)
        }
        
        mapButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(52)
            make.trailing.equalTo(cartButton.snp.leading).offset(-14)
        }
        
        cartButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(53)
            make.trailing.equalToSuperview().offset(-17)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
