//
//  File.swift
//  Programming Trivia
//
//  Created by Patrick O'Brien on 5/5/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import Foundation
import UIKit

struct Colors {
    static let lightPink = UIColor.init(red: 255.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1.0)
    static let greenPurple = UIColor.init(red: 255.0/255.0, green: 0.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    static let yellowFont = UIColor.init(red: 255.0/255.0, green: 200.0/255.0, blue: 100.0/255.0, alpha: 1.0)
    static let lightBlue = UIColor.init(red: 105.0/255.0, green: 200.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    static let lightRed = UIColor.init(red: 230/255, green: 89/255, blue: 108/255, alpha: 1)
    static let deepRed = UIColor.init(red: 208/255, green: 26/255, blue: 26/255, alpha: 1)
    static let deepPurple = UIColor.init(red: 164/255, green: 26/255, blue: 208/255, alpha: 1)
    static let brightCyan = UIColor.init(red: 65/255, green: 241/255, blue: 236/255, alpha: 1)
    static let forestGreen = UIColor.init(red: 41/255, green: 115/255, blue: 19/255, alpha: 1)
    static let rustOrange = UIColor.init(red: 215/255, green: 140/255, blue: 21/255, alpha: 1)
}

struct Questions {
    static var questions: [(String, String)]?
}

struct Themes {
    static var purchasedThemes = UserDefaults.standard.object(forKey: "myThemes") as? Array<String>
    static var unpurchasedThemes = UserDefaults.standard.object(forKey: "shopThemes") as? Array<String>
}

struct UserPoints {
    static var points = UserDefaults.standard.object(forKey: "points") as? Int
}
