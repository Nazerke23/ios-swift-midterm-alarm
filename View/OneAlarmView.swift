//
//  OneAlarmView.swift
//  midtermAlarm
//
//  Created by Назерке Кулан on 26.10.2021.
//

import SwiftUI

struct OneAlarmView: View {
    
    let alarm : AlarmModel
    @State var value:Bool = true
    
    var body: some View {
        HStack{
            Spacer()
            VStack(alignment: .leading, spacing: 5) {
                Text(alarm.time)
                    .fontWeight(.bold)
                Text(alarm.note)
            }
            Spacer()
            Toggle(isOn: $value, label: {
            }).padding()
            Spacer()
        }
    }
}

struct OneAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        OneAlarmView(alarm: AlarmModel(time: "05:50", note: "Good morning", isSET: true ))
    }
}
