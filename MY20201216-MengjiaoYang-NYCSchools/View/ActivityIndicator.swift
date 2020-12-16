//
//  ActivityIndicator.swift
//  20201215-MengjiaoYang-NYCSchools
//
//  Created by mengjiao on 12/16/20.
//

import SwiftUI

///Swiftui does  not have ActivityIndicatorView,
/// So created an ActivityIndicator using UIKit's UIActivityIndicatorView
struct ActivityIndicator: UIViewRepresentable {
    var shouldAnimate: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }

    func updateUIView(_ uiView: UIActivityIndicatorView,
                      context: Context) {
        if self.shouldAnimate {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
            uiView.isHidden = true
        }
    }
}


