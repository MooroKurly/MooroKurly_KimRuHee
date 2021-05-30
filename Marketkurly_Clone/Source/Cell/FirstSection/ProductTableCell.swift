//
//  ProductTableCell.swift
//  Marketkurly_Clone
//
//  Created by 김루희 on 2021/05/28.
//

import UIKit

class ProductTableCell: UITableViewCell {
    
    static let identifier = "ProductTableCell"
    
    var productList = [
        ProductDataModel(productImageName: "imgProduct", productName: "[우리밀] 두부과자",
                         productPercent: "4%", productPrice: "2,200원", productPreviousPrice: "2,200원"),
        
        ProductDataModel(productImageName: "imgProduct2", productName: "무농약 브로컬리 2종",
                         productPercent: "10%", productPrice: "3,305원", productPreviousPrice: "9,920원"),
        
        ProductDataModel(productImageName: "imgProduct", productName: "무로컬리즈",
                         productPercent: "14%", productPrice: "1,981원", productPreviousPrice: "9,720원"),
        
        ProductDataModel(productImageName: "imgProduct2", productName: "주저하는 연인들",
                         productPercent: "24%", productPrice: "3,807원", productPreviousPrice: "4,830원"),
        
        ProductDataModel(productImageName: "imgProduct", productName: "좋을텐데",
                         productPercent: "9%", productPrice: "7,982원", productPreviousPrice: "6,298원"),
        
        ProductDataModel(productImageName: "imgProduct2", productName: "잠이가 온다네",
                         productPercent: "8%", productPrice: "4,300원", productPreviousPrice: "1,350원")
        
    ]
    
    //MARK: - Property
    
    let productLabel : UILabel = {
        let label = UILabel()
        label.text = "이 상품 어때요?"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
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
        
        addSubview(productLabel)
        addSubview(productCV)
        
        productLabel.snp.makeConstraints { (make) in
            make.top.equalTo(31)
            make.leading.equalTo(16)
        }
        
        productCV.snp.makeConstraints { (make) in
            make.top.equalTo(productLabel.snp.bottom).offset(15)
            make.leading.equalTo(0)
            make.bottom.trailing.equalTo(0)
        }
        
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

//MARK: - UICollectionViewDelegate, UICollectionViewDelegateFlowLayout

extension ProductTableCell : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
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

//MARK: - UICollectionViewDataSource

extension ProductTableCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionCell", for: indexPath) as? ProductCollectionCell else { return UICollectionViewCell() }
        
        cell.setData(imageName: productList[indexPath.row].productImageName,
                     name: productList[indexPath.row].productName,
                     percent: productList[indexPath.row].productPercent,
                     price: productList[indexPath.row].productPrice,
                     previous: productList[indexPath.row].productPreviousPrice)
        return cell
    }
}
