//
//  User.swift
//  KellyBennett_MultiplePages
//
//  Created by student on 3/22/18.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation

import UIKit

class User {
    class var sharedInstance: User {
        struct Static {
            static let instance = User()
        }
        return Static.instance
    }
    var viewControllers: [UIViewController] = []
}
