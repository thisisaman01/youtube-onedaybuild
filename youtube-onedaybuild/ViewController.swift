//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by AMAN K.A on 11/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

