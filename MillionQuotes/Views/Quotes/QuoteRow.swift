//
//  QuoteRow.swift
//  MillionQuotes
//
//  Created by Fito Toledano on 03/04/2022.
//

import SwiftUI

struct QuoteRow: View {
    let quote: Quote
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(quote.author).bold()
            Text(quote.content)
        }.padding()
    }
}

struct QuoteRow_Previews: PreviewProvider {
    static var previews: some View {
        Text("Quote")
    }
}
