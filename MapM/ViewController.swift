//
//  ViewController.swift
//  MapM
//
//  Created by chunxi on 2020/10/14.
//

import UIKit
import MAMapKit
import pop

class ViewController: UIViewController, MAMapViewDelegate {
    lazy var mapView: CustomMapView = {
        let v = CustomMapView.init(frame: view.bounds)
        v.delegate = self
        v.isZoomEnabled = false
        v.isScrollEnabled = false
        v.isRotateEnabled = false
        return v
    }()
  
  
    lazy var displayLink = CADisplayLink.init(target: self, selector: #selector(displayAction))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        view.addSubview(mapView)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
//            self.displayLink.add(to: .current, forMode: .common)
//        })
        let btn = UIButton.init(type: .custom)
        view.addSubview(btn)
        btn.frame = CGRect.init(x: 100, y: 100, width: 100, height: 40)
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(displayAction), for: .touchUpInside)
        
    }

    
    @objc func displayAction() {
        let lat = 39.89287564952232
        let lon = 116.40319796645086
        
        var coors: [CLLocationCoordinate2D] = []
        
        for _ in 0...1 {
            let coor = CLLocationCoordinate2D.init(latitude: lat + Double.random(in: 0...30), longitude: lon + Double.random(in: 0...30))
            coors.append(coor)
        }
        let line = MAPolyline.init(coordinates: &coors, count: UInt(coors.count))
        mapView.add(line)
        print("onece")
    }
    
    func mapView(_ mapView: MAMapView!, viewFor annotation: MAAnnotation!) -> MAAnnotationView! {
        if let ano = annotation as? PlaneAnnotation {
            let v: PlaneAnnotationView
            if let v1 = mapView.dequeueReusableAnnotationView(withIdentifier: "id") as? PlaneAnnotationView {
                v = v1
            } else {
                v = PlaneAnnotationView.init(annotation: ano, reuseIdentifier: "id")
            }
            return v
        }
        return nil
    }
    
    func mapView(_ mapView: MAMapView!, rendererFor overlay: MAOverlay!) -> MAOverlayRenderer! {
        if overlay is MAPolyline {
            let r = MAPolylineRenderer.init(overlay: overlay)
            r?.lineWidth = 1
            r?.strokeColor = .red
            return r
        }
        return nil
    }
    
    func mapView(_ mapView: MAMapView!, didSelect view: MAAnnotationView!) {
    }
    
    func mapView(_ mapView: MAMapView!, didSingleTappedAt coordinate: CLLocationCoordinate2D) {
        print(coordinate)
    }

}

