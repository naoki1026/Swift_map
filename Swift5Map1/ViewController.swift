//
//  ViewController.swift
//  Swift5Map1
//
//  Created by Naoki Arakawa on 2019/02/19.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //これは決まり文句なので覚える
        let location = CLLocationCoordinate2DMake(35.658581, 139.745433)
        
        //表示するマップの中心座標を設定
        //ここでのlocationは上の変数である
        mapView.setCenter(location, animated: true)
        
         //縮尺を設定
          var region: MKCoordinateRegion = mapView.region
    
        //初めに表示する場所
        region.center = location
        
        //地図の拡大状態の設定
        //設定しないと地図の表示が最縮小された状態でマップに表示されるため、
        //理由がない限りは設定した方が良い
        region.span.latitudeDelta = 0.02
        region.span.longitudeDelta = 0.02
        
        //regionに設定したマップのy表示設定をMapViewに反映
        mapView.setRegion(region, animated: true)
        
        //表示する地図の形式を指定する
        //ボタンをクリックすることで、地図の種類を変更できるようにする
        mapView.mapType = .hybrid
        
        //delegateメソッドを自分ものにするために、
        //viewdidload内に記述する必要がある
        mapView.delegate = self
        
        let annotation = MKPointAnnotation()
        
        //どこにピンを置くか
        annotation.coordinate = CLLocationCoordinate2DMake(location.latitude, location.longitude)
        
        //ピンのタイトル
        annotation.title = "東京タワー"
        
        //ピンを立てる
        mapView.addAnnotation(annotation)
       
    }
    
    @IBAction func reload(_ sender: Any) {
        
        print(count)
        
        count += 1
        
        switch count {
            
        case 1 :
            mapView.mapType = .standard
            
        case 2 :
            mapView.mapType = .hybridFlyover
            
        case 3 :
            mapView.mapType = .mutedStandard
            
        case 4 :
             mapView.mapType = .satellite
            
        case 5 :
             mapView.mapType = .satelliteFlyover
            
        default :
             count = 0
            
        }

        
    }
    
    
    
}

