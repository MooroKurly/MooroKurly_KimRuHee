//
//  RegretPriceTableCell.swift
//  Marketkurly_Clone
//
//  Created by 김루희 on 2021/05/28.
//

import UIKit

class RegretPriceTableCell: UITableViewCell {
    
    static let identifier = "RegretPriceTableCell"
    
    var productList = [
        ProductDataModel(productImageName: "imgFood1", productName: "[우리밀] 두부과자",
                         productPercent: "20%", productPrice: "24,000원", productPreviousPrice: "24,000원"),
        
        ProductDataModel(productImageName: "imgFood2", productName: "무농약 브로컬리 2종",
                         productPercent: "15%", productPrice: "13,305원", productPreviousPrice: "19,920원"),
        
        ProductDataModel(productImageName: "imgFood3", productName: "김루희짜요짜요",
                         productPercent: "14%", productPrice: "11,981원", productPreviousPrice: "9,720원"),
        
        ProductDataModel(productImageName: "imgFood1", productName: "주저하는 연인들",
                         productPercent: "24%", productPrice: "31,807원", productPreviousPrice: "22,830원"),
        
        ProductDataModel(productImageName: "imgFood2", productName: "탄산수맛있다",
                         productPercent: "29%", productPrice: "24,000원", productPreviousPrice: "26,298원"),
        
        ProductDataModel(productImageName: "imgFood3", productName: "잠이가 온다네",
                         productPercent: "18%", productPrice: "14,300원", productPreviousPrice: "24,000원")
        
    ]
    
    //MARK: - Property
    
    let regretLabel : UILabel = {
        let label = UILabel()
        label.text = "놓치면 후회할 가격"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let seemoreButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "buttonSeemore2"), for: .normal)
        return button
    }()
    
    var productCV : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    //MARK: - UI 관련
    
    func configureUI() {
        
        productCV.delegate = self
        productCV.dataSource = self
        productCV.register(ProductCollectionCell.self, forCellWithReuseIdentifier: "ProductCollectionCell")
        
        addSubview(regretLabel)
        addSubview(seemoreButton)
        addSubview(productCV)
        
        regretLabel.snp.makeConstraints { (make) in
            make.top.equalTo(28)
            make.leading.equalTo(16)
        }
        
        seemoreButton.snp.makeConstraints { (make) in
            make.top.equalTo(28)
            make.leading.equalTo(regretLabel.snp.trailing).offset(6)
        }
        
        productCV.snp.makeConstraints { (make) in
            make.top.equalTo(regretLabel.snp.bottom).offset(15)
            make.leading.equalTo(0)
            make.bottom.trailing.equalTo(0)
        }
        
        
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

extension RegretPriceTableCell : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let cellWidth = width * (150/375)
        
        return CGSize(width: cellWidth, height: 266)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 40, right: 16)
    }
    
}

extension RegretPriceTableCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionCell", for: indexPath)
                as? ProductCollectionCell  else { return UICollectionViewCell() }
        
        cell.setData(imageName: productList[indexPath.row].productImageName,
                     name: productList[indexPath.row].productName,
                     percent: productList[indexPath.row].productPercent,
                     price: productList[indexPath.row].productPrice,
                     previous: productList[indexPath.row].productPreviousPrice)
        
        return cell
    }
    
    
}
