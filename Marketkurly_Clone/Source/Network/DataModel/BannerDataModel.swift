//
//  BannerDataModel.swift
//  Marketkurly_Clone
//
//  Created by Thisisme Hi on 2021/06/20.
//

import Foundation

// MARK: - BannerDataModel
struct BannerDataModel: Codable {
    let msg: String
    let banners: [Banner]
}

// MARK: - Banner
struct Banner: Codable {
    let id: String
    let img: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case img
    }
}
