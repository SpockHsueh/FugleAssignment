//
//  GetCategoriesWithCompanyService.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/2/28.
//

import Foundation

enum GetCategoriesWithCompanyError: Error {
    case invalidURL
    case missingData
    case unexpectedError(error: String)
}

protocol GetCategoriesWithCompanyServiceProtocol {
    static func getCategories(completion: @escaping (Result<[CategoriesModel], GetCategoriesWithCompanyError>) -> Void)
}

struct GetCategoriesWithCompanyService: GetCategoriesWithCompanyServiceProtocol {
    static func getCategories(completion: @escaping (Result<[CategoriesModel], GetCategoriesWithCompanyError>) -> Void) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "openapi.twse.com.tw"
        components.path = "/v1/opendata/t187ap03_P"
        
        guard let url = components.url else {
            DispatchQueue.main.async {
                completion(.failure(GetCategoriesWithCompanyError.invalidURL))
            }
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(GetCategoriesWithCompanyError.unexpectedError(error: error.localizedDescription)))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(GetCategoriesWithCompanyError.missingData))
                }
                return
            }
            
            let response = response as! HTTPURLResponse
            let status = response.statusCode
            
            guard (200...299).contains(status) else {
                
                if let errorJson = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? Dictionary<String,Any> {
                    DispatchQueue.main.async {
                        completion(.failure(GetCategoriesWithCompanyError.unexpectedError(error: errorJson.description )))
                    }
                }
                return
            }
            
            do {
                let listResult = try JSONDecoder().decode([CategoriesModel].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(listResult))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(GetCategoriesWithCompanyError.unexpectedError(error: error.localizedDescription)))
                }
            }
            
        }.resume()
    }
}
