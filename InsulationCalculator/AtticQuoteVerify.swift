//
//  AtticQuoteVerify.swift
//  InsulationCalculator
//
//  Created by Clancy Thomas on 9/13/22.
//

import SwiftUI

struct AtticQuoteVerifyInputPage: View {
    @ObservedObject var atticQuoteOne: atticQuote
    @ObservedObject var atticQuoteTwo: atticQuote
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("General Info")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }
                Text("Square Footage: \(atticQuoteOne.squareFootage)")
                Text("Admin Fee: $\(atticQuoteOne.adminFee, specifier: "%.0f")")
                Group {
                    atticQuoteOne.baffles ? Text("Baffles: Yes") : Text("Baffles: No")
                    atticQuoteOne.airSeal ? Text("Air Sealing: Yes") : Text("Air Sealing: No")
                }
            }
            Section {
                HStack {
                    Text("Quote 1")
                        .font(.title2)
                        .fontWeight(.bold)
                        .onAppear {
                            atticQuoteOne.calculateTotalQuote()
                        }
                    Spacer()
                }
                Text("Adding R-Value: R-\(atticQuoteOne.rValue, specifier: "%.0f")")
                Text("Solar Fan: \(atticQuoteOne.solarFan)")
                Text("Exhaust Fan: \(atticQuoteOne.exhaustFan)")
                Text("Recess Light Covers: \(atticQuoteOne.recessLightCovers)")
                Text("CO Detectors: \(atticQuoteOne.coDetector)")
                Text("Indoor Attic Entrance: \(atticQuoteOne.indoorAtticEntrance)")
            }
            Section {
                HStack {
                    Text("Quote 2")
                        .font(.title2)
                        .fontWeight(.bold)
                        .onAppear {
                            // These values are the same for both quotes - Make them the same when this view appears
                            atticQuoteTwo.squareFootage = atticQuoteOne.squareFootage
                            atticQuoteTwo.adminFee = atticQuoteOne.adminFee
                            atticQuoteTwo.baffles = atticQuoteOne.baffles
                            atticQuoteTwo.airSeal = atticQuoteOne.airSeal
                            atticQuoteTwo.calculateTotalQuote()
                        }
                    Spacer()
                }
                Text("Adding R-Value: R-\(atticQuoteTwo.rValue, specifier: "%.0f")")
                Text("Solar Fan: \(atticQuoteTwo.solarFan)")
                Text("Exhaust Fan: \(atticQuoteTwo.exhaustFan)")
                Text("Recess Light Covers: \(atticQuoteTwo.recessLightCovers)")
                Text("CO Detectors: \(atticQuoteTwo.coDetector)")
                Text("Indoor Attic Entrance: \(atticQuoteTwo.indoorAtticEntrance)")
            }
            NavigationLink(destination: AtticQuoteOutputPage(atticQuoteOne: atticQuoteOne, atticQuoteTwo: atticQuoteTwo)) {
                Text("Calculate Now")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .padding()
            }
        }
    }
}

struct VerifyInputPage_Previews: PreviewProvider {
    static var previews: some View {
        AtticQuoteVerifyInputPage(atticQuoteOne: atticQuote(), atticQuoteTwo: atticQuote())
    }
}

