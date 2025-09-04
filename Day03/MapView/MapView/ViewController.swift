//
//  ViewController.swift
//  MapView
//
//  Created by gyuyeon jo on 9/4/25.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
    
    @IBOutlet var myMap: MKMapView!
    @IBOutlet var labelLocationInfo1: UILabel!
    @IBOutlet var labelLocationInfo2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelLocationInfo1.text = ""
        labelLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 정확도를 최고로 설정
        locationManager.requestWhenInUseAuthorization()           // 위치 데이터 추적을 위해 사용자에게 권한 요청
        locationManager.startUpdatingLocation()                   // 위치 업데이트 시작
        myMap.showsUserLocation = true
    }

    @IBAction func sgmentChangeLocation(_ sender: Any) {
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        
        // 위치 정보 추출
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.labelLocationInfo1.text = "현재 위치"
            self.labelLocationInfo2.text = address
        })
    }
}

