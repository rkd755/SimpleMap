//
//  ViewPoint.swift
//  DITMap
//
//  Created by D7703_12 on 2017. 9. 12..
//  Copyright © 2017년 KangMinWoo. All rights reserved.
//
import MapKit
import UIKit

class ViewPoint: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }

}
