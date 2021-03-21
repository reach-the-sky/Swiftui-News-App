//
//  Card.swift
//  Developer News
//
//  Created by Kotni Krishna Chaitanya on 20/03/21.
//
import SwiftUI

struct Card: View {
    var title: String
    var by: String
    var score: Int
    var url: String
    @State var sheetIsPresented = false
    var body: some View {
        
        HStack {
            VStack(alignment: .leading){
                Text(title)
                    .font(.title3)
                    .foregroundColor(Color.orange)
                    .bold()
                HStack(spacing: 0){
                    Text("By: ")
                        .fontWeight(.light)
                    Text(by)
                    Text("  Score: ")
                        .fontWeight(.light)
                        .padding(.leading)
                    Text(String(score))
                }
                .foregroundColor(.primary)
                .font(.caption)
                
                
                Link(destination: URL(string: url) ?? URL(string: "https://www.google.com")!, label: {
                    Text(url)
                        .lineLimit(1)
                        .font(.caption)
                        .foregroundColor(.secondary)})
                
                
//                Text(url)
//                    .lineLimit(1)
//                    .font(.caption)
//                    .foregroundColor(.secondary)
//                    .onTapGesture {
//                        self.sheetIsPresented.toggle()
//                        print(url)
//                    }
//                    .sheet(isPresented: $sheetIsPresented, content: {
//                    WebView(url: URL(string: url))
//                })
            }
            .padding()
            Spacer()
        }
        .background(RoundedRectangle(cornerRadius: 25).fill(Color.white).shadow(radius: 5))
        .padding(3)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(title: "News",by: "Krishna",score: 100,url: "www.news.com")
    }
}
