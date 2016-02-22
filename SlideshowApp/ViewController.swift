//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Takahiro.Kawakami on 2016/02/22.
//  Copyright © 2016年 Takahiro.Kawakami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageArr:[String] = ["photo1","photo2","photo3"]
    var i:Int = 0;
    var timer:NSTimer!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: imageArr[i])
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "imageTapped:"))
        
        nextBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        backBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        playBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        nextBtn.backgroundColor = UIColor.blueColor()
        backBtn.backgroundColor = UIColor.blueColor()
        playBtn.backgroundColor = UIColor.redColor()
        nextBtn.layer.cornerRadius = 6.0
        backBtn.layer.cornerRadius = 6.0
        playBtn.layer.cornerRadius = 6.0
        
    }

    @IBAction func nextTap(sender: AnyObject) {
        if i < imageArr.count-1 {
            i++
        } else {
            i = 0
        }
        imageView.image = UIImage(named: imageArr[i])
    }
    
    @IBAction func backTap(sender: AnyObject) {
        if i > 0 {
            i--
        } else {
            i = imageArr.count-1
        }
        imageView.image = UIImage(named: imageArr[i])
    }
    
    @IBAction func playTap(sender: AnyObject) {
        if playBtn.currentTitle == "再生" {
            startPlay()
            
        } else {
            stopPlay()
        }
        
    }
    
    func autoPlay() {
        if i < imageArr.count-1 {
            i++
        } else {
            i = 0
        }
        imageView.image = UIImage(named: imageArr[i])
    }
    
    func startPlay() {
        playBtn.setTitle("停止", forState: UIControlState.Normal)
        nextBtn.enabled = false
        backBtn.enabled = false
        nextBtn.backgroundColor = UIColor.grayColor()
        backBtn.backgroundColor = UIColor.grayColor()
        
        //timerを生成
        timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "update:", userInfo: nil, repeats: true)
    }
    
    func stopPlay() {
        if timer.valid == true {
            
            playBtn.setTitle("再生", forState: UIControlState.Normal)
            nextBtn.enabled = true
            backBtn.enabled = true
            nextBtn.backgroundColor = UIColor.blueColor()
            backBtn.backgroundColor = UIColor.blueColor()
            
            //timerを破棄
            timer.invalidate()
            
        }
    }
    
    func update(timer : NSTimer){
        autoPlay()
    }
    
    func imageTapped(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("showImage",sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "showImage") {
            let imageViewController:ImageViewController = segue.destinationViewController as! ImageViewController
            imageViewController.imageName = imageArr[i]
            
            if playBtn.currentTitle == "停止" {
                stopPlay()
            }
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

