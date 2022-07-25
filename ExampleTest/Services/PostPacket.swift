//
//  PostPacket.swift
//  ExampleTest
//
//  Created by Macbook on 24/07/2022.
//

import Foundation


class PostPacket {
    typealias Packet = [String: Any]
    static let shared = PostPacket()
    private init(){}

  
  

    
    func listingPacket(apiKey: String) -> Packet {
         
        var dict = Packet()
        dict["api_key"] = apiKey.trim
      
        return dict
     }
    
    
 
 
    
    
    
    
    
    
    
  
              
    
    
   
    
    
 
      
       

}



//spaces trim extension

extension String{
      
      var trim:String{
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
      }
  }

