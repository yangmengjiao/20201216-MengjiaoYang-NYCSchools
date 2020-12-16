//
//  CityOfNewyorkEndpointTest.swift
//  MY20201215-MengjiaoYang-NYCSchoolsTests
//
//  Created by mengjiao on 12/16/20.
//

import XCTest
@testable import MY20201216_MengjiaoYang_NYCSchools

class CityOfNewyorkEndpointTest: XCTestCase {

    ///Test endpoints are correct 
    func testGetSchoolSatDataList() throws {
        let endpoints = [CityOfNewyorkEndpoint.getSchoolSatDataList, .getSchoolList]
        let urlStrings = [Constant.satDataURLString, Constant.schoolListURLString]
        for (index, endpoint) in endpoints.enumerated() {
            var components = URLComponents()
            components.scheme = endpoint.scheme
            components.host = endpoint.baseURL
            components.path = endpoint.path
            
            guard let url = components.url else {
                return
            }
            print(url)
            XCTAssertEqual(urlStrings[index], url.absoluteString)
        }
    }
    
    struct Constant {
        static let satDataURLString = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
        static let schoolListURLString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    }
}
