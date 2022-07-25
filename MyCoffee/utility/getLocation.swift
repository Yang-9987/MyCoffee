//
//  getLocation.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/20.
//

import Foundation
import CoreLocation
import MapKit

class locationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    private var locationCache: CLLocation?
    
    @Published var location: CLLocation?
    @Published var status: CLAuthorizationStatus?
    @Published var placemark: CLPlacemark?
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func updateLocation() {
        guard let location = locationCache else { return }
        self.location = location
        self.geocode()
    }
    
    private func geocode(){
        guard let location = self.location else {return}
        geocoder.reverseGeocodeLocation(location) { (placemark, error) -> Void in
            if (error == nil) {
                print(placemark ?? "nil")
                self.placemark = placemark?[0]
            } else {
                self.placemark = nil
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.status = status
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.locationCache = location
//        geocoder.reverseGeocodeLocation(location) { (placemark, error) -> Void in
//            if (error == nil) {
//                self.placemark = placemark?[0]
//            }else{
//                self.placemark = nil
//            }
//        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

extension CLLocation {
    var latitude: Double {
        return self.coordinate.latitude
    }
    
    var longitude: Double {
        return self.coordinate.longitude
    }
}
