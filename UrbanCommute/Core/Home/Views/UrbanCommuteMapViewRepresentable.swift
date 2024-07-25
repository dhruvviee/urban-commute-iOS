//
//  UrbanCommuteMapViewRepresentable.swift
//  UrbanCommuteClone
//
//  Created by Dhruv Sharma on 14/01/24.
//

import SwiftUI
import MapKit

struct UrbanCommuteMapViewRepresentable: UIViewRepresentable {
    let mapview = MKMapView()
    let locationManager = LocationManager.shared
    @Binding var mapState: MapViewState
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    func makeUIView(context: Context) -> some UIView {
        mapview.delegate = context.coordinator
        mapview.isRotateEnabled = false
        mapview.showsUserLocation = true
        mapview.userTrackingMode = .follow
        
        return mapview
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
//        print("DEBUG: Map State is \(mapState)")
        
        switch mapState {
        case .noInput:
            context.coordinator.clearMapViewAndRecentreOnUserLocation()
            break
        case .searchingForLocation:
            break
        case .locationSelected:
            if let coordinate = locationViewModel.selectedUrbanCommuteLocation?.coordinate{
                context.coordinator.addAndSelectedAnnotation(withCoordinate: coordinate)
                context.coordinator.configurePolyline(withDestinationCoordinate: coordinate)
            }
            break
        case .polylineAdded:
            break
        }
        
        
//        if mapState == .noInput{
//            context.coordinator.clearMapViewAndRecentreOnUserLocation()
//        }
    }
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}
extension UrbanCommuteMapViewRepresentable{
    class MapCoordinator: NSObject, MKMapViewDelegate{
        //MARK: - Properties
        let parent: UrbanCommuteMapViewRepresentable
        var userLocationCoordinate: CLLocationCoordinate2D?
        var currentRegion: MKCoordinateRegion?
        //MARK: - LifeCycle
        
        init(parent: UrbanCommuteMapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        //MARK: - MKMapViewDelegates
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            self.userLocationCoordinate = userLocation.coordinate
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                )
            self.currentRegion = region
                
                parent.mapview.setRegion(region, animated: true)
        }
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let polyline = MKPolylineRenderer(overlay: overlay)
            polyline.strokeColor = .systemBlue
            polyline.lineWidth = 6
            return polyline
        }
        //MARK: - Helpers
        
        func addAndSelectedAnnotation(withCoordinate coordinate: CLLocationCoordinate2D){
            parent.mapview.removeAnnotations(parent.mapview.annotations)
            
            let anno = MKPointAnnotation()
            anno.coordinate = coordinate
            parent.mapview.addAnnotation(anno)
            parent.mapview.selectAnnotation(anno, animated: true)
        }
        
        func configurePolyline(withDestinationCoordinate coordinate: CLLocationCoordinate2D) {
            guard let userLocationCoordinate = self.userLocationCoordinate else { return }
            parent.locationViewModel.getDestinationRoute(from: userLocationCoordinate, to: coordinate) { route in
                self.parent.mapview.addOverlay(route.polyline)
                self.parent.mapState = .polylineAdded
                let rect = self.parent.mapview.mapRectThatFits(route.polyline.boundingMapRect, edgePadding: .init(top: 64, left: 32, bottom: 500, right: 32))
                self.parent.mapview.setRegion(MKCoordinateRegion(rect), animated: true)
            }
        }
        
       
        
        func clearMapViewAndRecentreOnUserLocation() {
            parent.mapview.removeAnnotations(parent.mapview.annotations)
            parent.mapview.removeOverlays(parent.mapview.overlays)
            if let currentRegion = currentRegion{
                parent.mapview.setRegion(currentRegion, animated: true)
            }
            
        }
        
    }
}
