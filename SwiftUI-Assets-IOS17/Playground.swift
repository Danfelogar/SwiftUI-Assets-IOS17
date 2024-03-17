//
//  Playground.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel Felipe on 16/03/24.
//

import Foundation
import UIKit

//set is different from array because it is unordered otherwise it does not matter the order of things also doesn't it allow duplicate entities. the best choose for performance
var ages = [18, 33, 35, 17, 94, 26, 33, 17]

//var agesSet: Set<Int> = []

var agesSet = Set(ages)
print(agesSet)

agesSet.contains(17)

//Dictionary
let devices: [String: String] =[
    "phone": "iPhone X",
    "laptop": "2016 MacBook Pro",
    "tablet": "2018 iPad Pro",
    "desktop": "2017 iMac Pro"
]
