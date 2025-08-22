//
//  Product.swift
//  FakeStoreMVPattern
//
//  Created by Siddharth Shekar on 8/22/25.
//

import Foundation

struct Product:Decodable, Identifiable {
    let id: Int
    let title: String
    let price: Double
}
