//
//  QuotesViewModel.swift
//  BreakingBad_iOS
//
//  Created by Tahsin Provath on 9/27/22.
//

import Foundation

@MainActor class API_Call: ObservableObject{

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

class Network: ObservableObject{
    
    // Array to hold data
    @Published var Flights = [FlightData]()



    // create method to fetch data (GET REQUEST HTTP)

    func fetchFlights() async{

        let urlString = "http://api.aviationstack.com/v1/flights?access_key=cde5ef4127732deac540fab1f43d233c"
        
        guard let url = URL(string: urlString) else{
            print ("Error: Could not create a URL from \(urlString)")
            return
        }

        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in

            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                print(response.statusCode)
            }

            if let error = error {
                print (error.localizedDescription)
            }

            if let data = data,
               let file = String(data: data, encoding: .utf8){
                print (file)
            }

        }
        dataTask.resume()
    }
}
