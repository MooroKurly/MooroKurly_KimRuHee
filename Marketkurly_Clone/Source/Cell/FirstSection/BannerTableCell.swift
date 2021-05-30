//
//  BannerCollectionCell.swift
//  Marketkurly_Clone
//
//  Created by 김루희 on 2021/05/19.
//

import UIKit
import SnapKit

class BannerTableCell: UITableViewCell {
    
    static let identifier = "BannerTableCell"
    
    //MARK: - Property
    
    var bannerImageArray = ["imgBanner", "imgBanner2", "imgBanner", "imgBanner2"]
    
    var bannerCV : UICollectionView = {
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
       
        bannerCV.delegate = self
        bannerCV.dataSource = self
        bannerCV.register(BannerCollectionCell.self, forCellWithReuseIdentifier: "BannerCollectionCell")
        
        addSubview(bannerCV)
        
        bannerCV.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalToSuperview()
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

extension BannerTableCell : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 340)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
}

//MARK: - UICollectionViewDataSource

extension BannerTableCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionCell", for: indexPath) as? BannerCollectionCell else { return UICollectionViewCell() }
        cell.setData(imageName: bannerImageArray[indexPath.row])
        return cell
    }
    
    
}
