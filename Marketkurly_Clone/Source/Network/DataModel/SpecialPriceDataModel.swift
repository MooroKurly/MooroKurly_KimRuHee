//
//  SpecialPriceDataModel.swift
//  Marketkurly_Clone
//
//  Created by Thisisme Hi on 2021/06/20.
//

import Foundation

// MARK: - SpecialPriceDataModel
struct SpecialPriceDataModel: Codable {
    let msg: String
    let specialPrices: [SpecialPrice]
}

// MARK: - SpecialPrice
struct SpecialPrice: Codable {
    let id, title, subtitle: String
    let thumbnail: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, subtitle, thumbnail
    }
}
