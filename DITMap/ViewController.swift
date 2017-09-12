//
//  ViewController.swift
//  DITMap
//
//  Created by D7703_12 on 2017. 8. 31..
//  Copyright © 2017년 KangMinWoo. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var myMapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // DIT 위치정보 35.166197, 129.072594
//        let center = CLLocationCoordinate2DMake(35.166197, 129.072594)
//        // DIT 반경 델타는 반경
//        let span = MKCoordinateSpanMake(0.05, 0.05)
//        // 위치잡는거 center = 중앙 span = 확대
//        let region = MKCoordinateRegionMake(center, span)
//        
//        myMapView.setRegion(region, animated: true)
//        
//        // Annotation(Pin) 꼽기
//        let anno01 = MKPointAnnotation()
//        anno01.coordinate = center
//        anno01.title = "어디야"
//        anno01.subtitle = "단데기가 진화한 포켓몬"
//        
//        myMapView.addAnnotation(anno01)
//        
//        // DIT 위치정보 35.168406, 129.057770
//        let center1 = CLLocationCoordinate2DMake(35.168406, 129.057770)
//        // DIT 반경 델타는 반경
//        let span1 = MKCoordinateSpanMake(0.05, 0.05)
//        // 위치잡는거 center = 중앙 span = 확대
//        let region1 = MKCoordinateRegionMake(center1, span1)
//        
//        myMapView.setRegion(region1, animated: true)
//        
//        // Annotation(Pin) 꼽기
//        let anno02 = MKPointAnnotation()
//        anno02.coordinate = center1
//        anno02.title = "부산시민공원"
//        anno02.subtitle = "건들면 안되는 포켓몬"
        zoomToRegion()
        
        
        let a = ViewPoint(coordinate: CLLocationCoordinate2D(latitude: 35.166096, longitude: 129.072616), title: "DIT 동의과학대학교", subtitle: "나의 꿈이 자라는 곳")
        let b = ViewPoint(coordinate: CLLocationCoordinate2D(latitude: 35.168424, longitude: 129.057823), title: "부산 시민공원", subtitle: "포켓몬 GO")
        
        myMapView.addAnnotations([a, b])
        
        myMapView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func zoomToRegion(){
        let location = CLLocationCoordinate2D(latitude: 35.166096, longitude: 129.072616)
        let region = MKCoordinateRegionMakeWithDistance(location, 2000.0, 4000.3)
        myMapView.setRegion(region, animated: true)
    }
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        
        let identifier = "MyPin"
        var annotationView = myMapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            if annotation.title! == "부산시민공원" {
                annotationView?.pinTintColor = UIColor.green
            }
            
            let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
            if annotation.title! == "부산시민공원" {
            
            
            leftIconView.image = UIImage(named:"abc.jpg")
            }else{    leftIconView.image = UIImage(named:"abc.jpg")
            }
            annotationView?.leftCalloutAccessoryView = leftIconView
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    
    }
    public func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl){
        print("Accessary Button tapped!!!!")
    }

}



