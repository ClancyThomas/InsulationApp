//
//  AtticQuoteObject.swift
//  InsulationCalculator
//
//  Created by Clancy Thomas on 9/13/22.
//

import Foundation

class atticQuote: ObservableObject {
    @Published var totalCost = 0.00
    @Published var subCost = 0.00
    
    //
    // Variables for gathering the data about the attic quote
    //
    @Published var adminFee: Double = 0
    @Published var squareFootage = 0
    @Published var rValue: Double = 0
    @Published var baffles = false
    @Published var airSeal = false
    @Published var solarFan = 0
    @Published var exhaustFan = 0
    @Published var recessLightCovers = 0
    @Published var coDetector = 0
    @Published var indoorAtticEntrance = 0
    
    @Published var airSealDiscount = 0.00
    
    //
    // Prices used for calculating attic quote cost
    // ** [INSERT YOUR PRICES HERE] **
    //
    let rValuePriceTen = 0.01
    let rValuePriceTwenty = 0.02
    let rValuePriceThirty = 0.03
    let rValuePriceFourty = 0.04
    let rValuePriceFifty = 0.05
    let rValuePriceSixty = 0.06
    let airSealPrice = 0.01
    let bafflesPrice = 0.10
    let solarFanPrice = 1.0
    let exhaustFanPrice = 0.1
    let recessLightPrice = 0.1
    let coDetectorPrice = 0.1
    let indoorAtticEntrancePrice = 0.1
    let techFee = 5.0
    
    //
    // Functions for calculating the cost of the quote
    //
    func calculateBaseCost() -> Double {
        var cost: Double = 0.00
        
    
        if rValue == 10 {
            cost = Double(squareFootage) * rValuePriceTen
        }
        else if rValue == 20 {
            cost = Double(squareFootage) * rValuePriceTwenty
        }
        else if rValue == 30 {
            cost = Double(squareFootage) * rValuePriceThirty
        }
        else if rValue == 40 {
            cost = Double(squareFootage) * rValuePriceFourty
        }
        else if rValue == 50 {
            cost = Double(squareFootage) * rValuePriceFifty
        }
        else if rValue == 60 {
            cost = Double(squareFootage) * rValuePriceSixty
        }
        
        return cost
        
    }
    
    func calculateAirSeal() -> Double {
        var cost: Double = 0.00
        
        if airSeal == true {
            cost = Double(squareFootage) * airSealPrice
        }
        
        return cost
    }
    
    func calculateEssentials(unit: Bool, price: Double) -> Double {
        var cost = 0.00
        let unitPrice = price
        
        if unit == true {
            cost = unitPrice
        }
        
        return cost
    }
    
    func calculateAdditional(unit: Int, price: Double) -> Double {
        var cost = 0.00
        let unitPrice = price
        
        if unit > 0 {
            cost = unitPrice * Double(unit)
        }

        return cost
    }
    
    func calculateTotalQuote() -> Void {
        totalCost = 0.00
        var cost = 0.00
        var discounts = 0.00
        
        if (squareFootage != 0) {
            cost += adminFee
            cost += techFee
            
            cost += calculateBaseCost()
            cost += calculateAirSeal()
            
            cost += calculateEssentials(unit: baffles, price: bafflesPrice)
            
            cost += calculateAdditional(unit: solarFan, price: solarFanPrice)
            cost += calculateAdditional(unit: exhaustFan, price: exhaustFanPrice)
            cost += calculateAdditional(unit: recessLightCovers, price: recessLightPrice)
            cost += calculateAdditional(unit: coDetector, price: coDetectorPrice)
            cost += calculateAdditional(unit: indoorAtticEntrance, price: indoorAtticEntrancePrice)
            
            // Discounts are half the price of Air Sealing and Baffles Price
            airSealDiscount = calculateAirSeal()/2
            if (airSeal == true) {
                discounts += airSealDiscount
            }
            if (baffles == true) {
                discounts += bafflesPrice
            }
            
            totalCost = cost
            subCost = totalCost - discounts
        }
    }
  
    func resetQuote() -> Void {
        adminFee = 0;
        squareFootage = 0;
        rValue = 0;
        baffles = false;
        airSeal = false;
        solarFan = 0;
        exhaustFan = 0;
        recessLightCovers = 0;
        coDetector = 0;
        indoorAtticEntrance = 0;
        totalCost = 0;
        subCost = 0;
        airSealDiscount = 0;
    }
}
