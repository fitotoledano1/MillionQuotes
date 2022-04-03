//
//  RandomQuoteViewModel.swift
//  MillionQuotes
//
//  Created by Fito Toledano on 03/04/2022.
//

import Foundation
import Resolver

final class RandomQuoteViewModel: ObservableObject {
    @Published var quote: Quote?
    
    private let repository: MillionQuotesRepository = Resolver.resolve()
    
    func getRandomQuote() {
        repository.getRandomQuote { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let quote):
                DispatchQueue.main.async { self.quote = quote }
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
}
