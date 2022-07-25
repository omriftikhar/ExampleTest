//
//  MoviesDetail.swift
//  ExampleTest
//
//  Created by Macbook on 24/07/2022.
//


import Foundation
import UIKit



struct MovieDetail: Decodable {
    let adult: Bool?
    let backdrop_path: String?
    let budget: Int?
    let genres : [Genres]
    let homepage : String?
    let id : Int?
    let imdb_id : String?
    let original_language: String?
    let original_title : String?
    let overview : String?
    let popularity : Double?
    let poster_path : String?
    let production_companies : [Companies]?
    let production_countries : [Countries]?
    let release_date : String?
    let revenue : Int?
    let runtime : Int?
    let spoken_languages : [Language]?
    let status : String?
    let tagline : String?
    let title : String?
    let video : Bool?
    let vote_average: Double?
    let vote_count : Int?
    
}

struct Genres: Decodable {
    let id : Int?
    let name: String?
}

struct Companies: Decodable {
    let id: Int?
    let logo_path : String?
    let name : String?
    let origin_country : String?
}

struct Countries: Decodable {
    let id: Int?
    let logo_path : String?
    let name : String?
    let origin_country : String?
}

struct Language: Decodable {
    let english_name : String?
    let iso_639_1: String?
    let name : String?
}





