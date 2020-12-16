//
//  MY20201215_MengjiaoYang_NYCSchoolsTests.swift
//  MY20201215-MengjiaoYang-NYCSchoolsTests
//
//  Created by mengjiao on 12/16/20.
//

import XCTest
import SwiftUI
@testable import MY20201216_MengjiaoYang_NYCSchools

/// Test requst method in NetWorkingEngine
class NetWorkingEngineTests: XCTestCase {
   
    ///Test able to get school List
    func testSchoolListRequest() throws {
        var schoolList: [SchoolModel] = []
        NetWorkingEngine.request(endpoint: CityOfNewyorkEndpoint.getSchoolList) { (result: Result<[School], Error>) in
            switch result {
            case .success(let schools):
                for s in schools {
                    let databaseNumber = s.dbn
                    let schoolName = s.school_name
                    let introduction = s.overview_paragraph
                    let school = SchoolModel(databaseNumber, schoolName, introduction)
                    
                    schoolList += [school]
                    XCTAssert(schoolList.count > 0, "no school data")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    ///Test able to get sat data List
    func testSatDataRequest() throws {
        var datas: [SatDataModel] = []
        NetWorkingEngine.request(endpoint: CityOfNewyorkEndpoint.getSchoolSatDataList) { (result: Result<[SatData], Error>) in
            switch result {
            case .success(let satDatas):
                for s in satDatas {
                    let math = s.sat_math_avg_score
                    let reading = s.sat_critical_reading_avg_score
                    let writing = s.sat_writing_avg_score
                    let satData = SatDataModel(math, reading, writing)
                    datas += [satData]
                    XCTAssert(datas.count > 0, "no sata data found")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    


}
