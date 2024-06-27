//
//  APIManager.swift
//  Request_API
//
//  Created by Quang Phạm on 22/6/24.
//

import UIKit

import Foundation

class APIManager: NSObject {
    func requestAPIMusic(complete: @escaping (_ data: Any) -> Void) {
        let urlString = "http://zaloboom.com/training_api_music.json"
        guard let url = URL(string: urlString) else { return }
        
        // thiet lap thoi gian
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 120
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    complete(["error": error?.localizedDescription ?? "Unknown error"])
                }
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    DispatchQueue.main.async {
                        complete(json)
                    }
                } else if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                    DispatchQueue.main.async {
                        complete(jsonArray)
                    }
                }
            } catch let parseError {
                DispatchQueue.main.async {
                    complete(["error": parseError.localizedDescription])
                }
            }
        }
        task.resume()
    }
}
