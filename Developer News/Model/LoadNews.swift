//
//  LoadNews.swift
//  Developer News
//
//  Created by Kotni Krishna Chaitanya on 20/03/21.
//

import Foundation

class LoadNews: ObservableObject{
    @Published var news = [News]()
    var link: String
    
    init(_ link: String){
        self.link = link
    }
    func load(){
        let topNewsList: [Int] = loadStories("https://hacker-news.firebaseio.com/v0/\(self.link).json")
        for i in topNewsList{
                loadNews("https://hacker-news.firebaseio.com/v0/item/"+String(i)+".json")
        }
    }
    
    func loadStories(_ fileName: String) -> [Int]{
        
        let data: Data
        guard let url = URL(string: fileName)
        else{
            fatalError("Couldn't find the file")
        }
        do{
            try data = Data(contentsOf: url)
        }
        catch{
            fatalError("Couldn't load the file from the main bundle")
        }
        
        do{
            let decoder = JSONDecoder()
            return try decoder.decode([Int].self, from: data)
        }
        catch{
            fatalError("Couldn't parse the file\(fileName)")
        }
        
    }
    
    func loadNews(_ fileName: String){
        
        guard let url = URL(string: fileName) else{
            print("Error")
            return
        }
        DispatchQueue.global(qos: .background).async
        {
        URLSession.shared.dataTask(with: url){ (data ,resp ,err) in
            guard let data = data else{
                print("Error")
                return
            }
            
            do{
                let temp = try JSONDecoder().decode(News.self,from: data)
                DispatchQueue.main.async{self.news.append(temp)}
                
            }
            catch{
                print("Failed in loading")
            }
            
        }.resume()
        
        }
    }
}
