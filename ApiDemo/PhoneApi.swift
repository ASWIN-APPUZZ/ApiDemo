//
//  File.swift
//  ApiDemo
//
//  Created by ASWIN A on 30/11/23.
//

import Foundation

struct PhoneApi: Codable{
    var products: [Products]
}
    
struct Products: Codable{
    var title: String?
    var description: String?
    var price: Int?
    var thumbnail: String?
}
