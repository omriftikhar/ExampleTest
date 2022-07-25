//
//  Movies.swift
//  ExampleTest
//
//  Created by Macbook on 24/07/2022.
//

import Foundation
import UIKit

struct BaseResponse<T:Decodable> : Decodable{

    var results: T?
}


//Listing Model
struct ListingData: Decodable {
    let backdrop_path: String?
    let original_title: String?
    let id: Int?
}

