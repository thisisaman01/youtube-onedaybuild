//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by AMAN K.A on 11/08/23.
//
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {

    @IBOutlet weak var tableView: UITableView!
    var model: Model? // Make model optional
    var videos = [Video]() // Change 'Videos' to 'videos'

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set itself as the datasource and the delegate
        tableView.dataSource = self
        tableView.delegate = self

        // Create an instance of the Model and set itself as the delegate
        model = Model(delegate: self) // Initialize model with delegate
        model?.getVideos() // Use optional chaining to call methods on model
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        //confirm that a video was selected
        
        guard tableView.indexPathForSelectedRow != nil else {
           return
        }
        
        //get a reference to the video that was tapped on
        
        let selectedVideo  =
        videos[tableView.indexPathForSelectedRow!.row]
        
        // get a refernce to the dtail view controller
        
        let detailVC =
        segue.destination as! DetailViewController
        
        // get the video property of the detail view controller
        
        detailVC.video = selectedVideo
    }
    
    // MARK: - Model Delegate methods

    func videosFetched(_ videos: [Video]) {
        // Set the returned videos to our 'videos' property
        self.videos = videos

        // Refresh the table view
        tableView.reloadData()
    }

    // MARK: - TableView Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the count of videos
        return videos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell

        // Configure the cell with data
        let video = self.videos[indexPath.row]
        cell.setCell(video)

        // Return the cell
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle row selection if needed
    }
}
