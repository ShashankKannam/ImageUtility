//
//  ViewController.swift
//  Cassini
//
//  Created by shashank kannam on 5/9/17.
//  Copyright © 2017 developer. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    fileprivate var imageView = UIImageView()
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentSize = imageView.frame.size
            scrollView.addSubview(imageView)
            scrollView.maximumZoomScale = 1.0
            scrollView.minimumZoomScale = 0.03
        }
    }
    
    private var imgURL: String? {
        didSet {
            mainImage = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
  
   
    private var mainImage:UIImage? {
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
        get {
           return imageView.image
        }
    }
    
    private func fetchImage() {
        if let urlIn = imgURL, let url = URL(string: urlIn) {
            if let imageData = try? Data(contentsOf: url), let imageContents = UIImage(data: imageData) {
                mainImage = imageContents
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        imgURL = DemoURLS.stanford
        scrollView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if mainImage ==  nil {
            fetchImage()
        }
    }

}

extension ImageViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

}
