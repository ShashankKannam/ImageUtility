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
    
    var imgURL: String? {
        didSet {
            mainImage = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    private var activity: UIActivityIndicatorView?
   
    private var mainImage:UIImage? {
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            activity?.stopAnimating()
        }
        get {
           return imageView.image
        }
    }
    
    private func fetchImage() {
        if let urlIn = imgURL, let url = URL(string: urlIn) {
            DispatchQueue.global(qos: .userInitiated).async {[weak self] in
                self?.activity?.startAnimating()
                if let imageData = try? Data(contentsOf: url), urlIn == self?.imgURL {
                    DispatchQueue.main.async {
                        if let imageContents = UIImage(data: imageData) {
                            self?.mainImage = imageContents
                        }
                    }
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        activity = activitySpinner()
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

    func activitySpinner() -> UIActivityIndicatorView {
        let activitySpinner = UIActivityIndicatorView(frame: CGRect(x: view.center.x - 25, y: view.center.y - 25, width: 50, height: 50))
        activitySpinner.activityIndicatorViewStyle = .whiteLarge
        activitySpinner.backgroundColor = UIColor.black
        activitySpinner.layer.cornerRadius = 5.0
        activitySpinner.hidesWhenStopped = true
        view.addSubview(activitySpinner)
        return activitySpinner
    }
}
