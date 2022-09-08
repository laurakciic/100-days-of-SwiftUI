//
//  ContentView.swift
//  04_BetterRest
//
//  Created by Laura on 08.09.2022..
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmout = 1
    
    static var defaultWakeTime: Date {
        
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("When do you want to wake up?").font(.subheadline)) {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                Section(header: Text("Desired amount of sleep").font(.subheadline)) {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section(header: Text("Daily coffee intake").font(.subheadline)) {
//                    Picker("Select amount", selection: $coffeeAmout) {
//                        ForEach(1...20, id: \.self) { amount in
//                            Text("\(amount) \(amount == 1 ? "cup" : "cups")")
//                        }
//                    }
                    Stepper(coffeeAmout == 1 ? "1 cup" : "\(coffeeAmout) cups", value: $coffeeAmout, in: 1...20)
                }
                                
                Section(header: Text("Recommended bedtime").font(.headline)) {
                    Text(calculateBedtime)
                }
            }
            .navigationTitle("BetterRest")
        }
    }
    
    private var calculateBedtime: String {
        let bedTime: String
        
        do {
            let config = MLModelConfiguration()
            let model  = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour       = (components.hour ?? 0)   * 60 * 60
            let minute     = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmout))
            
            let sleepTime  = wakeUp - prediction.actualSleep
            
            bedTime = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
           bedTime = "Error calculating bedtime"
        }
        
        return bedTime
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
