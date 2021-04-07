//
//  StocksModel.swift
//  Perich_PZ_tinkoff_laba
//
//  Created by Petar Perich on 30.01.2021.
//

import Foundation

struct Stocks: Decodable  {
    var symbol: String
    var fullName: String
    var price: String
    var change: String
    var sixMPrice: String
    var oneYPrice: String
}
