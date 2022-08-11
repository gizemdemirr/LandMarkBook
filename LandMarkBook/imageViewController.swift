//
//  imageViewController.swift
//  LandMarkBook
//
//  Created by Gizem on 27.06.2022.
//

import UIKit

class imageViewController: UIViewController {
//veri aktarımı
   
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var landMarkLabel: UILabel!
    
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        landMarkLabel.text = selectedLandmarkName
        imageView.image = selectedLandmarkImage

    }
    

    

}
