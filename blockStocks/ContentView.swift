//
//  ContentView.swift
//  blockStocks
//
//  Created by Jeremy Barnes-Smith on 5/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var stockInfo = blockViewModel()
    @State private var showNoOffers = false
    @State private var isAnimating = false
    
    var body: some View {
        if stockInfo.stocks != nil && !showNoOffers {
            NavigationView {
                List(stockInfo.stocks ?? []) {stock in
                    NavigationLink {
                        DetailsView(stockName: stock.name, stockTicker: stock.ticker)
                    } label: {
                        HStack {
                            VStack {
                                Image(systemName: "star").resizable().frame(width: 40.0, height: 40.0)
                                    .foregroundColor(.blue)
                                    .symbolEffect(.variableColor.cumulative.dimInactiveLayers.nonReversing, options: .repeat(.continuous).speed(0.5), isActive: true)
                            }
                            VStack(alignment: .leading) {
                                if (stock.name.count > 14) {
                                    Text(stock.name.prefix(14) + "...")
                                } else {
                                    Text(stock.name)
                                }
                                
                                Text(stock.ticker)
                            }.truncationMode(.tail)
                            Spacer()
                            VStack(alignment: .trailing) {
                                Text(String(format:  "$%.2f", stock.currentPriceCents) + " " + stock.currency)
                                Text(stockInfo.getDate(input: stock.currentPriceTimestamp))
                                Text(String(stock.quantity ?? 0) + " units")
                            }
                        }
                    }
                }
                .navigationTitle("Block Stocks")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Show No Offers") {
                            showNoOffers.toggle()
                        }
                    }
                }
            }
        } else {
            VStack {
                Text("No Offers")
                Button("Show Offers") {
                    showNoOffers.toggle()
                }
            }
            .task {
                await stockInfo.fetchApiData()
            }
        }
      
    }
}

#Preview {
    ContentView()
}
