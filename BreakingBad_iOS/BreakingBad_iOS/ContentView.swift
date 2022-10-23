//
//  ContentView.swift
//  BreakingBad_iOS
//
//  Created by Tahsin Provath on 9/27/22.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject private var API = API_Call()
    @StateObject private var Net1 = Network()
    //var quotesarr: [Quotes] = API.quotes
    //@State var searchquotes = ""
    
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
                //await Net1.fetchFlights()
            }
            .task{
                await Net1.fetchFlights()
            }
        }
    }
    // Filter videos array which we populated then use the result for the list view
//    var filtered_quotes: [Quotes]{
//
//        if API.quotes.isEmpty{
//            return API.quotes
//        } else{
//            return API.quotes.filter {$0.quote.localizedCaseInsensitiveContains(searchquotes)}
//        }
//
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
