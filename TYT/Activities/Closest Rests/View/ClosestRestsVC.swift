//
//  ClosestRestsVC.swift
//  TYT
//
//  Created by Андрей Глухих on 09/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import UIKit
import RxSwift
import MapKit
import RxCocoa
class ClosestRestsVC: UIViewController, ViewModelBased, Routable {

  var viewModel = ClosestRestsVM()
  var router = ClosestRestsRouter()

  var disposeBag = DisposeBag()
  var detailsPopup = BottomDetailsPopup()
  let locationManager = CLLocationManager()

  private let regionRadius: CLLocationDistance = 40000
  private let userRadius: CLLocationDistance = 5000

  private let initialLocation = CLLocation(latitude: 59.938, longitude: 30.314)

  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var myLocationButton: UIButton!
  
  var restInfoList: [RestInfo]! {
    didSet {
      restInfoList.forEach { item in
        let annotation = RestMapPointAnnotation()
        annotation.restInfo = item
        mapView.addAnnotation(annotation)
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    router.attach(viewController: self)
    setupBindings()
    setupLocationManager()
    setupMapView()
    viewModel.requestData()
    mapView.showsUserLocation = true
  }

  func setupBindings() {
    viewModel.restInfoList
      .subscribe(onNext: { items in
      self.restInfoList = items
    }).disposed(by: disposeBag)

    myLocationButton.rx.tap
      .subscribe(onNext: { _ in
        guard let location = self.mapView.userLocation.location else {
          return
        }
        self.centreMap(on: location, withRadius: self.userRadius)
      }).disposed(by: disposeBag)
  }

}

extension ClosestRestsVC: CLLocationManagerDelegate {
  func setupLocationManager() {
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestAlwaysAuthorization()
    locationManager.startUpdatingLocation()
  }
}

extension ClosestRestsVC: MKMapViewDelegate {

  func setupMapView() {
    mapView.register(RestMapClusterView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)

    mapView.register(RestMapAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)

    centreMap(on: initialLocation, withRadius: regionRadius)
  }

  func centreMap(on location: CLLocation, withRadius radius: Double) {
    let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: radius, longitudinalMeters: radius)
    mapView.setRegion(coordinateRegion, animated: true)
  }

  func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    mapView.deselectAnnotation(view.annotation, animated: false)
    guard let annotation = view.annotation as? RestMapPointAnnotation else {
      return
    }
    detailsPopup.showPopup(withInfo: annotation.restInfo, router: router)
  }
}
