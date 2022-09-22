//
//  ContentView.swift
//  InsulationCalculator
//
//  Created by Clancy Thomas on 9/13/22.
//

import SwiftUI
import UIKit


struct ContentView: View {
    @StateObject var atticQuoteOne = atticQuote()
    @StateObject var atticQuoteTwo = atticQuote()
    
    var body: some View {
            NavigationView {
                    VStack {
                        Spacer()
                        Text("Insulation Company")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                            .padding()
                        Spacer()
                        Image("insulation-logo")
                            .padding()
                        Spacer()
                        NavigationLink(destination: AtticQuoteInputPage(atticQuoteOne: atticQuoteOne, atticQuoteTwo: atticQuoteTwo)) {
                            HStack {
                                Text("Quote Calculator")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                                    .padding()
                                    }
                                Image(systemName: "chevron.forward")
                                    .padding(22)
                                    .font(.system(size: 30))
                                    .foregroundColor(.black)
                            }
                            .overlay{
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.black, lineWidth:4)
                        }
                        Spacer()
                    }
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
