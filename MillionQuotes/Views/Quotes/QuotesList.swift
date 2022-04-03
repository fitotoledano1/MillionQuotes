//
//  QuotesList.swift
//  MillionQuotes
//
//  Created by Fito Toledano on 03/04/2022.
//

import SwiftUI

struct QuotesList: View {
    
    @StateObject private var viewModel = QuotesListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.searchResults) { quote in
                    QuoteRow(quote: quote)
                }
            }
            .refreshable { viewModel.getQuotes() }
            .searchable(text: $viewModel.searchText)
            .navigationTitle("Quotes")
        }
        .onAppear {
            viewModel.getQuotes()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesList()
    }
}
