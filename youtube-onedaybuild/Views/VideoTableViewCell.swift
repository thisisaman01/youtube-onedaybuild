//
//  VideoTableViewCell.swift
//  youtube-onedaybuild
//
//  Created by AMAN K.A on 25/08/23.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
   
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    var video: Video?
    
    // Assuming you have a Video struct or class defined somewhere
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // This method is called when the cell is created from a nib file (such as a storyboard). You might do additional setup here if needed.
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        // This method is called when the cell's selection state changes. You might adjust UI appearance here when the cell is selected.
    }
    
    func setCell(_ v: Video) {
        self.video = v
        
        guard self.video != nil else {
            return
        }
        
        // Set the title
        
        self.titleLabel.text = video?.title
        
        // Set the date
        
        let df = DateFormatter()
        
        df.dateFormat = "EEEE, MMM d, yyyy"
        
        self.dateLabel.text = df.string(from: video!.published)
    
        // Set the thumbnail
        
        guard self.video!.thumbnail != "" else {
            return
        }
        
        // check cache before downloading data
        
        if let cachedData =
            CacheManager.getVideoCache(self.video!.thumbnail) {
            
            // set the thumbnail image view
            
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        // Download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        //get the shared URL Session object
        
        let session = URLSession.shared
        
        // Create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                // save the data in cache
                
                CacheManager.setVideoCache(url!.absoluteString, data!)
                
            // check that the downloaded url matches the video thumbnail url that this cell is currently set to display
                
                if url?.absoluteString != self.video?.thumbnail {
                    
                    //video cell has been recycled for another video and no longer matched the thumbnail   that was downloaded
                    
                    return
                }
                
            
            
            // Create the image object
                
                let image = UIImage(data: data!)
                
                
                // Set the image view
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        
        // Start data task
        dataTask.resume()
    }
}

