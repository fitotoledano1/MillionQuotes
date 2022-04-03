//
//  RandomQuote.swift
//  MillionQuotes
//
//  Created by Fito Toledano on 03/04/2022.
//

import SwiftUI

struct RandomQuote: View {
    let quote: Quote?
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 8) {
            Text(quote?.content ?? "loading...").font(.largeTitle.weight(.thin))
            Text(quote?.author ?? "loading...").bold()
        }.padding()
    }
}

struct RandomQuote_Previews: PreviewProvider {
    static var previews: some View {
        RandomQuote(quote: nil)
    }
}
