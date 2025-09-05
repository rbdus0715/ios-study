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
    

    @IBAction func sgmentChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            // 현재 위치
            self.labelLocationInfo1.text = ""
            self.labelLocationInfo2.text = ""
            // 계속 업데이트
            locationManager.startUpdatingLocation()
        } else if sender.selectedSegmentIndex == 1 {
            setAnnotation(
                latitudeValue: 37.481632,
                longitudeValue: 126.997620,
                delta: 1,
                title: "방배역", subtitle: "서울특별시 서초구 방배역"
            )
            self.labelLocationInfo1.text = "보고 계신 위치"
            self.labelLocationInfo2.text = "방배역"
        } else if sender.selectedSegmentIndex == 2 {
            setAnnotation(latitudeValue: 37.556876, longitudeValue: 126.914066, delta: 0.1, title: "이지스퍼블리싱", subtitle: "서울시 마포구 잔다리로 109 이지스 빌딩")
            self.labelLocationInfo1.text = "보고 계신 위치"
            self.labelLocationInfo2.text = "이지스퍼블리싱 출판사"
        }
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double)-> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subtitle strSubtitle: String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        // 핀의 타이틀과 서브타이틀을 입력 파라미터를 통해 세팅, 맵 뷰에 변수 annotation 값 추가
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
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
        
        locationManager.stopUpdatingLocation()
    }
}

