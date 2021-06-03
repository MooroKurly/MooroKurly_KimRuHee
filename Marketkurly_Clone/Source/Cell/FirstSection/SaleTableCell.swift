//
//  SaleTableCell.swift
//  Marketkurly_Clone
//
//  Created by 김루희 on 2021/05/28.
//

import UIKit

class SaleTableCell: UITableViewCell {
    
    static let identifier = "SaleTableCell"
    
    //MARK: - Property
    
    let saleLabel : UILabel = {
        let label = UILabel()
        label.text = "특가/혜택"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let seemoreButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "buttonSeemore"), for: .normal)
        return button
    }()
    
    let firstImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "imgSale1")
        return image
    }()
    
    let firstLabel : UILabel = {
        let label = UILabel()
        label.text = "아티제 최대 15% 할인"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    let firstsubLabel : UILabel = {
        let label = UILabel()
        label.text = "쿠키부터 롤케이크까지"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .kurlyTextGray
        return label
    }()
    
    let secondImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "imgSale2")
        return image
    }()
    
    let secondLabel : UILabel = {
        let label = UILabel()
        label.text = "최대 25% 할인 & 무료 체험"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    let secondsubLabel : UILabel = {
        let label = UILabel()
        label.text = "매디뷰티 브랜드 에스트라"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .kurlyTextGray
        return label
    }()
    
    let thirdImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "imgSale3")
        return image
    }()
    
    let thirdLabel : UILabel = {
        let label = UILabel()
        label.text = "금주의 추천 정육 최대 30% 할인"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    let thirdsubLabel : UILabel = {
        let label = UILabel()
        label.text = "컬리가 고른 한돈/한우/계육"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .kurlyTextGray
        return label
    }()
    
    //MARK: - UI 관련
    
    func configureUI() {
                
        addSubview(saleLabel)
        addSubview(seemoreButton)
        addSubview(firstImage)
        addSubview(firstLabel)
        addSubview(firstsubLabel)
        addSubview(secondImage)
        addSubview(secondLabel)
        addSubview(secondsubLabel)
        addSubview(thirdImage)
        addSubview(thirdLabel)
        addSubview(thirdsubLabel)
        
        saleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(29)
            make.leading.equalTo(16)
        }
        
        seemoreButton.snp.makeConstraints { (make) in
            make.top.equalTo(28)
            make.leading.equalTo(saleLabel.snp.trailing).offset(7)
        }
        
        firstImage.snp.makeConstraints { (make) in
            make.top.equalTo(saleLabel.snp.bottom).offset(14)
            make.leading.equalTo(16)
        }
        
        firstLabel.snp.makeConstraints { (make) in
            make.top.equalTo(92)
            make.leading.equalTo(firstImage.snp.trailing).offset(20)
        }
        
        firstsubLabel.snp.makeConstraints { (make) in
            make.top.equalTo(firstLabel.snp.bottom).offset(6)
            make.leading.equalTo(firstImage.snp.trailing).offset(20)
        }
        
        secondImage.snp.makeConstraints { (make) in
            make.top.equalTo(firstImage.snp.bottom).offset(14)
            make.leading.equalTo(16)
        }
        
        secondLabel.snp.makeConstraints { (make) in
            make.top.equalTo(firstsubLabel.snp.bottom).offset(66)
            make.leading.equalTo(secondImage.snp.trailing).offset(20)
        }
        
        secondsubLabel.snp.makeConstraints { (make) in
            make.top.equalTo(secondLabel.snp.bottom).offset(6)
            make.leading.equalTo(secondImage.snp.trailing).offset(20)
        }
        
        thirdImage.snp.makeConstraints { (make) in
            make.top.equalTo(secondImage.snp.bottom).offset(14)
            make.leading.equalTo(16)
        }
        
        thirdLabel.snp.makeConstraints { (make) in
            make.top.equalTo(secondsubLabel.snp.bottom).offset(67)
            make.leading.equalTo(thirdImage.snp.trailing).offset(20)
        }
        
        thirdsubLabel.snp.makeConstraints { (make) in
            make.top.equalTo(thirdLabel.snp.bottom).offset(6)
            make.leading.equalTo(thirdImage.snp.trailing).offset(20)
        }
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
