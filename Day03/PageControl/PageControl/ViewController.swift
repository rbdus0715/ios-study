//
//  ViewController.swift
//  PageControl
//
//  Created by gyuyeon jo on 9/5/25.
//

import UIKit

class ViewController: UIViewController {
    var images = ["01.jpeg", "02.jpeg", "03.jpeg"]
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        imageView.image = UIImage(named: images[0])
    }
    @IBAction func pageChange(_ sender: UIPageControl) {
        imageView.image = UIImage(named: images[pageControl.currentPage])
    }
}

