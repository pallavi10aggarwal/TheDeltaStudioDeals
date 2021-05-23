//
//  Deal.swift
//  TheDeltaStudioDeals
//
//  Created by Admin on 23/05/21.
//

import Foundation

struct Deal:Codable {
    let title:String
    let normalPrice:String
    let salePrice:String
    let thumb:String
    let dealID:String
    let isOnSale:String
}
