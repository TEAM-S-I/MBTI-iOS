//
//  GADBannerViewController.swift
//  mbti
//
//  Created by dgsw8th71 on 2/28/24.
//

import GoogleMobileAds
import SwiftUI
import UIKit

struct GADBannerViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let view = GADBannerView(adSize: GADAdSizeBanner)
        let viewController = UIViewController()
        
        view.adUnitID = Secret.bannerId
        view.rootViewController = viewController
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: GADAdSizeBanner.size)
        view.load(GADRequest())
        return viewController
    }
 
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
