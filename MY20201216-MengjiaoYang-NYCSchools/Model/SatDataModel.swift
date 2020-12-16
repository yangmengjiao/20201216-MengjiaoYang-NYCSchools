//
//  SatDataModel.swift
//  20201215-MengjiaoYang-NYCSchools
//
//  Created by mengjiao on 12/16/20.
//

struct SatDataModel {
    let avgMathScore: String
    let avgReadingScore: String
    let avgWritingScore: String
    
    init(_ avgMathScore: String, _ avgReadingScore: String, _ avgWritingScore: String) {
        self.avgMathScore = avgMathScore
        self.avgReadingScore = avgReadingScore
        self.avgWritingScore = avgWritingScore
    }
}
