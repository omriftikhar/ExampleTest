//
//  MoviesDetail.swift
//  ExampleTest
//
//  Created by Macbook on 24/07/2022.
//

import Foundation
import UIKit
import TagListView


class MoviesDetailViewController: UIViewController {
    
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var taglistView: TagListView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var overview: UILabel!
    
    
    var Movieid : Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        
        getPropertyDetail()
    }
    
    
    func getPropertyDetail()
    {
        
        let id : Int = Movieid!
        let params = String(id) + "?api_key=" + moviesInstances.sharedInstance.API_Key
        print(params)
        let req = NetworkManager.api.getRequest(reqType: .movieDetail , params: params, responseType: MovieDetail.self)
        req.done { [self]
            
            (response: MovieDetail) in
            
            
            let imageUrl : String? = response.poster_path
            let backdropURL = moviesInstances.sharedInstance.imageBaseURL + (imageUrl ?? "")
            let url = URL(string: backdropURL ?? "")!
            poster.af.setImage(withURL: url)
            
            self.overview.text = response.overview
            
            
            let Date = response.release_date
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = dateFormatter.date(from:Date ?? "")
            
            releaseDate.text = "In Theaters \(date!.asString())"
            
            
            self.taglistView.removeAllTags()
            let moviesGenres = response.genres ?? []
            var genresArray : [String]! = []
            for i in (0 ..< moviesGenres.count) {
                genresArray.append(moviesGenres[i].name!)
            }
            
            self.taglistView.addTags(genresArray)
            
            
            
            
        }
        .catch{
            error in
            
            debugPrint(error)
        }
        
        
    }
    
    
    
    
    
    
}





