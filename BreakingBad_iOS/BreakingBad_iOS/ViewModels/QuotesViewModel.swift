//
//  QuotesViewModel.swift
//  BreakingBad_iOS
//
//  Created by Tahsin Provath on 9/27/22.
//

import Foundation

class API_Call: ObservableObject{

    // Array holds value fetched from API
    @Published var quotes = [Quotes]()
    
    // Create method to fetch data from api
    func fetchQuotes() async{
        
        // url
        let urlString = "https://www.breakingbadapi.com/api/quotes"
        
        guard let url = URL(string: urlString) else{
            print ("Error: Could not create a URL from \(urlString)")
            return
        }
        
        // Create url session
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Decode data
            if let decodedresponse = try? JSONDecoder().decode([Quotes].self, from: data){
                quotes = decodedresponse
            }
        }
        catch{
            print ("JSON Error: \(error.localizedDescription)")
        }
    }
    
    
}
