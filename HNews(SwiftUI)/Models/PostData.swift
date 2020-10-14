//
//  PostData.swift
//  HNews(SwiftUI)
//
//  Created by Timur on 7/4/20.
//  Copyright © 2020 Timur. All rights reserved.
//

import Foundation

struct Results: Decodable{
    let hits : [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
