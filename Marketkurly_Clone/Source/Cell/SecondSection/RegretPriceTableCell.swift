//
//  RegretPriceTableCell.swift
//  Marketkurly_Clone
//
//  Created by 김루희 on 2021/05/28.
//

import UIKit

class RegretPriceTableCell: UITableViewCell {
    
    static let identifier = "RegretPriceTableCell"
    
    var productList : [Sale] = []
    
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
    
    func getData() {
        
        GetFoodService.shared.URL.self = APIConstants.foodURL + "2"

        GetFoodService.shared.getFood { (response) in
            
            switch response {
            
            case .success(let foodData):
                
                if let decodedData = foodData as? [Sale] {
                    
                    self.productCV.reloadData()
                    self.productList = decodedData
                    
                }
            
            case .requestErr(let foodData):
                print("requestERR", foodData)
            case .pathErr:
                print("pathERR")
            case .serverErr:
                print("serverERR")
            case .networkFail:
                print("networkFail")
            }
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
        
        cell.setData(imageName: productList[indexPath.row].product.img,
                     name: productList[indexPath.row].product.name,
                     percent: String(productList[indexPath.row].discountRate)+"%",
                     price: String(productList[indexPath.row].discountedPrice)+"원",
                     previous: String(productList[indexPath.row].product.price)+"원")
        return cell
    }
    
    
}
