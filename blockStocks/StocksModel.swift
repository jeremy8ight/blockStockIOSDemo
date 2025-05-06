//
//  StocksModel.swift
//  blockStocks
//
//  Created by Jeremy Barnes-Smith on 5/5/25.
//

import Foundation

struct Response: Codable {
    var stocks: [StocksModel]
}

struct StocksModel: Codable, Identifiable {
    var id = UUID().uuidString
    var ticker: String
    var name: String
    var currency: String
    var currentPriceCents: Double
    var quantity: Int?
    var currentPriceTimestamp: Double
    
    enum CodingKeys: String, CodingKey {
        case ticker
        case name
        case currency
        case currentPriceCents = "current_price_cents"
        case quantity
        case currentPriceTimestamp = "current_price_timestamp"
    }
}


