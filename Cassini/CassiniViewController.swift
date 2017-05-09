//
//  CassiniViewController.swift
//  Cassini
//
//  Created by shashank kannam on 5/9/17.
//  Copyright © 2017 developer. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController, UISplitViewControllerDelegate {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        splitViewController?.delegate = self
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        
        if primaryViewController.contentViewController == self {
            if let svc = secondaryViewController.contentViewController as? ImageViewController, svc.imgURL == nil {
                return true
            }
        }
        return false
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination.contentViewController as? ImageViewController {
            dest.imgURL = DemoURLS.NASA[segue.identifier ?? ""]
            dest.navigationItem.title = (sender as? UIButton)?.currentTitle
        }
    }
}

extension UIViewController {
    var contentViewController: UIViewController {
        if let navCon = self as? UINavigationController {
            return navCon.visibleViewController ?? self
        }
        return self
    }
}
