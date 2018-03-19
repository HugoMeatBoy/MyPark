//
//  ActivityModel.swift
//  P(z)K
//
//  Created by Thais Aurard on 18/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ActivityModel{
    var activityName : String = ""
    var activityDescription : String = ""
    var activityDurationH : Int
    var activityDurationMin : Int
    
    init(activityName : String, activityDescription : String, activityDurationH: Int, activityDurationMin: Int){
        self.activityName = activityName
        self.activityDescription = activityDescription
        self.activityDurationH = activityDurationH
        self.activityDurationMin = activityDurationMin
    }
}
