//
//  MQAPIError.swift
//  MillionQuotes
//
//  Created by Fito Toledano on 03/04/2022.
//

import Foundation

enum MQAPIError: String, Error {
    case invalidURL = "The requested URL was invalid."
    case invalidResponse = "The response received from the server was invalid."
    case invalidData = "The data received from the sever was invalid."
    case unableToComplete = "Unable to complete operation. Something went wrong."
}
