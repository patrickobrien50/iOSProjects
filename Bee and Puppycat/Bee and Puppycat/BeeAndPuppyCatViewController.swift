//
//  ViewController.swift
//  Bee and Puppycat
//
//  Created by Patrick O'Brien on 5/2/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit
import AVFoundation

class BeeAndPuppyCatCollectionViewController: UICollectionViewController {
    
    let items = [#imageLiteral(resourceName: "AH"), #imageLiteral(resourceName: "AHHHH"), #imageLiteral(resourceName: "BKOW"), #imageLiteral(resourceName: "Cleavage"), #imageLiteral(resourceName: "couch"), #imageLiteral(resourceName: "crotch ice"), #imageLiteral(resourceName: "ew"), #imageLiteral(resourceName: "fook"), #imageLiteral(resourceName: "force them"), #imageLiteral(resourceName: "GET A GUM"), #imageLiteral(resourceName: "hahaha"), #imageLiteral(resourceName: "Ham Ham"), #imageLiteral(resourceName: "Homie"), #imageLiteral(resourceName: "my guts"), #imageLiteral(resourceName: "No Hitting"), #imageLiteral(resourceName: "oh hello"), #imageLiteral(resourceName: "Peasants"), #imageLiteral(resourceName: "Pretty Patrick"), #imageLiteral(resourceName: "PuppyCat Song"), #imageLiteral(resourceName: "PUPPYCAT!!"), #imageLiteral(resourceName: "Sqwak"), #imageLiteral(resourceName: "Temp Bot Laugh"), #imageLiteral(resourceName: "Temp Bot Transport"), #imageLiteral(resourceName: "Temp Bot Transport 2"), #imageLiteral(resourceName: "Temp Bot Uniform Assignment"), #imageLiteral(resourceName: "uh"), #imageLiteral(resourceName: "Why")]
    let names = ["AH", "AHHHHH", "BKOW", "Cleavage", "couch", "crotch ice", "ew", "fook", "force them", "GET A GUM", "hahaha", "Ham Ham", "Homie", "my guts", "No Hitting", "oh hello", "Peasants", "Pretty Patrick", "PuppyCat Song", "PUPPYCAT!!", "Sqwak", "Temp Bot Laugh", "Temp Bot Transport 1", "Temp Bot Transport 2", "Temp Bot Uniform Assignment", "uh", "Why"]
    var player: AVAudioPlayer?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CustomCell
        cell.layoutIfNeeded()
        
        cell.imageView.image = items[indexPath.row]
        cell.layer.borderColor = UIColor.red.cgColor
        cell.layer.borderWidth = 2.0
        cell.layer.cornerRadius = cell.frame.height/2
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let url = Bundle.main.url(forResource: "\(names[indexPath.row])", withExtension:".m4r") else {
            print("url not found")
            print(items[indexPath.row])
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player!.play()
        } catch _ as NSError {
            print("Error")
        }
    }
    
}

