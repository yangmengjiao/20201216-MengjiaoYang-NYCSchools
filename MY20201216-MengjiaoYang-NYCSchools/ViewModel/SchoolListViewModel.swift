//
//  SchoolListViewModel.swift
//  20201215-MengjiaoYang-NYCSchools
//
//  Created by mengjiao on 12/16/20.
//

import Foundation
import SwiftUI

///  Viewmodel for SchoolDetailView
class SchoolListViewModel: ObservableObject {
    @Published var schools = [SchoolModel]()
    @Published var shouldShowIndicator = true
    
    init() {
        /// Fetch school list and convert into SchoolModel list
        NetWorkingEngine.request(endpoint: CityOfNewyorkEndpoint.getSchoolList) { (result: Result<[School], Error>) in
            switch result {
            case .success(let schools):
                for s in schools {
                    let databaseNumber = s.dbn
                    let schoolName = s.school_name
                    let introduction = s.overview_paragraph
                    let school = SchoolModel(databaseNumber, schoolName, introduction)
                    self.schools += [school]
                    
                    self.shouldShowIndicator = false
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
