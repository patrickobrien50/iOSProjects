//
//  TheDelegate.swift
//  Programming Trivia
//
//  Created by Patrick O'Brien on 5/3/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import Foundation
import UIKit

protocol TheDelegate: class  {
    func dismissSettings(controller: SettingsViewController)
    func dismissStore(controller: StoreViewController)
}
