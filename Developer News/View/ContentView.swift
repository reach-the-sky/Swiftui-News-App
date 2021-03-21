//
//  ContentView.swift
//  Developer News
//
//  Created by Kotni Krishna Chaitanya on 20/03/21.
//

import SwiftUI

struct ContentView: View {
    @State var tabSelection: Int = 2
    
    init(){
        UITabBar.appearance().barTintColor = UIColor.white
        UINavigationBar.appearance().barTintColor = UIColor.white
    }
    
    var body: some View {
        TabView(selection: $tabSelection,
                content:  {
                    NewsView(newsList: LoadNews("topstories")).tabItem { Image(systemName: "house.fill")
                        Text("Top")
                    }.tag(1)
                    NewsView(newsList: LoadNews("newstories")).tabItem {
                        Image(systemName: "newspaper")
                        Text("New")
                    }.tag(2)
                    NewsView(newsList: LoadNews("beststories")).tabItem {
                        Image(systemName: "airport.extreme.tower")
                        Text("Best")
                    }.tag(3)
                })
            .accentColor(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
