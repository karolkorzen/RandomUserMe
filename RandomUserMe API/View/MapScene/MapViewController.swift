//
//  MapViewController.swift
//  RandomUserMe API
//
//  Created by Karol Korzeń on 20/01/2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    //MARK: - Properties
    private let viewModel: MapSceneViewModel
    
    private var mapView = MKMapView()
    
    //MARK: - Lifecycle
    
    init(withViewModel viewModel: MapSceneViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configureUI(){
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        
//        mapView.addConstraintsToFillView(view)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        let coordinates = viewModel.getCoordinates
        let location = CLLocationCoordinate2D(latitude: coordinates().0, longitude: coordinates().1)
        let pin = MKPointAnnotation()
        pin.coordinate = location
        let coordinateRegion = MKCoordinateRegion(center: pin.coordinate, latitudinalMeters: 500000, longitudinalMeters: 500000)
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.addAnnotation(pin)
    }
}
