//
//  PlaneAnnotation.swift
//  MapM
//
//  Created by chunxi on 2020/10/14.
//

import UIKit
import MAMapKit

class PlaneAnnotation: MAAnimatedAnnotation {
    
    init(coordinate: CLLocationCoordinate2D) {
        super.init()
        self.coordinate = coordinate
    }
    
}

class PlaneAnnotationView: MAAnnotationView {
    
    override init!(annotation: MAAnnotation!, reuseIdentifier: String!) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        bounds = .init(x: 0, y: 0, width: 50, height: 50)
        backgroundColor = .brown
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
