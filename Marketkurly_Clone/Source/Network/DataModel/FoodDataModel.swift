//
//  FoodDataModel.swift
//  Marketkurly_Clone
//
//  Created by Thisisme Hi on 2021/06/20.
//

import Foundation

// MARK: - FoodDataModel
struct FoodDataModel: Codable {
    let msg: String
    let sales: [Sale]
}

// MARK: - Sale
struct Sale: Codable {
    let saleIndex: Int
    let product: Product
    let discountRate, discountedPrice: Int
    let time: String
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        saleIndex = (try? values.decode(Int.self, forKey: .saleIndex)) ?? 0
        product = (try? values.decode(Product.self, forKey: .product)) ?? Product(id: "", img: "", name: "", price: 0)
        discountRate = (try? values.decode(Int.self, forKey: .discountRate)) ?? 0
        discountedPrice = (try? values.decode(Int.self, forKey: .discountedPrice)) ?? 0
        time = (try? values.decode(String.self, forKey: .time)) ?? ""
    }
}

// MARK: - Product
struct Product: Codable {
    let id: String
    let img: String
    let name: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case img, name, price
    }
}
