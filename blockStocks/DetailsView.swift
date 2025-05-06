//
//  DetailsView.swift
//  blockStocks
//
//  Created by Jeremy Barnes-Smith on 5/5/25.
//

import SwiftUI

struct DetailsView: View {
    var stockName: String
    var stockTicker: String
    var body: some View {
        VStack {
            Text(stockName)
            Text(stockTicker)
            Text("Information about the stock will go here!")
        }
    }
}

#Preview {
    DetailsView(stockName: "Twitter", stockTicker: "TWIT")
}
