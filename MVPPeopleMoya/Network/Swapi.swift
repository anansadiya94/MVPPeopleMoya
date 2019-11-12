//
//  Actor.swift
//  MVPPeopleMoya
//
//  Created by Anan Sadiya on 11/11/2019.
//  Copyright © 2019 Anan Sadiya. All rights reserved.
//

import Foundation
import Moya

enum Swapi {
    case getPeople
}

extension Swapi: TargetType {
    var baseURL: URL {
        return URL(string: "https://swapi.co/api")!
    }
    
    var path: String {
        switch self {
        case .getPeople: return "/people/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPeople: return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getPeople:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
