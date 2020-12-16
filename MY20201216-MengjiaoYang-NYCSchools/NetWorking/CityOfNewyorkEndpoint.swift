//
//  CityOfNewyorkEndpoint.swift
//  20201215-MengjiaoYang-NYCSchools
//
//  Created by mengjiao on 12/16/20.
//

import Foundation

/// Endpoints configurition
/// add more cases in the future as need 
enum CityOfNewyorkEndpoint: Endpoint {
    case getSchoolList
    case getSchoolSatDataList
    
    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return "data.cityofnewyork.us"
        }
    }
    
    var path: String {
        switch self {
        case .getSchoolList:
            return "/resource/s3k6-pzi2.json"
        case .getSchoolSatDataList:
            return "/resource/f9bf-2cp4.json"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        default:
            return []
        }
    }
    
    var method: String {
        switch self {
        case .getSchoolList:
            return "GET"
        case .getSchoolSatDataList:
            return "GET"
        }
    }
}

