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
