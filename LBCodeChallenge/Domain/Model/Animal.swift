//
//  Animal.swift
//  LBCodeChallenge
//
//  Created by Mehtab Ahmed on 20/04/2022.
//

import Foundation

struct Animal: Decodable {
    let name : String
    let latinName : String
    let habitat : String
    let imageLink : String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case latinName = "latin_name"
        case habitat = "habitat"
        case imageLink = "image_link"
    }
}
