//
//  SurveyDetailsModel.swift
//  MRA
//
//  Created by Bharath Kongara on 1/24/16.
//  Copyright © 2016 Bharath Kongara. All rights reserved.
//

import Foundation

var surveryList = [SurveyDetailsModel]();

class SurveyDetailsModel{
    
    var title:String
    var description:String
    var url:String
    var surveyId:Int
    var email:String
    var enrollStartDate:String
    var enrollEndDate:String
    var notificationFrequency:String
    
    init(title:String,description:String,url:String,surveyId:Int,email:String,enrollStartDate:String,enrollEndDate:String,notificationFrequency:String){
        self.title = title
        self.description = description
        self.url = url
        self.surveyId = surveyId
        self.email = email
        self.enrollStartDate = enrollStartDate
        self.enrollEndDate = enrollEndDate
        self.notificationFrequency = notificationFrequency
    }
}