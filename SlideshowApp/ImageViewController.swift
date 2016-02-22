//
//  imageViewController.swift
//  SlideshowApp
//
//  Created by Takahiro.Kawakami on 2016/02/23.
//  Copyright © 2016年 Takahiro.Kawakami. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    
    var imageName:String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: imageName!)
        
        backBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        backBtn.backgroundColor = UIColor.blackColor()
        backBtn.layer.cornerRadius = 6.0
        self.view.bringSubviewToFront(backBtn)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
