//
//  Posts.swift
//  OnlineHospitalApp
//
//  Created by bakebrlk on 11.10.2023.
//

import SwiftUI

struct Posts: Codable, Hashable {
    let id: Int
    let datetime: String
    let price: Int
}


struct SlotsResponse: Codable, Hashable {
    let slots: [Posts]
}


import Foundation

class PostViewModel: ObservableObject {

    @Published var posts: SlotsResponse = SlotsResponse(slots: [])
    @Published private var api: String
    @Published var dictionData: [Int] = []
    @Published var indexes: [Int] = []
    
    init(api: String) {
        self.api = api
    }
    
    func fetchPosts() {
        if let url = URL(string: api) {
            let task = URLSession.shared.dataTask(with: url) {[weak self] (data, response, error) in
                
                guard let data = data, error == nil else{
                    return
                }
                
                do{
                    let post = try JSONDecoder().decode(SlotsResponse.self, from: data)
                    DispatchQueue.main.async{
                        self?.posts = post
                        print(post)
                        for p in post.slots{
                            
                            if(self?.dictionData.last != Int(p.datetime[8..<10]) ?? 0){
                                self?.dictionData.append( Int(p.datetime[8..<10]) ?? 0)
                                
                                self?.indexes.append(p.id)
                                
                            }
                        }
                        
                        
                        
                        
                    }
                }catch{
                    print(error)
                }
            }
            task.resume()
        }
        
        
  
       
    }

}
