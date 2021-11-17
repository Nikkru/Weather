//
//  User.swift
//  Weather
//
//  Created by Nikolai Krusser on 13.11.2021.
//

import Foundation

struct User {
    let name: String
    let image: String
    var friends = [String]()
    var groups = [Group]()
}
