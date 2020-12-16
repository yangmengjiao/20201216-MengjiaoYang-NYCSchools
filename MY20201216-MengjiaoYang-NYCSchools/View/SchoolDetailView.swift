//
//  SchoolDetailView.swift
//  20201215-MengjiaoYang-NYCSchools
//
//  Created by mengjiao on 12/16/20.
//

import SwiftUI

/// Show selected school's  additional informations
struct SchoolDetailView: View {
    // selected school
    var school: SchoolModel
    
    // view model
    @ObservedObject var schoolModel = SchoolViewModel()
    
    init(school: SchoolModel) {
        self.school = school
        schoolModel.fetechSatDataBySchooName(dbn: school.databaseNumber)
        return
    }
    
    var body: some View {
        Form {
            // dispaly school name
            Section(header: Text(Constant.schoolName)) {
                Text(school.schoolName)
            }
            
            // diplay school introdction
            Section(header: Text(Constant.schoolIntro)) {
                Text(school.introduction)
            }
            
            // display Sat datas
            Section(header: Text(Constant.avageSatScores)) {
                Text("\(Constant.readingScore) \(schoolModel.avgReadingScore)")
                Text("\(Constant.writingScore) \(schoolModel.avgWritingScore)")
                Text("\(Constant.mathScore) \(schoolModel.avgMathScore)")
            }
        }
        Spacer()
    }
    
}

struct SchoolDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
      SchoolDetailView(school: SchoolModel("", "", ""))
    }
}
