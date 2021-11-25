//
//  News.swift
//  Weather
//
//  Created by Nikolai Krusser on 25.11.2021.
//

import Foundation

class News {
   var newsArray = [New]()
}

struct New {
    let title: String?
    let image: String?
    let nameUser: String?
}
