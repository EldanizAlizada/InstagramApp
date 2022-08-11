//
//  ViewController.swift
//  Instagram
//
//  Created by Eldaniz on 01.08.22.
//

import UIKit

import SDWebImage

class ViewController: UIViewController{
    
    var instagramManager = InstagramManager()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var table: UITableView!
    var user1: [Users] = []

    override func viewDidLoad() {
        table.dataSource = self
        table.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        instagramManager.delegate = self
        super.viewDidLoad()
        self.view.addSubview(buttonLoc(imageName: K.Images.camera, XCoordinate: 20, YCoordinate: 44))
        self.view.addSubview(buttonLoc(imageName: K.Images.dmButton, XCoordinate: 351, YCoordinate: 44))
        self.view.addSubview(buttonLoc(imageName: K.Images.home, XCoordinate: 20, YCoordinate: 788))
        self.view.addSubview(buttonLoc(imageName: K.Images.magnificer, XCoordinate: 103, YCoordinate: 788))
        self.view.addSubview(buttonLoc(imageName: K.Images.plus, XCoordinate: 186, YCoordinate: 788))
        self.view.addSubview(buttonLoc(imageName: K.Images.heart, XCoordinate: 268, YCoordinate: 788))
        self.view.addSubview(buttonLoc(imageName: K.Images.person, XCoordinate: 351, YCoordinate: 788))
        self.view.addSubview(labelloc(labelText: K.Labels.instagram, labelFont: K.Labels.BillaBong, XCoordinate: 132, YCoordinate: 44))
        instagramManager.fetchInstagram()
        
    }
    
    
}
extension ViewController: InstagramManagerDelegate{
    func addUserInfo(_ instagramManager: InstagramManager, user: [Users]) {
        DispatchQueue.main.async {
            self.user1 = user
            self.table.reloadData()
            self.collectionView.reloadData()
            
        }
        
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = user1[indexPath.row]
        let tCell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! TableViewCell
        
        tCell.nameLabel.text = user.username
        tCell.captionLabel.text = "@\(user.username): \(user.caption)"
        tCell.postImage.sd_setImage(with: user.image, placeholderImage: UIImage(named: "placeholder.png"))
        tCell.profileImage.sd_setImage(with: user.profilPhoto, placeholderImage: UIImage(named: "placeholder.png"))
        return tCell
    }
    
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let user = user1[indexPath.row]
        let cCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cCell.storyImage.sd_setImage(with: user.profilPhoto, placeholderImage: UIImage(named: "placeholder.png"))
        cCell.storyLabel.text = user.username
        
        return cCell
    }
    
    
}
