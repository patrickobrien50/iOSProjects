//
//  ViewController.swift
//  Happy Place
//
//  Created by Patrick O'Brien on 6/14/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Intents
import Foundation



class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var happyPlaces: UITableView!
    
    @IBOutlet weak var gifView: UIImageView!
    
    @IBAction func addHappyPlace(_ sender: UIBarButtonItem) {
        let alertController: UIAlertController = UIAlertController(title: "Add a new happy place!", message: "Currently adding your current location as a Happy Place, what would you like to call it?", preferredStyle: .alert)
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) {
            action -> Void in
        }
        alertController.addAction(cancelAction)
        
        
        
        print("This is the current coordinates \(String(describing: myCurrentLocation))")
        let addAction: UIAlertAction = UIAlertAction(title: "Add", style: .default) {
            action -> Void in
            let text = (alertController.textFields?.first!)?.text
            print(text!)
            CLGeocoder().reverseGeocodeLocation(self.myCurrentLocation!, completionHandler: {(placemarks, error) -> Void in
                
                if error != nil {
                    print("Reverse geocoder failed with error")
                    return
                }
                
                if (placemarks?.count)! > 0 {
                    let pm = placemarks?[0]
                    print("Location", pm?.locality! ?? "Something is wrong")
                    print(placemarks?[0].thoroughfare ?? "Couldn't find an address")
                    print(placemarks?[0].location?.coordinate.latitude ?? "Couldn't find coordinates")
                    print(placemarks?[0].location?.coordinate.longitude ?? "Couldn't find coordinates")

                    self.places.append((placemarks?[0])!)
                }
                else {
                    print("Problem with the data received from geocoder")
                }
            })
            print(self.places)
            print(self.placeNames)
            self.placeNames.append(text!)
        }
        alertController.addAction(addAction)
        alertController.addTextField { ( textField : UITextField!) -> Void in
            textField.placeholder = "Name your Happy Place"
        }
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    var placeNames = [String]()
    
    var places = [CLPlacemark]()
    
    var myCurrentLocation: CLLocation?
    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        myCurrentLocation = locations[0]
        
        self.happyPlaces.reloadData()
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        var anymorePlacesAdded = 0
        
        if anymorePlacesAdded != places.count {
            for place in self.places {
                let latitude = Double((place.location?.coordinate.latitude)!)
                let longitude = Double((place.location?.coordinate.longitude)!)
                let myLatitude = Double((myCurrentLocation?.coordinate.latitude)!)
                let myLongitude = Double((myCurrentLocation?.coordinate.longitude)!)

                if latitude <= myLatitude + 5 || latitude >= myLatitude - 5 && longitude <= myLongitude + 5 || longitude >= myLongitude - 5 {
                    print("You are back!")
                    anymorePlacesAdded += 1
                }
            }
        }
        
        
        map.setRegion(region, animated: true)
        
        
        
        self.map.showsUserLocation = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        happyPlaces.delegate = self
        happyPlaces.dataSource = self
        
        happyPlaces.layer.borderColor = UIColor.black.cgColor
        happyPlaces.layer.borderWidth = 0.5
        happyPlaces.layer.cornerRadius = happyPlaces.layer.frame.height/10
        
        map.layer.cornerRadius = map.layer.frame.height/2
        
        gifView.loadGif(name: "giphy")
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = places[indexPath.row].name
        return cell
    }
    
    

}
