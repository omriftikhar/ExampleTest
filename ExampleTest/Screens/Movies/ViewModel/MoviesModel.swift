//
//  MoviesModel.swift
//  ExampleTest
//
//  Created by Macbook on 24/07/2022.
//


import Foundation

class MoviesModel {
    
    
    public var listdata = [ListingData]()
    
    func numberOfRowsInSection(section: Int) -> Int {
        
        return listdata.count
        
    }
    
    func cellForRowAt (indexPath: IndexPath) -> ListingData {
        return listdata[indexPath.row]
    }
    
    
}






