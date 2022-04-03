//
//  MainTabView.swift
//  MillionQuotes
//
//  Created by Fito Toledano on 03/04/2022.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        TabView {
            QuotesList()
                .tabItem {
                    Label {
                        Text("All Quotes")
                    } icon: {
                        Image(systemName: "list.bullet.rectangle.portrait")
                    }
                }
            
            RandomQuoteScreen()
                .tabItem {
                    Label {
                        Text("Random")
                    } icon: {
                        Image(systemName: "pencil.and.outline")
                    }

                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
