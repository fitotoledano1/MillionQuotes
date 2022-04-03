//
//  QuotesListViewModel.swift
//  MillionQuotes
//
//  Created by Fito Toledano on 03/04/2022.
//

import SwiftUI
import Resolver

final class QuotesListViewModel: ObservableObject {
    @Published private(set) var quotes: [Quote] = []
    @Published var searchText = ""
    
    var searchResults: [Quote] {
        if searchText.isEmpty {
            return quotes
        } else {
            return quotes.filter {
                $0.content.lowercased().contains(searchText.lowercased()) || $0.author.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    private let repository: MillionQuotesRepository = Resolver.resolve()
    
    func getQuotes() {
        repository.getQuotes { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let quotes):
                DispatchQueue.main.async {
                    withAnimation {
                        self.quotes = quotes
                    }
                }
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
}
