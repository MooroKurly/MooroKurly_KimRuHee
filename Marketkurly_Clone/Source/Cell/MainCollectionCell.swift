//
//  MainCollectionCell.swift
//  Marketkurly_Clone
//
//  Created by Thisisme Hi on 2021/06/20.
//

import UIKit

class MainCollectionCell: UICollectionViewCell {
    
    static let identifier = "MainCollectionCell"

    var saleList : [Sale] = []
    var saleDiscountList : [SpecialPrice] = []

    // MARK: - Property
    
    let mainTV = UITableView(frame: CGRect.zero, style: .grouped)
    
    
    // MARK: - UI
    
    func configureUI() {
        
        mainTV.delegate = self
        mainTV.dataSource = self
        mainTV.separatorStyle = .none
        
        mainTV.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: CGFloat.leastNormalMagnitude))
        mainTV.sectionHeaderHeight = 0
        
        // section == 0 에 해당하는 cell
        mainTV.register(BannerTableCell.self, forCellReuseIdentifier: "BannerTableCell")
        mainTV.register(ProductTableCell.self, forCellReuseIdentifier: "ProductTableCell")
        mainTV.register(SaleTableCell.self, forCellReuseIdentifier: "SaleTableCell")
        mainTV.register(SaleSubTableCell.self, forCellReuseIdentifier: "SaleSubTableCell")
        mainTV.register(DailySubTableCell.self, forCellReuseIdentifier: "DailySubTableCell")
        mainTV.register(DailySaleTableCell.self, forCellReuseIdentifier: "DailySaleTableCell")
        
        // section == 1 에 해당하는 cell
        mainTV.register(RegretPriceTableCell.self, forCellReuseIdentifier: "RegretPriceTableCell")
        
        addSubview(mainTV)
        
        // tabbar 아래 tableView..
        mainTV.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    // MARK: - Function
    
    // 일일특가 부분에 서버에서 받아온 데이터 넣어주는 함수
    func getSaleData() {
        
        GetFoodService.shared.URL.self = APIConstants.foodURL + "1"
        
        GetFoodService.shared.getFood { (response) in
            switch response {
            
            case .success(let foodData):
                
                if let decodedData = foodData as? [Sale] {
                    self.saleList = decodedData
                    self.mainTV.reloadData()
                    
                }
                
            case .requestErr(let foodData):
                print(foodData)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
        
    }
    
    // 특가/혜택 부분
    func getSpecialData() {
        
        GetSpecialPriceService.shared.getSpecialPrice { (response) in
            switch response {
            
            case .success(let priceData):
                print(priceData,"여기여기")
                if let decodedData = priceData as? [SpecialPrice] {
                    print(decodedData,"여기여기")
                    self.saleDiscountList = decodedData
                    self.mainTV.reloadData()
                }
                
            case .requestErr(let priceData):
                print("requestERR", priceData)
            case .pathErr:
                print("pathERR")
            case .serverErr:
                print("serverERR")
            case .networkFail:
                print("networkFail","설마?")
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - UITableViewDelegate

extension MainCollectionCell : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                return 340
                
            } else if indexPath.row == 1 {
                return 371
                
            }
            
        case 1:
            if indexPath.row == 0 {
                return 64
            } else {
                return 342
            }
            
        case 2:
            if indexPath.row == 0 {
                return 93
            } else {
                return 250
            }
            
        default:
            return 371
            
        }
        return CGFloat()
    }
    
    // tableView footer
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0, 1, 2:
            return CGFloat()
            
        default:
            return 430
        }
    }
    
}



//MARK: - UITableViewDataSource

extension MainCollectionCell : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 2
        case 1:
            return 1 + saleDiscountList.count
            
        case 2:
            return 1 + saleList.count
            
        default:
            return 1
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 { // 배너 관련 셀
                guard let bannerCell = tableView.dequeueReusableCell(withIdentifier: "BannerTableCell", for: indexPath)
                        as? BannerTableCell else { return UITableViewCell() }
                
                bannerCell.configureUI()
                bannerCell.getData()
                return bannerCell
                
            } else if indexPath.row == 1 { // 이 상품 어때요 셀
                guard let productCell = tableView.dequeueReusableCell(withIdentifier: "ProductTableCell", for: indexPath)
                        as? ProductTableCell else { return UITableViewCell() }
                
                productCell.selectionStyle = .none
                productCell.configureUI()
                productCell.getData()
                
                return productCell
            }
        case 1:
            if indexPath.row == 0 { // 특가/혜택 셀
                guard let saleCell = tableView.dequeueReusableCell(withIdentifier: "SaleTableCell", for: indexPath)
                        as? SaleTableCell else { return UITableViewCell() }
                
                saleCell.backgroundColor = UIColor(red: 246.0 / 255.0, green: 247.0 / 255.0, blue: 248.0 / 255.0, alpha: 1.0)
                
                saleCell.selectionStyle = .none
                saleCell.configureUI()
                
                return saleCell
            } else { // 특가/혜택 내용 부분 셀
                guard let saleSubCell = tableView.dequeueReusableCell(withIdentifier: "SaleSubTableCell", for: indexPath)
                        as? SaleSubTableCell else { return UITableViewCell() }
                
                saleSubCell.backgroundColor = UIColor(red: 246.0 / 255.0, green: 247.0 / 255.0, blue: 248.0 / 255.0, alpha: 1.0)
                
                saleSubCell.selectionStyle = .none
                saleSubCell.configureUI()
                saleSubCell.setData(imageName: saleDiscountList[indexPath.row-1].thumbnail,
                                    sale: saleDiscountList[indexPath.row-1].title,
                                    subName: saleDiscountList[indexPath.row-1].subtitle)
                
                return saleSubCell
            }
        case 2:
            if indexPath.row == 0 { // 일일특가에서 제목부분 ( 24시간 한정 특가 ) 셀
                guard let dailysubCell = tableView.dequeueReusableCell(withIdentifier: "DailySubTableCell", for: indexPath)
                        as? DailySubTableCell else { return UITableViewCell() }
                
                dailysubCell.selectionStyle = .none
                dailysubCell.configureUI()
                
                return dailysubCell
                
                
            } else { // 일일특가 상세 셀
                guard let dailyCell = tableView.dequeueReusableCell(withIdentifier: "DailySaleTableCell", for: indexPath)
                        as? DailySaleTableCell else { return UITableViewCell() }
                
                dailyCell.selectionStyle = .none
                dailyCell.configureUI()
                dailyCell.setData(imageName: saleList[indexPath.row-1].product.img,
                                  time: saleList[indexPath.row-1].time,
                                  name: saleList[indexPath.row-1].product.name,
                                  percent: String(saleList[indexPath.row-1].discountRate)+"%",
                                  price: String(saleList[indexPath.row-1].product.price)+"원")
                
                return dailyCell
                
            }
            
        case 3:
            
            if indexPath.row == 0 {
                guard let regretCell = tableView.dequeueReusableCell(withIdentifier: "RegretPriceTableCell", for: indexPath)
                        as? RegretPriceTableCell else { return UITableViewCell() }
                
                regretCell.selectionStyle = .none
                regretCell.configureUI()
                regretCell.getData()
                
                return regretCell
                
            }
            
        default:
            return UITableViewCell()
            
            
        }
        
        return UITableViewCell()
    }
    
    
    // footer 넣기
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        switch section {
        case 0, 1, 2:
            return UIView()
            
        default:
            let footer = TableFooterView()
            footer.backgroundColor = UIColor.kurlyBackgroundGray
            return footer
        }
    }
    
    
    
}
