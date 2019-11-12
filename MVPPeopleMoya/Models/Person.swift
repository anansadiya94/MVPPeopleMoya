//
//  Person.swift
//  MVPPeopleMoya
//
//  Created by Anan Sadiya on 11/11/2019.
//  Copyright © 2019 Anan Sadiya. All rights reserved.
//

import Foundation

class Person: Codable {
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
}

extension Person {
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender
    }
}

//
//"name": "Luke Skywalker",
//"height": "172",
//"mass": "77",
//"hair_color": "blond",
//"skin_color": "fair",
//"eye_color": "blue",
//"birth_year": "19BBY",
//"gender": "male",
