//
//  AlarmModel.swift
//  midtermAlarm
//
//  Created by Назерке Кулан on 26.10.2021.
//

import Foundation

struct AlarmModel: Identifiable, Codable {
    let id: String
    let time: String
    let note: String
    var isSET: Bool
    
    init(id: String = UUID().uuidString, time: String, note: String, isSET: Bool) {
        self.id = id
        self.time = time
        self.note = note
        self.isSET = isSET
    }
    
    func updateCompletion(newTime: String, newNote: String, newBool: Bool) -> AlarmModel {
        return AlarmModel(id: id, time: newTime, note: newNote, isSET: newBool)
    }
    
}

