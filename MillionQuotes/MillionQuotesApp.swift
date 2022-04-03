//
//  MillionQuotesApp.swift
//  MillionQuotes
//
//  Created by Fito Toledano on 03/04/2022.
//

import SwiftUI
import Resolver

@main
struct MillionQuotesApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { MillionQuotesRepository() as MillionQuotesRepository }.scope(.application)
    }
}
