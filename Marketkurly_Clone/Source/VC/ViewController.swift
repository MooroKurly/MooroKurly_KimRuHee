//
//  ViewController.swift
//  Marketkurly_Clone
//
//  Created by 김루희 on 2021/05/19.
//

import UIKit

import DuctTape
import SnapKit
import Then

class ViewController: UIViewController {
    
    
    var colorArray = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.purple]
    
    //MARK: - Property
    
    let upperView : UIView = {
        let view = UIView()
        view.backgroundColor = .kurlyPurple
        return view
    }()
    
    lazy var menuBar : MenuBar = {
        let mb = MenuBar()
        mb.vc = self
        return mb
    }()
    
    let logoImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "iconLogo")
        return image
    }()
    
    let mapButton : UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(named: "buttonMap"), for: UIControl.State.normal)
        return btn
    }()
    
    let cartButton : UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(named: "buttonCart"), for: UIControl.State.normal)
        return btn
    }()
    
    let menuView : UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let mainCV : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()

    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        configureUI()
        
        mainCV.delegate = self
        mainCV.dataSource = self
        mainCV.register(MainCollectionCell.self, forCellWithReuseIdentifier: "MainCollectionCell")
        mainCV.register(NewProductCollectionCell.self, forCellWithReuseIdentifier: "NewProductCollectionCell")
        mainCV.register(BestCollectionCell.self, forCellWithReuseIdentifier: "BestCollectionCell")
        mainCV.register(ShoppingCollectionCell.self, forCellWithReuseIdentifier: "ShoppingCollectionCell")
        mainCV.register(DiscountCollectionCell.self, forCellWithReuseIdentifier: "DiscountCollectionCell")
        
    }
    
    //MARK: - UI 관련
    
    func configureUI() {
        
        view.addSubview(upperView)
        view.addSubview(logoImage)
        view.addSubview(mapButton)
        view.addSubview(cartButton)
        view.addSubview(menuBar)
        view.addSubview(mainCV)

        
        
        // 상단 로고 uiview
        upperView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(88)
        }
        
        logoImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(42)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        mapButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(52)
            make.trailing.equalTo(cartButton.snp.leading).offset(-14)
        }
        
        cartButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(53)
            make.trailing.equalToSuperview().offset(-17)
        }
        
        menuBar.snp.makeConstraints { (make) in
            make.top.equalTo(upperView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(55)
        }
        
        mainCV.snp.makeConstraints { (make) in
            make.top.equalTo(menuBar.snp.bottom)
            make.leading.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
//            make.height.equalTo(100)
        }
        
    }
}

// MARK: - UICollectionViewDelegate

extension ViewController : UICollectionViewDelegate {
    
    // mainCV 스크롤하면 slideBar도 같이 스크롤
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let slideBar = menuBar.slideBarView
        
        let width = UIScreen.main.bounds.width
        let slideBarWidth = menuBar.slideBarView.frame.width
        
        
        if scrollView.contentOffset == CGPoint(x: 0.0, y: 0.0) {
            menuBar.menuCV.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .init())
            UIView.animate(withDuration: 0.3) {
                // mainCV 이동하면 slideBar 위치도 같이 이동
                slideBar.frame.origin.x = width * (15/width)
                
                // mainCV 이동하면 menuBar 메뉴 색상도 같이 변경
                
                
            }

        } else if scrollView.contentOffset == CGPoint(x: width, y: 0.0) {
            self.menuBar.menuCV.selectItem(at: IndexPath(item: 1, section: 0), animated: true, scrollPosition: .init())
            UIView.animate(withDuration: 0.3) {
                slideBar.frame.origin.x = width * (15/width) + slideBarWidth
                
                
            }

        } else if scrollView.contentOffset == CGPoint(x: width * 2, y: 0.0) {
            self.menuBar.menuCV.selectItem(at: IndexPath(item: 2, section: 0), animated: true, scrollPosition: .init())
            UIView.animate(withDuration: 0.3) {
                slideBar.frame.origin.x = width * (15/width) + slideBarWidth * 2

            }

        } else if scrollView.contentOffset == CGPoint(x: width * 3, y: 0.0) {
            UIView.animate(withDuration: 0.3) {
                slideBar.frame.origin.x = width * (15/width) + slideBarWidth * 3
                self.menuBar.menuCV.selectItem(at: IndexPath(item: 3, section: 0), animated: true, scrollPosition: .init())
               
            }

        } else if scrollView.contentOffset == CGPoint(x: width * 4, y: 0.0) {
            UIView.animate(withDuration: 0.3) {
                slideBar.frame.origin.x = width * (15/width) + slideBarWidth * 4
                self.menuBar.menuCV.selectItem(at: IndexPath(item: 4, section: 0), animated: true, scrollPosition: .init())
               
            }
        }
        
        mainCV.reloadData()

    }
}

// MARK: - UICollectionViewDataSource
extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionCell", for: indexPath) as? MainCollectionCell else { return UICollectionViewCell() }
            
            cell.backgroundColor = colorArray[indexPath.row]
            cell.configureUI()
            cell.getSaleData()
            cell.getSpecialData()
                    
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionCell", for: indexPath)
                    as? MainCollectionCell else { return UICollectionViewCell() }
            cell.backgroundColor = .systemPink
            return cell
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestCollectionCell", for: indexPath)
                    as? BestCollectionCell else { return UICollectionViewCell() }
            cell.backgroundColor = .orange
            return cell
        
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingCollectionCell", for: indexPath)
                    as? ShoppingCollectionCell else { return UICollectionViewCell() }
            cell.backgroundColor = .brown
            return cell
            
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscountCollectionCell", for: indexPath)
                    as? DiscountCollectionCell else { return UICollectionViewCell() }
            cell.backgroundColor = .lightGray
            return cell
        }
        
    }
        
}


// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width, height: UIScreen.main.bounds.height)
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
