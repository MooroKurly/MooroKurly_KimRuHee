//
//  DailySubTableCell.swift
//  Marketkurly_Clone
//
//  Created by 김루희 on 2021/05/28.
//

import UIKit

class DailySaleTableCell: UITableViewCell {
    
    static let identifier = "DailySaleTableCell"
    
    //MARK: - Property
    
    let foodImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let saleStickerImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "icSalelabel")
        return image
    }()
    
    let purpleView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 111.0 / 255.0, green: 3.0 / 255.0, blue: 178.0 / 255.0, alpha: 0.5)
        return view
    }()
    
    let timeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let leftLabel : UILabel = {
        let label = UILabel()
        label.text = "남음"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    let foodNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .black
        return label
    }()
    
    let percentLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = UIColor(red: 249.0 / 255.0, green: 98.0 / 255.0, blue: 47.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let priceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    
    //MARK: - UI 관련
    
    func configureUI() {
        
        addSubview(foodImage)
        addSubview(saleStickerImage)
        foodImage.addSubview(purpleView)
        purpleView.addSubview(timeLabel)
        purpleView.addSubview(leftLabel)
        addSubview(foodNameLabel)
        addSubview(percentLabel)
        addSubview(priceLabel)
        
        foodImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }
        
        saleStickerImage.snp.makeConstraints { (make) in
            make.top.equalTo(foodImage.snp.top)
            make.leading.equalTo(foodImage.snp.leading)
        }
        
        purpleView.snp.makeConstraints { (make) in
            make.top.equalTo(139)
            make.leading.bottom.trailing.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(6)
            make.leading.equalTo(118)
        }
        
        leftLabel.snp.makeConstraints { (make) in
            make.top.equalTo(12)
            make.leading.equalTo(timeLabel.snp.trailing).offset(8)
        }
        
        foodNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(foodImage.snp.bottom).offset(9)
            make.leading.equalTo(16)
        }
        
        percentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(foodNameLabel.snp.bottom).offset(6)
            make.leading.equalTo(16)
        }
        
        priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(foodNameLabel.snp.bottom).offset(6)
            make.leading.equalTo(percentLabel.snp.trailing).offset(10)
            make.bottom.equalTo(-26)
        }
        
    }
    
    func setData(imageName : String, time : String,
                 name : String, percent : String, price : String) {
        
        if let image = UIImage(named: imageName) {
            foodImage.image = image
        }
        
        timeLabel.text = time
        foodNameLabel.text = name
        percentLabel.text = percent
        priceLabel.text = price
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
