//
//  UIMapView.swift
//  breadwallet
//
//  Created by Gardner von Holt on 5/6/20.
//  Copyright © 2020 Breadwinner AG. All rights reserved.
//
//  See the LICENSE file at the project root for license information.
//

import UIKit
import MapKit

extension MKMapView {

    static func wrapping(meters: Double) -> MKMapView {
        let mapview = MKMapView()
        //Zoom to user location
        let noLocation = CLLocationCoordinate2D()
        let viewRegion = MKCoordinateRegion(center: noLocation, latitudinalMeters: meters, longitudinalMeters: meters)
        mapview.setRegion(viewRegion, animated: false)
        mapview.isScrollEnabled = true
        mapview.isZoomEnabled = true

        if #available(iOS 13.0, *) {
            mapview.overrideUserInterfaceStyle = .dark
        } else {
            // Fallback on earlier versions
        }

        // Do any additional setup after loading the view.
        //        mapATMs.isUserLocationVisible = true
        mapview.showsScale = true
        mapview.showsCompass = true

        return mapview
    }

    static func wrapping(font: UIFont) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = font
        return label
    }
    
    func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
      let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                latitudinalMeters: regionRadius,
                                                longitudinalMeters: regionRadius)
      setRegion(coordinateRegion, animated: true)
    }

}
