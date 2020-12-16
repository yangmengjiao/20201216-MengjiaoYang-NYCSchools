//
//  SchoolModel.swift
//  20201215-MengjiaoYang-NYCSchools
//
//  Created by mengjiao on 12/16/20.
//

struct SchoolModel: Hashable {
    let databaseNumber: String
    let schoolName: String
    let introduction: String
    
    init(_ databaseNumber: String, _ schoolName: String, _ introduction: String) {
        self.databaseNumber = databaseNumber
        self.schoolName = schoolName
        self.introduction = introduction
    }
}
