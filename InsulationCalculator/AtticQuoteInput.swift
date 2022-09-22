//
//  AtticQuoteInput.swift
//  InsulationCalculator
//
//  Created by Clancy Thomas on 9/13/22.

import SwiftUI


struct AtticQuoteInputPage: View {
    @ObservedObject var atticQuoteOne: atticQuote
    @ObservedObject var atticQuoteTwo: atticQuote
    
    @FocusState private var focus: Bool
    @State private var isEditingAdmin = false
    @State private var isEditing = false
    
    @State var squareFootageString = ""
    
    var body: some View {
        Form {
            // This section is required data and general data is used for both quotes - General Information
            Section {
                HStack {
                    Text("General Info")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }
                HStack {
                    Text("Square Footage:")
                        .fontWeight(.medium)
                    TextField("Required", text: $squareFootageString)
                        .keyboardType(.decimalPad)
                        .focused($focus)
                }
                HStack {
                    Text("Admin: $\(atticQuoteOne.adminFee, specifier: "%.0f")")
                        .fontWeight(.medium)
                    Spacer()
                    Slider(
                        value: $atticQuoteOne.adminFee,
                        in: 0...10,
                        step: 2
                    ) {
                        Text("Admin Fee")
                    } minimumValueLabel: {
                        Text("| $0")
                    } maximumValueLabel: {
                        Text("$10")
                    } onEditingChanged: { editing in
                        isEditingAdmin = editing
                    }
                    Spacer()
                }
                Toggle(isOn: $atticQuoteOne.baffles) {
                    HStack {
                        Text("Baffles")
                            .fontWeight(.medium)
                        Spacer()
                        atticQuoteOne.baffles ? Text("Yes") : Text("No")
                    }
                }
                Toggle(isOn: $atticQuoteOne.airSeal) {
                    HStack {
                        Text("Air Sealing")
                            .fontWeight(.medium)
                        Spacer()
                        atticQuoteOne.airSeal ? Text("Yes") : Text("No")
                    }
                }
            }
            
            // This section is data for only Quote 1
            Section {
                HStack {
                    Text("Quote 1")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }
                HStack {
                    Text("Add R-\(atticQuoteOne.rValue, specifier: "%.0f")")
                    Spacer()
                    Slider(
                        value: $atticQuoteOne.rValue,
                        in: 0...60,
                        step: 10
                    ) {
                        Text("R-Value")
                    } minimumValueLabel: {
                        Text("| R0")
                    } maximumValueLabel: {
                        Text("R60")
                    } onEditingChanged: { editing in
                        isEditing = editing
                    }
                    Spacer()
                }
                Stepper("Solar Fan: \(atticQuoteOne.solarFan)", value: $atticQuoteOne.solarFan, in: 0...5, step: 1)
                Stepper("Exhaust Fans: \(atticQuoteOne.exhaustFan)", value: $atticQuoteOne.exhaustFan, in: 0...20, step: 1)
                Stepper("Recess Light Covers: \(atticQuoteOne.recessLightCovers)", value: $atticQuoteOne.recessLightCovers, in: 0...50, step: 1)
                Stepper("CO Dectectors: \(atticQuoteOne.coDetector)", value: $atticQuoteOne.coDetector, in: 0...10, step: 1)
                Stepper("Indoor Attic Entrance: \(atticQuoteOne.indoorAtticEntrance)", value: $atticQuoteOne.indoorAtticEntrance, in: 0...5, step: 1)
            }
            
            // This section is data for only Quote 2
            Section {
                HStack {
                    Text("Quote 2")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }
                HStack {
                    Text("Add R-\(atticQuoteTwo.rValue, specifier: "%.0f")")
                    Spacer()
                    Slider(
                        value: $atticQuoteTwo.rValue,
                        in: 0...60,
                        step: 10
                    ) {
                        Text("R-Value")
                    } minimumValueLabel: {
                        Text("| R0")
                    } maximumValueLabel: {
                        Text("R60")
                    } onEditingChanged: { editing in
                        isEditing = editing
                    }
                    Spacer()
                }
                Stepper("Solar Fan: \(atticQuoteTwo.solarFan)", value: $atticQuoteTwo.solarFan, in: 0...5, step: 1)
                Stepper("Exhaust Fans: \(atticQuoteTwo.exhaustFan)", value: $atticQuoteTwo.exhaustFan, in: 0...20, step: 1)
                Stepper("Recess Light Covers: \(atticQuoteTwo.recessLightCovers)", value: $atticQuoteTwo.recessLightCovers, in: 0...50, step: 1)
                Stepper("CO Dectectors: \(atticQuoteTwo.coDetector)", value: $atticQuoteTwo.coDetector, in: 0...10, step: 1)
                Stepper("Indoor Attic Entrance: \(atticQuoteTwo.indoorAtticEntrance)", value: $atticQuoteTwo.indoorAtticEntrance, in: 0...5, step: 1)
                }
                NavigationLink(destination: AtticQuoteVerifyInputPage(atticQuoteOne: atticQuoteOne, atticQuoteTwo: atticQuoteTwo)) {
                    Text("Verify Input")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(Color.black)
                }
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard){
                Spacer()
                Button("Done") {
                    focus = false
                    atticQuoteOne.squareFootage = (Int(squareFootageString) ?? 0)
                }
            }
            ToolbarItemGroup(placement: .navigationBarTrailing){
                Spacer()
                Button("Clear") {
                    atticQuoteOne.resetQuote();
                    atticQuoteTwo.resetQuote();
                    squareFootageString = "";
                
                }
            }
        }
    }
}



struct CalculatorEntry_Previews: PreviewProvider {
    static var previews: some View {
        AtticQuoteInputPage(atticQuoteOne: atticQuote(), atticQuoteTwo: atticQuote())
    }
}



