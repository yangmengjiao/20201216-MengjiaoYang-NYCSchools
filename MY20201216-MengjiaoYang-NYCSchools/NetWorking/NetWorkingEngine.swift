//
//  NetWorkingEngine.swift
//  20201215-MengjiaoYang-NYCSchools
//
//  Created by mengjiao on 12/16/20.
//

import Foundation


class NetWorkingEngine {
    /// Executes web calls and decode the JSON response into Codeable objects
    /// - Parameters:
    ///     - endpoint: the endpoint to make HTTP request
    ///     - completion: the call back method
    class func request<T: Codable>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> ()) {
        // 1 configure url
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.baseURL
        components.path = endpoint.path
        
        guard let url = components.url else {
            return
        }
        
        // 2 configure request
        var urlRequst = URLRequest(url: url)
        urlRequst.httpMethod = endpoint.method
        
        // configure session and task
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequst) { data, response, error in
            guard error == nil else {
                completion(.failure(error!))
                print(error?.localizedDescription ?? "UNKnown Error")
                return
            }
            
            guard response != nil, let data = data else {
                print("no response")
                return
            }
            
            // 4 decode json, and callback
            DispatchQueue.main.async {
                if let responseObjects = try? JSONDecoder().decode(T.self, from: data) {
                    completion(.success(responseObjects))
                } else {
                    let error = NSError(domain: "", code: 200, userInfo: nil)
                    completion(.failure(error))
                }
            }
        }
        
        // 5 resume task
        dataTask.resume()
    }
}
