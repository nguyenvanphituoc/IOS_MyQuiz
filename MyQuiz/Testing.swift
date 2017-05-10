//
//  ViewController.swift
//  ConcurrencyDemo
//
//  Created by Hossam Ghareeb on 11/15/15.
//  Copyright © 2015 Hossam Ghareeb. All rights reserved.
//

import UIKit
import Foundation

let imageURLs = ["https://cdn.pixabay.com/photo/2011/12/13/14/28/earth-11009_960_720.jpg", "https://exoplanets.nasa.gov/system/feature_items/images/14_hotJupiter320.jpg", "https://ichef.bbci.co.uk/images/ic/480x270/p048srjk.jpg", "https://solarsystem.nasa.gov/images/news/PIA21376_319.jpg"]

class Downloader {
    
    class func downloadImageWithURL(_ url:String) -> UIImage! {
        
        let data = try? Data(contentsOf: URL(string: url)!)
        return UIImage(data: data!)
    }
}

class Testing: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var imageView4: UIImageView!
    
    @IBOutlet weak var sliderValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didClickOnStart(_ sender: AnyObject) {

        let
        
        queue = OperationQueue()
        let operation1 = BlockOperation(block: {
            let img1 = Downloader.downloadImageWithURL(imageURLs[0])
            OperationQueue.main.addOperation({
                self.imageView1.image = img1
            })
        })
        
        operation1.completionBlock = {
            print("Operation 1 completed")
        }
        queue.addOperation(operation1)
        
        let operation2 = BlockOperation(block: {
            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
            OperationQueue.main.addOperation({
                self.imageView2.image = img2
            })
        })
        
        operation2.completionBlock = {
            print("Operation 2 completed")
        }
        queue.addOperation(operation2)
        
        
        let operation3 = BlockOperation(block: {
            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
            OperationQueue.main.addOperation({
                self.imageView3.image = img3
            })
        })
        
        operation3.completionBlock = {
            print("Operation 3 completed")
        }
        queue.addOperation(operation3)
        
        let operation4 = BlockOperation(block: {
            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
            OperationQueue.main.addOperation({
                self.imageView4.image = img4
            })
        })
        
        operation4.completionBlock = {
            print("Operation 4 completed")
        }
        queue.addOperation(operation4)
    }
    //NS operating
    /*
     
     let queue = OperationQueue()
     
     queue.addOperation { () -> Void in
     
     let img1 = Downloader.downloadImageWithURL(imageURLs[0])
     
     OperationQueue.main.addOperation({
     self.imageView1.image = img1
     })
     }
     
     queue.addOperation { () -> Void in
     let img2 = Downloader.downloadImageWithURL(imageURLs[1])
     
     OperationQueue.main.addOperation({
     self.imageView2.image = img2
     })
     
     }
     
     queue.addOperation { () -> Void in
     let img3 = Downloader.downloadImageWithURL(imageURLs[2])
     
     OperationQueue.main.addOperation({
     self.imageView3.image = img3
     })
     
     }
     
     queue.addOperation { () -> Void in
     let img4 = Downloader.downloadImageWithURL(imageURLs[3])
     
     OperationQueue.main.addOperation({
     self.imageView4.image = img4
     })
     
     }
     */
    //serial queue
    /*
     let serialQueue = DispatchQueue(label: "com.my.label")
     
     
     serialQueue.async() { () -> Void in
     
     let img1 = Downloader .downloadImageWithURL(imageURLs[0])
     DispatchQueue.main.async(execute: {
     
     self.imageView1.image = img1
     })
     
     }
     serialQueue.async() { () -> Void in
     
     let img2 = Downloader.downloadImageWithURL(imageURLs[0])
     
     DispatchQueue.main.async(execute: {
     
     self.imageView2.image = img2
     })
     
     }
     serialQueue.async() { () -> Void in
     
     let img3 = Downloader.downloadImageWithURL(imageURLs[0])
     
     DispatchQueue.main.async(execute: {
     
     self.imageView3.image = img3
     })
     
     }
     serialQueue.async() { () -> Void in
     
     let img4 = Downloader.downloadImageWithURL(imageURLs[0])
     
     DispatchQueue.main.async(execute: {
     
     self.imageView4.image = img4
     })
     }

     */
    //queue
    /*
     let queue = DispatchQueue.global(qos: .background)
     queue.async() { () -> Void in
     
     let img1 = Downloader.downloadImageWithURL(imageURLs[0])
     DispatchQueue.main.async {
     self.imageView1.image = img1
     }
     }
     
     queue.async() { () -> Void in
     
     let img2 = Downloader.downloadImageWithURL(imageURLs[1])
     DispatchQueue.main.async {
     self.imageView2.image = img2
     }
     }
     
     queue.async() { () -> Void in
     
     let img3 = Downloader.downloadImageWithURL(imageURLs[2])
     DispatchQueue.main.async {
     self.imageView3.image = img3
     }
     }
     
     queue.async() { () -> Void in
     
     let img4 = Downloader.downloadImageWithURL(imageURLs[3])
     DispatchQueue.main.async {
     self.imageView4.image = img4
     }
     }
     */
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        self.sliderValueLabel.text = "\(sender.value * 100.0)"
    }
    
}

