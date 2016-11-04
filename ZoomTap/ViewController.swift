//
//  ViewController.swift
//  ZoomTap
//
//  Created by techmaster on 11/4/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var ViewScroll: UIScrollView!
    var photo = UIImageView()
    var pageImgs: [String] = []
    var first = false
    override func viewDidLoad() {
        super.viewDidLoad()
        pageImgs = ["shop1-0","shop1-1","shop1-2"]
        pageController.currentPage = 0
        pageController.numberOfPages = pageImgs.count
        ViewScroll.minimumZoomScale = 0.5
        ViewScroll.maximumZoomScale = 2
    }

    override func viewDidLayoutSubviews() {
        if (!first) {
            first = true
            
            let pageScrollViewSize = ViewScroll.frame.size
            ViewScroll.contentSize = CGSize(width: pageScrollViewSize.width * CGFloat(pageImgs.count), height: 0)
            
            for i in 0..<pageImgs.count {
                let imgView = UIImageView(image: UIImage(named: pageImgs[i]+".jpg"))
                imgView.frame = CGRect(x: CGFloat(i)*ViewScroll.frame.size.width, y: 0, width: ViewScroll.frame.size.width, height: ViewScroll.frame.size.height)
                imgView.contentMode = .scaleAspectFit
                ViewScroll.backgroundColor = UIColor.black
                self.ViewScroll.addSubview(imgView)
            }
        }
    }
    
    @IBAction func onChange(_ sender: UIPageControl) {
        ViewScroll.contentOffset = CGPoint(x: CGFloat(pageController.currentPage) * ViewScroll.frame.size.width, y: 0)
        
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photo
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((self.ViewScroll.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        print("\(page) and \(pageWidth)")
        if (pageController.currentPage != page) {
            pageController.currentPage = page
        }
    }
}

