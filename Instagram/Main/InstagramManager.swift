//
//  InstagramManager.swift
//  Instagram
//
//  Created by Eldaniz on 06.08.22.
//

import UIKit

protocol InstagramManagerDelegate{
    func addUserInfo(_ instagramManager: InstagramManager, user: [Users])
    
}

struct InstagramManager{
    
    var delegate: InstagramManagerDelegate?
    
    func fetchInstagram (){
        let urlString = "https://api.unsplash.com/photos/?client_id=YourAPIkey"// use unsplash.com to get and API key
        performRequest(with: urlString)
    }
    
    
    func performRequest (with urlString: String){
        //1.Create a URL
        if let url = URL(string: urlString){
            //2.Create a URLSession
            let session = URLSession(configuration: .default)
            //3.Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let user = self.parseJSON(safeData){
                        self.delegate?.addUserInfo(self, user: user)
                    }
                    
                }else{
                    print("error")
                }
            }
            //4.start the task
            task.resume()
        }
        
    }
    func parseJSON (_ instagramData: Data) -> [Users]?{
        let decoder = JSONDecoder()
        do {
            var users : [Users] = []
    
            let decodedData = try decoder.decode([InstagramData].self, from: instagramData)
            for i in 0...9{
                let username = decodedData[i].user.username
                let image = decodedData[i].urls.regular
                let profilPhoto = decodedData[i].user.profile_image.large
                let caption = decodedData[i].user.name
                
                let user = Users(username: username, image: image, profilPhoto: profilPhoto, caption: caption)
                users.append(user)
            }
            return users
        }catch{
            print(error)
            return nil
        }
    }
    
}


