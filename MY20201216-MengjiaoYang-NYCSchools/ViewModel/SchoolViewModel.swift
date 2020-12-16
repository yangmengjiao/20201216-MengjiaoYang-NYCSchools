//
//  SchoolViewModel.swift
//  20201215-MengjiaoYang-NYCSchools
//
//  Created by mengjiao on 12/16/20.
//

import Foundation
import SwiftUI

/// Viewmodel for SchoolListView
class SchoolViewModel: ObservableObject {
    @Published var satModel: SatDataModel?
    @Published var shouldShowIndicator = true
    
    var avgMathScore: String {
        return displayableScore(satModel?.avgMathScore)
    }
    
    var avgReadingScore: String {
        return displayableScore(satModel?.avgReadingScore)
    }
    
    var avgWritingScore: String {
        return displayableScore(satModel?.avgWritingScore)
    }
    
    /// Fetech school's Sat data , convert into satModel
    /// - Parameters:
    ///     - dbn: the school 's id
    func  fetechSatDataBySchooName(dbn: String) {
        NetWorkingEngine.request(endpoint: CityOfNewyorkEndpoint.getSchoolSatDataList) { (result: Result<[SatData], Error>) in
            switch result {
            case .success(let satDatas):
                if let satData = satDatas.first(where: { $0.dbn == dbn }) {
                    
                    let math = satData.sat_math_avg_score
                    let reading = satData.sat_critical_reading_avg_score
                    let writing = satData.sat_writing_avg_score
                    
                    self.satModel = SatDataModel(math, reading, writing)
                }
                self.shouldShowIndicator = false
            case .failure(let error):
                print(error)
            }
        }
    }
    
    ///If score is a legt, return score, otherwise return "N/A", (Beause I found some time the score is not a number )
    /// - Parameters:
    ///     - score: the Sat score (math or reading or writing )
    func displayableScore(_ score: String?) -> String {
        if let score = score {
            return String(score)
        } else {
            return Constant.notAvailable
        }
    }
}
