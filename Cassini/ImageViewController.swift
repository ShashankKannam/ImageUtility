//
//  ViewController.swift
//  Cassini
//
//  Created by shashank kannam on 5/9/17.
//  Copyright © 2017 developer. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    private var imgURL: String? {
        didSet {
            if view.window != nil {
                mainImage = nil
                fetchImage()
            }
        }
    }
    
    private var imageView = UIImageView()
   
    private var mainImage:UIImage? {
        set {
            imageView.image = mainImage
            imageView.sizeToFit()
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
        view.addSubview(imageView)
        imgURL = DemoURLS.stanford
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if mainImage ==  nil {
            fetchImage()
        }
    }
}

