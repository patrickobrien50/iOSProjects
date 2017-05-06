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
