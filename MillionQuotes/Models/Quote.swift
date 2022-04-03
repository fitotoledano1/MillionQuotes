//
//  Quote.swift
//  MillionQuotes
//
//  Created by Fito Toledano on 03/04/2022.
//

import Foundation

struct Quote: Decodable, Identifiable {
    let id: String
    let author: String
    let content: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case author
        case content = "en"
    }
}
