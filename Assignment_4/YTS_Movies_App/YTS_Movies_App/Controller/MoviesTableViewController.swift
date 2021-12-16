//
//  MoviesTableViewController.swift
//  YTS_Movies_App
//
//  Created by user202363 on 12/16/21.
//

import UIKit

class MoviesTableViewController: UITableViewController {

    lazy var results = [movies]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ServiceController.shared.getMovies{ resultFromAPI in DispatchQueue.main.async{
            self.results = resultFromAPI
            self.tableView.reloadData()
        }
            
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return results.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let item = results[indexPath.row]
        cell.textLabel?.text = item.title
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DVC = segue.destination as! DetailViewController
        DVC.Title = results[tableView.indexPathForSelectedRow!.row].title
        DVC.image_url = results[tableView.indexPathForSelectedRow!.row].large_cover_image
        DVC.summary = results[tableView.indexPathForSelectedRow!.row].summary
        DVC.year = results[tableView.indexPathForSelectedRow!.row].year
        DVC.rating = results[tableView.indexPathForSelectedRow!.row].rating        
    }

}
