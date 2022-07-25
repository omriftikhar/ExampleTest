//
//  MoviesTableView.swift
//  ExampleTest
//
//  Created by Macbook on 24/07/2022.
//

import UIKit

import CoreData
import UniformTypeIdentifiers
class MoviesTableView: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel = MoviesModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = "Watch"
        label.font = UIFont(name:"Poppins-Medium", size: 20.0)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        
     
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
        listingPacket()
        self.tableView.reloadData()
        
    }
    
    
 
    
    
    func listingPacket()
    {
        
        let params = "?api_key=" + moviesInstances.sharedInstance.API_Key
        print(params)
        
        let req = NetworkManager.api.getRequest(reqType: .movieListing , params: params, responseType: BaseResponse<[ListingData]>.self)
        req.done {
            (response: BaseResponse<[ListingData]>) in
            print(req)
            
            self.viewModel.listdata.append(contentsOf: (response.results)!)
            self.tableView.reloadData()
            
            
            
        }
        .catch{
            error in
            debugPrint(error)
            
        }
        
    }
    
    
}


extension MoviesTableView: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesCell", for: indexPath) as! MoviesCell
        let list = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(list: list)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let list = viewModel.cellForRowAt(indexPath: indexPath)
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let vc = storyBoard.instantiateViewController(withIdentifier: "MoviesDetailViewController") as!             MoviesDetailViewController
            vc.Movieid = list.id
            self.navigationController?.pushViewController(vc, animated: true)
       // self.present(vc, animated: true, completion: nil)
    }
    
}











