//
//  MenuCollectionCell.swift
//  Marketkurly_Clone
//
//  Created by Thisisme Hi on 2021/06/20.
//

import UIKit

class MenuCollectionCell: UICollectionViewCell {
    
    static let identifier = "MenuCollectionCell"
        
    // MARK: - Property
    
    let menuLabel : UILabel = {
        let label = UILabel()
        label.textColor = .kurlyTextGray
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    


    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    // MARK: - UI
    
    func configureUI() {
        
        addSubview(menuLabel)
        
        menuLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
    }
    
    // MARK: - setData()
    
    func setData(title : String, selected : Bool){
            menuLabel.text = title
            if selected == true {
                menuLabel.textColor = .kurlyPurple
            }
            else {
                menuLabel.textColor = .kurlyTextGray
            }
        }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
