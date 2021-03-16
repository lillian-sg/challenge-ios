//
//  Content.swift
//  ChallengeGOK
//
//  Created by Lilian on 12/03/21.
//


import Foundation

struct Content: Decodable {
    var spotlight: [Spotlight]?
    var products: [Product]?
    var cash: Cash?
   

}
struct Spotlight: Decodable {
    
    var name: String?
    var bannerURL: String?
    var description: String?
    
}

struct Product: Decodable {
    
    var name: String?
    var imageURL: String?
    var description: String?
    
}

struct Cash: Decodable {
    
    var title: String?
    var bannerURL: String?
    var description: String?
    
}
