//
//  HttpRequestHelper.swift
//  ExampleTest
//
//  Created by Macbook on 24/07/2022.
//

import Foundation
import Alamofire
import PromiseKit
import UIKit


enum RequestType{
    case movieListing
    case movieDetail
}

let BASE_URL="https://api.themoviedb.org/3/"
let MOVIE_LISTING_URL = "movie/upcoming"
let MOVIE_DETAIL_URL = "movie/"


class NetworkManager{
    
    
    static let api = NetworkManager()
    
    private init (){}
    
    
    func postRequest<T: Decodable>(reqType: RequestType, params: [String: Any], responseType: T.Type)-> Promise<BaseResponse<T>>{
        return Promise<BaseResponse<T>> {resolver in
            
            let url = getUrl(requestType: reqType)
            print ("post params: ",params)
            
            var theJSONDataa = Data()
            
            if let theJSONData = try? JSONSerialization.data(
                withJSONObject: params,
                options: []) {
                let theJSONText = String(data: theJSONData,
                                         encoding: .ascii) ?? ""
                print("JSON string = \(theJSONText)")
                
                theJSONDataa = theJSONData
            }
            
            
            var request = URLRequest(url: URL(string:url)!)
            request.httpMethod = HTTPMethod.post.rawValue
            request.httpBody = theJSONDataa
            
            
            AF.request(request)
            
            
                .responseString
            {
                response in
                switch(response.result){
                case .success(let data):
                    
                    
                    if let json = data.data(using: .utf8){
                        
                        
                        do {
                            print(String(data: json, encoding: .utf8) ?? "abc")
                            let res  = try JSONDecoder().decode(BaseResponse<T>.self, from:json)
                            print(String(data: json, encoding: .utf8) ?? "abc")
                            resolver.fulfill (res)
                        }
                        catch{
                            print(String(data: json, encoding: .utf8) ?? "abc")
                            resolver.reject(error)
                            
                            
                            
                        }
                    }
                case let .failure(error):
                    print(error);
                }
                
                
            }
        }
        
    }
    
    
    
    
    func getRequest<T: Decodable>(reqType: RequestType, params:String, responseType: T.Type)-> Promise<T>{
        return Promise<T> {resolver in
            
            var url = getUrl(requestType: reqType)
            url = url + params
            
            url = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            
            
            var request = URLRequest(url: URL(string:url)!)
            request.httpMethod = HTTPMethod.get.rawValue
            
            
            
            AF.request(request)
            
                .responseString
            {
                response in
                switch(response.result){
                case .success(let data):
                    
                    
                    if let json = data.data(using: .utf8){
                        
                        
                        do {
                            print(String(data: json, encoding: .utf8) ?? "abc")
                            let res  = try JSONDecoder().decode(T.self, from:json)
                            print(String(data: json, encoding: .utf8) ?? "abc")
                            resolver.fulfill (res as! T)
                        }
                        catch{
                            print(String(data: json, encoding: .utf8) ?? "abc")
                            resolver.reject(error)
                            
                            
                            
                        }
                    }
                case let .failure(error):
                    print(error);
                }
                
                
            }
        }
        
    }
    
    
    
    
    
    
    
    func postRequestWithCustomHeader<T: Decodable>(params: [String: Any],headers:HTTPHeaders, responseType: T.Type)-> Promise<BaseResponse<T>>{
        return Promise<BaseResponse<T>> {resolver in
            
            
            
            AF.request("", method: .post, parameters:params, headers: headers)
                .responseString
            {
                response in
                switch(response.result){
                case .success(let data):
                    if let json = data.data(using: .utf8){
                        
                        
                        
                        do {
                            let res  = try JSONDecoder().decode(BaseResponse<T>.self, from:json)
                            resolver.fulfill (res)
                        }
                        catch{
                            resolver.reject(error)
                            
                        }
                    }
                case let .failure(error):
                    print(error);
                }
                
                
            }
        }
        
    }
    
    
    func getUrl(requestType: RequestType) -> String{
        
        switch requestType{
            
            
        case.movieListing:
            return BASE_URL + MOVIE_LISTING_URL
        case.movieDetail:
            return BASE_URL + MOVIE_DETAIL_URL
            
            
            
        }
    }
}




