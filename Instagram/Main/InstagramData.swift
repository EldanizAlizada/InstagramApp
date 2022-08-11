//
//  InstagramData.swift
//  Instagram
//
//  Created by Eldaniz on 06.08.22.
//

import UIKit

struct InstagramData: Decodable{
    let user : User
    let urls : Urls

}
struct User:Decodable{
    let username: String
    let profile_image: Sizes
    let name: String
}

struct Urls: Decodable{
    let regular: URL
}
struct Sizes: Decodable{
    let large: URL
}
