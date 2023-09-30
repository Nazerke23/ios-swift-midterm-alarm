//
//  midtermAlarmApp.swift
//  midtermAlarm
//
//  Created by Назерке Кулан on 26.10.2021.
//

import SwiftUI

@main
struct midtermAlarmApp: App {
    
    @StateObject var alarmController: AlarmController = AlarmController()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }
            .environmentObject(alarmController)
        }

    }
}
