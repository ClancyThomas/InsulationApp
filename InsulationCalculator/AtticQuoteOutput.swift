//
//  AtticQuoteOutput.swift
//  InsulationCalculator
//
//  Created by Clancy Thomas on 9/13/22.
//

import SwiftUI

struct AtticQuoteOutputPage: View {
    @ObservedObject var atticQuoteOne: atticQuote
    @ObservedObject var atticQuoteTwo: atticQuote
    
    @FocusState private var focus: Bool
    
    @State var instantRebate = ""
    @State var otherRebate = ""
    @State var taxCredit = ""
    @State var costAtInstall = 0.00
    
    @State var instantRebateTwo = ""
    @State var otherRebateTwo = ""
    @State var taxCreditTwo = ""
    @State var costAtInstallTwo = 0.00
    
    var body: some View {
        Form {
            Section {
                Group {
                    HStack {
                        Text("Quote 1")
                            .font(.title2)
                            .fontWeight(.bold)
                            .onAppear {
                                atticQuoteOne.calculateTotalQuote()
                            }
                        Spacer()
                    
                    }
                    if (atticQuoteOne.squareFootage != 0) { // Only show all the costs if the square footage isn't zero
                        Text("Original Cost: $\(atticQuoteOne.totalCost, specifier: "%.2f")")
                            .font(.title3)
                            .fontWeight(.bold)
                        if (atticQuoteOne.airSeal == true) {
                            Text("Air Sealing Discount: $\(atticQuoteOne.airSealDiscount, specifier: "%.2f")")
                        } else {
                            Text("Air Sealing Discount: $0.00")
                        }
                        if (atticQuoteOne.baffles == true) {
                            Text("Ventilation Discount: $\(atticQuoteOne.bafflesPrice, specifier: "%.2f")")
                        } else {
                            Text("Ventilation Discount: $0.00")
                        }
                    } else { // Cost should be 0.00 if there isn't any square footage
                        Text("Original Cost: $\(atticQuoteOne.totalCost*0, specifier: "%.2f")")
                            .font(.title3)
                            .fontWeight(.bold)
                        Text("Air Sealing Discount: $\(atticQuoteOne.airSealDiscount*0, specifier: "%.2f")")
                        Text("Ventilation Discount: $\(atticQuoteOne.bafflesPrice*0, specifier: "%.2f")")
                    }
                    HStack {
                        Text("Instant Rebate: $")
                            .fontWeight(.medium)
                        TextField("Optional", text: $instantRebate)
                                .keyboardType(.decimalPad)
                                .focused($focus)
                        }
                    
                    Text("Cost at Install: $\(costAtInstall - (Double(instantRebate) ?? 0), specifier: "%.2f")")
                        .fontWeight(.bold)
                        .font(.title3)
                        .onAppear {
                            costAtInstall = atticQuoteOne.subCost
                    }
                Group {
                    HStack {
                        Text("Tax Credit: $")
                            .fontWeight(.medium)
                        TextField("Optional", text: $taxCredit)
                            .keyboardType(.decimalPad)
                            .focused($focus)
                    }
                    HStack {
                        Text("Other Rebate: $")
                            .fontWeight(.medium)
                        TextField("Optional", text: $otherRebate)
                                .keyboardType(.decimalPad)
                                .focused($focus)
                        }
                    }
                }
                    Text("Total Investment: $\(costAtInstall-(Double(instantRebate) ?? 0)-(Double(otherRebate) ?? 0)-(Double(taxCredit) ?? 0), specifier: "%.2f")")
                        .fontWeight(.bold)
                        .font(.title3)
                }
            
            
            
            Section {
                Group {
                    HStack {
                        Text("Quote 2")
                            .font(.title2)
                            .fontWeight(.bold)
                            .onAppear {
                                atticQuoteTwo.calculateTotalQuote()
                            }
                        Spacer()
                    
                    }
                    if (atticQuoteTwo.squareFootage != 0) { // Only show all the costs if the square footage isn't zero
                        Text("Original Cost: $\(atticQuoteTwo.totalCost, specifier: "%.2f")")
                            .font(.title3)
                            .fontWeight(.bold)
                        if (atticQuoteTwo.airSeal == true) {
                            Text("Air Sealing Discount: $\(atticQuoteTwo.airSealDiscount, specifier: "%.2f")")
                        } else {
                            Text("Air Sealing Discount: $0.00")
                        }
                        if (atticQuoteTwo.baffles == true) {
                            Text("Ventilation Discount: $\(atticQuoteTwo.bafflesPrice, specifier: "%.2f")")
                        } else {
                            Text("Ventilation Discount: $0.00")
                        }
                    } else {  // Cost should be 0.00 if the square footage is zero
                        Text("Original Cost: $\(atticQuoteTwo.totalCost*0, specifier: "%.2f")")
                            .font(.title3)
                            .fontWeight(.bold)
                        Text("Air Sealing Discount: $\(atticQuoteTwo.airSealDiscount*0, specifier: "%.2f")")
                        Text("Ventilation Discount: $\(atticQuoteTwo.bafflesPrice*0, specifier: "%.2f")")
                    }
                        HStack {
                        Text("Instant Rebate: $")
                            .fontWeight(.medium)
                        TextField("Optional", text: $instantRebateTwo)
                                .keyboardType(.decimalPad)
                                .focused($focus)
                        }
                    
                    Text("Cost at Install: $\(costAtInstallTwo - (Double(instantRebateTwo) ?? 0), specifier: "%.2f")")
                        .fontWeight(.bold)
                        .font(.title3)
                        .onAppear {
                            costAtInstallTwo = atticQuoteTwo.subCost
                    }
                Group {
                    HStack {
                        Text("Tax Credit: $")
                            .fontWeight(.medium)
                        TextField("Optional", text: $taxCreditTwo)
                            .keyboardType(.decimalPad)
                            .focused($focus)
                    }
                    HStack {
                        Text("Other Rebate: $")
                            .fontWeight(.medium)
                        TextField("Optional", text: $otherRebateTwo)
                            .keyboardType(.decimalPad)
                            .focused($focus)
                        }
                    }
                }
                Text("Total Investment: $\(costAtInstallTwo-(Double(instantRebateTwo) ?? 0)-(Double(otherRebateTwo) ?? 0)-(Double(taxCreditTwo) ?? 0), specifier: "%.2f")")
                    .fontWeight(.bold)
                    .font(.title3)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done") {
                        focus = false
                    }
                }
            }
        }
}

struct QuotePage_Previews: PreviewProvider {
    static var previews: some View {
        AtticQuoteOutputPage(atticQuoteOne: atticQuote(), atticQuoteTwo: atticQuote())
    }
}
