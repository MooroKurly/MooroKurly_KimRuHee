//
//  ProductCollectionCell.swift
//  Marketkurly_Clone
//
//  Created by 김루희 on 2021/05/27.
//

import UIKit

import Kingfisher
import SnapKit

class ProductCollectionCell: UICollectionViewCell {
    
    static let identifier = "ProductCollectionCell"
    
    //MARK: - Property
    
    let productImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    let percentLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .kurlyOrange
        return label
    }()
    
    let priceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    let previousPriceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .kurlyTextGray
        return label
    }()
    
    //MARK: - UI 관련
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(productImage)
        addSubview(nameLabel)
        addSubview(percentLabel)
        addSubview(priceLabel)
        addSubview(previousPriceLabel)
        
        productImage.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(192)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(productImage.snp.bottom).offset(10)
        }
        
        percentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
        }
        
        priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.leading.equalTo(percentLabel.snp.trailing).offset(9)
        }
        
        previousPriceLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(-7)
        }
    }
    
    //MARK: - 데이터 세팅
    
    func setData(imageName : String, name : String,
                 percent : String, price : String, previous : String) {
        
        if let image = URL(string: imageName) {
            productImage.kf.setImage(with: image)
        }
        
        nameLabel.text = name
        percentLabel.text = percent
        priceLabel.text = price
        previousPriceLabel.text = previous
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
