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
    let id: String
    let title: String
    let subtitle: String
    let thumbnail: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, subtitle, thumbnail
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = (try? values.decode(String.self, forKey: .id)) ?? ""
        title = (try? values.decode(String.self, forKey: .title)) ?? ""
        subtitle = (try? values.decode(String.self, forKey: .subtitle)) ?? ""
        thumbnail = (try? values.decode(String.self, forKey: .thumbnail)) ?? ""
    }
}
