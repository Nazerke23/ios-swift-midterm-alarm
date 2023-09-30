//
//  ContentView.swift
//  midtermAlarm
//
//  Created by Назерке Кулан on 26.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var alarmController : AlarmController
    
    
    var body: some View {
        List {
            ForEach(alarmController.alarms){ alarm in
                NavigationLink(
                    destination: ChangeAlarmView(alarm: alarm),
                    label: {
                        OneAlarmView(alarm: alarm)
                    })
            }
            .onDelete(perform: alarmController.deleteAlarm)
            .onMove(perform: alarmController.moveAlarm)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("My Alarms ")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("➕", destination: AddAlarmView())
            )
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }
        .environmentObject(AlarmController())
    }
}
