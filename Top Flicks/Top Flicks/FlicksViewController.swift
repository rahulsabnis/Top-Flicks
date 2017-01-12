//
//  FlicksViewController.swift
//  Top Flicks
//
//  Created by Rahul Sabnis on 1/6/17.
//  Copyright © 2017 Rahul Sabnis. All rights reserved.
//

import UIKit
import AFNetworking
import ARSLineProgress

class FlicksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var imageToPass:UIImageView!
    var overview:String!
    var titleOfFlick:String!
    
    var movies: [NSDictionary]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.refreshControlAction(refreshControl:)), for: UIControlEvents.valueChanged)
        
        // add refresh control to table view
        tableView.insertSubview(refreshControl, at: 0)
        
        refreshControlAction(refreshControl: refreshControl)
        
    }
    
    // Makes a network request to get updated data
    // Updates the tableView with the new data
    // Hides the RefreshControl
    func refreshControlAction(refreshControl: UIRefreshControl) {
        
        let apiKey = "6b9f7dfd5efd9902f7bb61487f791903"
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        ARSLineProgress.showWithPresentCompetionBlock { () -> Void in
            print("Showed with completion block")
        }
        
        // ... Create the NSURLRequest (myRequest) ...
        
        let task: URLSessionDataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if let data = data {
                if let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    
                    self.movies = dataDictionary["results"] as? [NSDictionary]
                    self.tableView.reloadData()
                    
                    // Tell the refreshControl to stop spinning
                    refreshControl.endRefreshing()
                    
                    ARSLineProgress.hideWithCompletionBlock({ () -> Void in
                        print("Hidden with completion block")
                    })
                }
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let movies = movies {
            return movies.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlickCell", for: indexPath) as! FlickCell
        
        let flick = movies![indexPath.row]
        let title = flick["title"] as! String
        let overview = flick["overview"] as! String
        
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        let posterPath = flick["poster_path"] as! String
        let imageUrl = URL(string: baseUrl + posterPath)
        
        cell.titleLabel.text = title
        cell.overviewLabel.text = overview
        cell.posterView.setImageWith(imageUrl!)
        
        print("row \(indexPath.row)")
        
        return cell
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
