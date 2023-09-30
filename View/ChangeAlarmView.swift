//
//  ChangeAlarmView.swift
//  midtermAlarm
//
//  Created by Назерке Кулан on 26.10.2021.
//

import SwiftUI

struct ChangeAlarmView: View {
    let alarm : AlarmModel
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var alarmController: AlarmController
    @State var currentTime = Date()
    @State var textFieldNote: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                
                DatePicker("k",
                           selection: $currentTime,
                           displayedComponents:
                            .hourAndMinute)
                    .labelsHidden()
                    .frame(height: 55)
                
                
              
                TextField(alarm.note, text: $textFieldNote )
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
               
                Button(action: changeButtonPressed, label: {
                    Text("Change".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }).padding(.bottom)
                
                Button(action: deleteButtonPressed, label: {
                    Text("Delete".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                })
                
                
            }
            .padding(14)
        }
        .navigationTitle("Add new alarm 😊")
    }
    
    
    
    //func
    func changeButtonPressed() {
        let hour = Calendar.current.component(.hour, from: currentTime)
        let minute = Calendar.current.component(.minute, from: currentTime)

        let timeString = String(hour) + ":" + String(minute)

        alarmController.changeAlarm(alarm: alarm, newTime: timeString, newNote: textFieldNote, newBool: alarm.isSET)
        
        //go back to mode
        presentationMode.wrappedValue.dismiss()
    }
    
    
    func deleteButtonPressed() {
       
        presentationMode.wrappedValue.dismiss()
    }
    
    
}

struct ChangeAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeAlarmView(alarm: AlarmModel(time: "05:50", note: "Good morning", isSET: true ))
    }
}
