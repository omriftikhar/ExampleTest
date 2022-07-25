//
//  instances.swift
//  ExampleTest
//
//  Created by Macbook on 24/07/2022.
//

import Foundation
import Alamofire

class moviesInstances : NSObject{
    
    
    static let sharedInstance : moviesInstances = {
        let instance = moviesInstances()
        return instance
    
    }()

    var API_Key = "8d09099c1f91523e7a7c9e3adf23a460"
    var imageBaseURL = "https://image.tmdb.org/t/p/original/"

}
