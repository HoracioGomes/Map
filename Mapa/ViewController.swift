//
//  ViewController.swift
//  Mapa
//
//  Created by Horacio Gomes dos Santos Junior on 21/11/22.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var map: MKMapView!
    var gerenciadorLocal = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gerenciadorLocal.delegate = self
        gerenciadorLocal.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocal.requestWhenInUseAuthorization()
        gerenciadorLocal.startUpdatingLocation()
//
//        let latitude: CLLocationDegrees = -22.895384
//        let longitude: CLLocationDegrees = -42.225164
//        let latitudeDelta: CLLocationDegrees = 0.009
//        let longitudeDelta: CLLocationDegrees = 0.009
//
//        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
//        let zoom: MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
//        let regiao : MKCoordinateRegion = MKCoordinateRegion.init(center: location, span: zoom)
//
//        map.setRegion(regiao, animated: true)
//
//        let anotacao: MKPointAnnotation = MKPointAnnotation()
//        anotacao.coordinate = location
//        anotacao.title = "Abrigo"
//        anotacao.subtitle = "Perto do lago"
//
//        map.addAnnotation(anotacao)
//
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation: CLLocation = locations.last!
        let latitude: CLLocationDegrees = currentLocation.coordinate.latitude
        let longitude: CLLocationDegrees = currentLocation.coordinate.longitude
        let latitudeDelta: CLLocationDegrees = 0.009
        let longitudeDelta: CLLocationDegrees = 0.009
        
        let updatedLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let zoom: MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
        let regiao: MKCoordinateRegion = MKCoordinateRegion.init(center: updatedLocation, span: zoom)
        
        map.setRegion(regiao, animated: true)
    }

}

