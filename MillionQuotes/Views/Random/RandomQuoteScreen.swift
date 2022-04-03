//
//  RandomQuote.swift
//  MillionQuotes
//
//  Created by Fito Toledano on 03/04/2022.
//

import SwiftUI
import Resolver

//struct RefreshToolbarItem: View {
//    let action: () -> Void
//
//    var body: some View {
//        ToolbarItem(placement: .confirmationAction) {
//            Button("Refresh") {
//                action
//            }
//        }
//    }
//}

struct RandomQuoteScreen: View {
    
    @StateObject private var viewModel = RandomQuoteViewModel()
    
    var body: some View {
        NavigationView {
            RandomQuote(quote: viewModel.quote)
                .navigationTitle("Random Quote")
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Refresh") {
                            viewModel.getRandomQuote()
                        }
                    }
                }
        }
        .onAppear {
            viewModel.getRandomQuote()
        }
    }
}

struct RandomQuoteScreen_Previews: PreviewProvider {
    static var previews: some View {
        RandomQuoteScreen()
    }
}
