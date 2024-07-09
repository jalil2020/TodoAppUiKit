//
//  HomeViewModel.swift
//  TASK
//
//  Created by macbook pro on 29/06/24.
//

import SwiftUI

class MainViewModel : ObservableObject {
    
    @Published var taskList: [TaskData] = []
    
    @Published var tempList: [TaskData] = []
    
    
    @Published var isDescendingSort: Bool = UserDefaults.standard.bool(forKey: "isDescendingSort")
    @Published var complectedSort: String = (UserDefaults.standard.string(forKey: "complectedSort") ?? StatusData.ALL.rawValue)
   
    @Published var filter: String = (UserDefaults.standard.string(forKey: "filter") ?? StatusData.ALL.rawValue)
    
    
    func addTask(task:TaskData){
        taskList.append(task)
        filterAndSort()
    }
    func removeTask(idd:String){
        taskList.removeAll { item in
            item.id == idd
        }
        filterAndSort()
    }
    
    func setIsDescendingSort(b:Bool){
        UserDefaults.standard.set(b, forKey: "isDescendingSort")
        
    }
    
    func setFilter(status:String){
        UserDefaults.standard.set(status, forKey: "filter")
    }
    
    func setComplectedSort(status:String){
        UserDefaults.standard.set(status, forKey: "complectedSort")
    }
    
    func filterAndSort(){
        tempList = taskList
        tempList.removeAll{item in
            if filter == StatusData.ALL.rawValue {
                false
            }else{
                item.status.rawValue != filter
            }
            
        }
        let xl =  tempList.sorted { task1, task2 in
            if isDescendingSort  {
                return task1.date < task2.date
            }else {
                return task1.date > task2.date
            }
        }
        
        tempList.removeAll()
        tempList = xl
        
        let xC = tempList.sorted { task1,  task2 in
            
            if complectedSort == StatusData.COMPLECTED.rawValue  {
                return task1.status.rawValue  == StatusData.COMPLECTED.rawValue && task2.status.rawValue  == StatusData.COMPLECTED.rawValue
            }else {
                if complectedSort == StatusData.PENDING.rawValue  {
                    return task1.status.rawValue  == StatusData.PENDING.rawValue && task2.status.rawValue  == StatusData.PENDING.rawValue
                }else {
                    return true
                }
            }
        }
        tempList.removeAll()
        tempList = xC
        
    }
    
    func changeTaskStatus(b:Bool, id:String){
        var temp = taskList.first { item in
            item.id == id
        }
        temp?.isComplected = b
        
        if b {
            temp?.status = StatusData.COMPLECTED
        }else{
            temp?.status = StatusData.PENDING
        }
        
        if temp != nil{
            taskList.remove(at: tempList.lastIndex(where: { item in
                item.id == id
            })!)
        }
        
        
        taskList.append(temp!)
        filterAndSort()
    }
}

