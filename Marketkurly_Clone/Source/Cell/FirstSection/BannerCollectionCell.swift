//
//  BannerCollectionCell.swift
//  Marketkurly_Clone
//
//  Created by 김루희 on 2021/05/28.
//

import UIKit

class BannerCollectionCell: UICollectionViewCell {
    
    static let identifier = "BannerCollectionCell"
    
    //MARK: - Property
    
    let bannerImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    //MARK: - UI 관련
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bannerImage)
        
        bannerImage.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 데이터 세팅
    
    func setData(imageName : String) {
        
        if let image = UIImage(named: imageName) {
            bannerImage.image = image
        }
    }
    
}
