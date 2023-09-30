//
//  AlarmController.swift
//  midtermAlarm
//
//  Created by Назерке Кулан on 26.10.2021.
//

import Foundation

class AlarmController: ObservableObject {
    
    @Published var alarms: [AlarmModel] = []
    
//    let itemsKey: String = "items_list"
    
    init() {
        getAlarms()
    }
    
    func getAlarms() {
   
        let alarms2: [AlarmModel] = [
                AlarmModel(time: "05:45", note: "Time to wake up", isSET: true),
                AlarmModel(time: "08:45", note: "Breakfast", isSET: false),
                AlarmModel(time: "11:45", note: "Good afternoon", isSET: true)
                ]

        alarms.append(contentsOf: alarms2)
    }
    
    func deleteAlarm(indexSet: IndexSet) {
        alarms.remove(atOffsets: indexSet)
    }
//
    func moveAlarm(from: IndexSet, to: Int) {
        alarms.move(fromOffsets: from, toOffset: to)
    }
//
    func addAlarm(time: String, note: String, isSET: Bool) {
        let newAlarm = AlarmModel(time: time, note: note, isSET: isSET)
        alarms.append(newAlarm)
    }

//
    func changeAlarm(alarm: AlarmModel, newTime: String, newNote: String, newBool: Bool) {
        if let index = alarms.firstIndex(where: { $0.id == alarm.id }) {
            alarms[index] = alarm.updateCompletion(newTime: newTime, newNote: newNote, newBool: newBool)
        }
    }
    
//    func saveItems() {
//        if let encodedData = try? JSONEncoder().encode(contacts) {
//            UserDefaults.standard.set(encodedData, forKey: itemsKey)
//        }
//    }
    
}


