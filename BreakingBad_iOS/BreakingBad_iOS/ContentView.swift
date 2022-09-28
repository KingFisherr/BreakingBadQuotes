//
//  ContentView.swift
//  BreakingBad_iOS
//
//  Created by Tahsin Provath on 9/27/22.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject private var API = API_Call()
    
    var body: some View {
        NavigationView {
            List(API.quotes, id: \.quote_id) { quote in
                VStack (alignment: .leading){
                    Text(quote.author)
                        .padding()
                    Text(quote.quote)
                        .padding()
                }
            }
            .navigationTitle("Breaking Bad Quotes")
            .task {
                await API.fetchQuotes()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
