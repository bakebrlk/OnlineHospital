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
    @Published private var api: String = "https://phydoc-test-2d45590c9688.herokuapp.com/get_schedule?type=online"
    @Published var dictionData: [Int] = []
    @Published var indexes: [Int] = []
    
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
