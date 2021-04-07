//
//  NetworkService.swift
//  Perich_PZ_tinkoff_laba
//
//  Created by Petar Perich on 30.01.2021.
//

import Foundation

class NetworkService {
    static func loadStocks(completion: @escaping ([Stocks], Error?)-> Void){
        guard let url = URL(string: "https://api.jsonbin.io/b/6014a3ebb41a937c6d5408e8/6") else {
            let error = NSError(domain: "Invalid URL", code: 1111, userInfo: nil)
            completion([], error)
            return
        }
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                DispatchQueue.main.async {
                    completion([], error)
                }
                return
            }
            let response = response as! HTTPURLResponse
            guard let data = data else {
                let error = NSError(domain: "no data. response status code: \(response.statusCode)", code: response.statusCode, userInfo: nil)
                DispatchQueue.main.async {
                    completion([],error)
                }
                print ("no data. response status code: \(response.statusCode)")
                return
            }
            do {
                let serverResults = try JSONDecoder().decode([Stocks].self, from: data)
                
                DispatchQueue.main.async {
                    completion(serverResults, nil)
                    
                }
                
            }
            
            catch (let myError) {
                print (myError)
                completion([], myError)
            }
        }
        task.resume()
    }
    
}


