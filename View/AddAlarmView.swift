//
//  AddAlarmView.swift
//  midtermAlarm
//
//  Created by Назерке Кулан on 26.10.2021.
//

import SwiftUI

struct AddAlarmView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var alarmController: AlarmController
    
    @State var textFieldNote: String = ""
    @State var currentTime = Date()
    let dateFormatter = DateFormatter()
   
    
    
    var body: some View {
        
        ScrollView {
            VStack {
                
                DatePicker("k",
                           selection: $currentTime,
                           displayedComponents:
                            .hourAndMinute)
                    .labelsHidden()
                    .frame(height: 55)
                
                
              
                TextField("The note", text: $textFieldNote)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
               
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
                
                
            }
            .padding(14)
        }
        .navigationTitle("Add new alarm 😊")
    }
    
    
    
    //func
    func saveButtonPressed() {
 
        let hour = Calendar.current.component(.hour, from: currentTime)
        let minute = Calendar.current.component(.minute, from: currentTime)

        let timeString = String(hour) + ":" + String(minute)
        

        alarmController.addAlarm(time:timeString, note: textFieldNote, isSET: true)
        //go back to mode
        presentationMode.wrappedValue.dismiss()
    }
}



struct AddAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddAlarmView()
        }
        .environmentObject(AlarmController())
    }
}
