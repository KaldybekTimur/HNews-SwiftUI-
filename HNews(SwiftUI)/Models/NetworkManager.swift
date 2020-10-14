//
//  NetworkManager.swift
//  HNews(SwiftUI)
//
//  Created by Timur on 7/4/20.
//  Copyright © 2020 Timur. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject{
    
 @Published var posts = [Post]() // whenever changes notify listeners
    
    func fetchData(){
    if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, responce, error) in
            if error == nil {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do{
                        let results = try decoder.decode(Results.self, from: safeData)
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                    } catch {
                        print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}


/*
 Work with URL 
 
 struct Results{
 let hits: [Post]
 }
 
 func fetchData(){
 if   let url = URL(string: ""){
    let session = URLSession(conf: .default)
    let task = session.datatask(url) {(data, responce, error) in
        if error == nil{
        let decoder = JSONDecoder()
        if let safeData == data{
        do{
               let results = try decoder.decode(Results.self, safeData)
           }catch{
                print(error)
            }
        }
    } else {
            print(error)
            }
            task.resume()
        }
    }
 }
 */
