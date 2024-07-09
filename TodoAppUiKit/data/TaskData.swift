//
//  TaskData.swift
//  TASK
//
//  Created by macbook pro on 28/06/24.
//

import SwiftUI
import Foundation
import SwiftData

struct TaskData: Equatable, Hashable{
    var id:String
    var title:String
    var descreption:String
    var date:Date
    var image: UIImage?
    var isComplected:Bool = false
    var status:StatusData = StatusData.PENDING
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(isComplected)
        hasher.combine(status)
    }
    static func == (lhs: TaskData, rhs: TaskData) -> Bool {
           return lhs.id == rhs.id && lhs.title == rhs.title && lhs.isComplected == rhs.isComplected
            && lhs.status == rhs.status
       }
     
}
