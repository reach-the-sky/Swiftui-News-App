//
//  NewsView.swift
//  Developer News
//
//  Created by Kotni Krishna Chaitanya on 20/03/21.
//

import SwiftUI

struct NewsView: View {
    @ObservedObject var newsList: LoadNews
    @State var gestureOffset = CGSize.zero
    var body: some View {
        
        NavigationView{
            ScrollView {
                VStack{
                    ForEach(newsList.news, id:\.id){ new in
                        
//                        NavigationLink(
//                            destination:
//                                NavigationWebView(url: new.url),
//                            label: {
//                                Card(title: new.title, by: new.by, score: new.score, url: new.url ?? "").padding([.leading,.trailing],2)
//                            })
                        
                        Card(title: new.title, by: new.by, score: new.score, url: new.url ?? "")
                            .padding([.leading,.trailing],2)
                        
                    }
                }
//            .gesture(
//
//                DragGesture()
//                    .onChanged{ gesture in
//                        self.gestureOffset = gesture.translation
//                    }
//                    .onEnded {_ in
//                    if self.gestureOffset.height > 10{
//                        newsList.load()
//                        print("Reloading")
//                    }
//                }
//            )
                .edgesIgnoringSafeArea(.horizontal)
                .navigationBarTitle("Developer News")
            }
            
            
        }
        .onAppear(){
            newsList.load()
        }
        
    }
    
}


func removeSpaces(_ string: String) -> String{
        var temp = Array(string)
        var i = 0
        while(i<temp.count){
            if(temp[i] == " "){
                temp.remove(at: i)
                temp.insert("+", at: i)
            }
            else{
                i += 1
            }
        }
        return String(temp)
    }

struct NavigationWebView: View{
    var url: String?
    var body: some View{
        ZStack{
            WebView(url: URL(string: url ?? "https://www.google.com")).edgesIgnoringSafeArea(.bottom)
        }
    }
}




struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(newsList: LoadNews("topstories"))
    }
}
