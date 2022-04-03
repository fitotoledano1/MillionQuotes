//
//  QuotesListRepository.swift
//  MillionQuotes
//
//  Created by Fito Toledano on 03/04/2022.
//

import Foundation

final class MillionQuotesRepository {
    
    private let baseURL = "https://programming-quotes-api.herokuapp.com"
    
    enum Endpoint: String {
        case randomQuote = "/quotes/random"
        case allQuotes = "/quotes"
    }
    
    func getRandomQuote(completion: @escaping (Result<Quote, MQAPIError>) -> Void) {
        let endpoint = baseURL.appending(Endpoint.randomQuote.rawValue)
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil {
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.invalidData))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    let randomQuote = try decoder.decode(Quote.self, from: data)
                    completion(.success(randomQuote))
                } catch let error {
                    print(error.localizedDescription)
                    completion(.failure(.unableToComplete))
                }

            } else {
                print(error?.localizedDescription ?? "Something went wrong.")
                completion(.failure(.unableToComplete))
            }
        }
        task.resume()
    }
    
    func getQuotes(completion: @escaping (Result<[Quote], MQAPIError>) -> Void) {
        let endpoint = baseURL.appending(Endpoint.allQuotes.rawValue)
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil {
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completion(.failure(.invalidResponse))
                    return
                }

                guard let data = data else {
                    completion(.failure(.invalidData))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    let quotes = try decoder.decode([Quote].self, from: data)
                    completion(.success(quotes))
                } catch let error {
                    print(error.localizedDescription)
                    completion(.failure(.unableToComplete))
                }

            } else {
                print(error?.localizedDescription ?? "Something went wrong.")
                completion(.failure(.unableToComplete))
            }
        }
        task.resume()
    }
}
