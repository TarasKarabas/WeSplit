//
//  ContentView.swift
//  WeSplit
//
//  Created by Taras Kyparenko on 27/3/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    private let currency = FloatingPointFormatStyle<Double>.Currency(code: "USD")
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)
        let amount = Double(checkAmount)
        let tipValue = checkAmount / 100 * tipSelection
        let total = tipValue + amount
        
        return total
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: currency)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Nomber of people", selection: $numberOfPeople) {
                        ForEach(2..<11) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("TIP percentage")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(maxHeight: 100)
                }
                
                Section(header: Text("Total amount with tips")) {
                    Text(totalAmount, format: currency)
                        .foregroundColor(tipPercentage == 0 ? .red : .black)
                }
                
                Section(header: Text("Amount per person")) {
                    Text(totalPerPerson, format: currency)
                }
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.inline)
            .headerProminence(.increased)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") { amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//    @State private var name = ""
//    var body: some View {
//        Form {
//            TextField("Enter your name", text: $name)
//            Text("Hello, World!")
//        }
//    @State private var tapCount = 0
//    var body: some View {
//        Button("Tap Button \(tapCount)") {
//            tapCount += 1
//        }

//        NavigationView {
//            Form {
//                Section {
//                    Text("Hello world!")
////                    Text("Hello world!")
////                    Text("Hello world!")
////                    Text("Hello world!")
////                    Text("Hello world!")
//                }
////                Section {
////                    Text("Hello world!")
////                    Text("Hello world!")
////                    Text("Hello world!")
////                    Text("Hello world!")
////                    Text("Hello world!")
////                }
//            }
//            .navigationBarTitle("SwiftUI")
//            .navigationBarTitleDisplayMode(.inline)
//        }
