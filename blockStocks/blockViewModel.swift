//
//  blockViewModel.swift
//  blockStocks
//
//  Created by Jeremy Barnes-Smith on 5/5/25.
//

import Foundation

@Observable
class blockViewModel {
    var stocks: [StocksModel]?
    
    func fetchApiData() async {
        let url = URL(string: "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio.json")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let responses = try JSONDecoder().decode(Response.self, from: data)
            print("these are my results from the api callss")
            print(responses.stocks)
            self.stocks = responses.stocks
        } catch let error {
            print("some error happened \(error)")
        }
    }
    
    func getDate(input: Double) -> String {
        let date = Date(timeIntervalSince1970: input)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/YY"
        return dateFormatter.string(from: date)
    }
}
