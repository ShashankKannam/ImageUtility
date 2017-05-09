//
//  DemoURLS.swift
//  Cassini
//
//  Created by shashank kannam on 5/9/17.
//  Copyright © 2017 developer. All rights reserved.
//

import Foundation

struct DemoURLS
{
    static let stanford = "http://stanford.edu/about/images/intro_about.jpg"
    static var NASA: Dictionary<String,String> = {
        let NASAURLStrings = [
            "Cassini" : "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
            "Earth" : "http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
            "Saturn" : "http://www.nasa.gov/sites/default/files/saturn_collage.jpg"
        ]
       // var urls = Dictionary<String,String>()
//        for (key, value) in NASAURLStrings {
//            urls[key] = URL(string: value)
//        }
        return NASAURLStrings
    }()
}
