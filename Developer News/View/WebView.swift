//
//  WebView.swift
//  Developer News
//
//  Created by Kotni Krishna Chaitanya on 20/03/21.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable{
    let url: URL?
    
    func makeUIView(context: Context) -> WKWebView {
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        let confs = WKWebViewConfiguration()
        confs.defaultWebpagePreferences = preferences
        return WKWebView(frame: .zero, configuration: confs)
        
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let myUrl = url else{
            print("Error")
            return
        }
        let request = URLRequest(url: myUrl)
        uiView.load(request)
    }
    
    
}

