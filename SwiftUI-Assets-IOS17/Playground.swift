////
////  Playground.swift
////  SwiftUI-Assets-IOS17
////
////  Created by Daniel Felipe on 16/03/24.
////
//
//import Foundation
//import UIKit
//
////set is different from array because it is unordered otherwise it does not matter the order of things also doesn't it allow duplicate entities. the best choose for performance
//var ages = [18, 33, 35, 17, 94, 26, 33, 17]
//
////var agesSet: Set<Int> = []
//
//var agesSet = Set(ages)
//print(agesSet)
//
//agesSet.contains(17)
//
////Dictionary
//let devices: [String: String] =[
//    "phone": "iPhone X",
//    "laptop": "2016 MacBook Pro",
//    "tablet": "2018 iPad Pro",
//    "desktop": "2017 iMac Pro"
//]
//
//let allStars = ["James", "Davis", "Harden", "Doncic", "Leonard"]
//
//for player in allStars where player === "Harden" {
//    print(player)
//}
//
//for player in allStars {
//    //    print(player)
//}
//
//var randomInts: [Int] = []
//
//for _ in 0..<25 {
//    let randomNumber = Int.random(in: 0...100)
//    randomInts.append(randomNumber)
//}
//
//print(randomInts)
//
////enum
//
//enum Phone: String {
//    case iPhone11Pro = "This will by my next phone."
//    case iPhoneSE    = "I dislike this phone size. It makes design hard."
//    case pixel       = "Hardware is great. Android is 7u7r."
//    case nokia       = "Can't be broken. Classic."
//}
//
//func getDanielsOpinion(on phone: Phone) {
//    print(phone.rawValue)
//}
//
//getDanielsOpinion(on: .pixel)
////Optionals
//var ages: [Int] = [21, 45, 18, 71, 44, 23, 17]
//ages.sort()
//
////if let
//if let oldestAge = ages.last {
//    print("The oldes age is \(oldestAge)")
//} else {
//    print("There is no oldest age. You must have no students.")
//}
//
////nil coalescing
////let oldestAge = ages.last ?? 999
////guard statement
//func getOldestAge() {
//    guard let oldestAge = age.last else {
//        return
//    }
//    
//    print("\(oldestAge) is the oldest age.")
//    //a lot of code
//}
//
//getOldestAge()
//
////force unwrap
//let oldestAge = ages.last!
//
////class: share the same instance each time they are invoked.
//class Developer {
//    var name: String?
//    var jobTitle: String?
//    var yearsExp: Int?
//    
//    init(){}
//    
//    init(name: String, jobTitle: String, yearsExp: Int) {
//        self.name     = name
//        self.jobTitle = jobTitle
//        self.yearsExp = yearsExp
//    }
//    
//    func speackName() {
//        print(name!)
//    }
//}
//let daniel = Developer()
//
////daniel.name = "Danfelogar"
////daniel.jobTitle = "Frontend Engineer"
////daniel.yearsExp = 2
//
//let daniel = Developer(name: "Danfelogar", jobTitle: "Frontend Engineer", yearsExp: 2)
//daniel.speackName()
//
////Inheritance
//
//class iOSDeveloper: Developer {
//    var favoriteFramework: String?
//    
//    func speackFavoriteFramework() {
//        guard let favoriteFramework = favoriteFramework else { return print ("I don't have a favorite framework")}
//        print("my favorite framework is: \(favoriteFramework)")
//    }
//    
//    override func speackName() {
//        print("\(name!) - \(jobTitle!)")
//    }
//}
//
//var felipe = iOSDeveloper(name: "Daniel", jobTitle: "Frontend Engineer", yearsExp: 2)
//felipe.favoriteFramework = "ARKit"
//felipe.speackName()
//felipe.speackFavoriteFramework()
//
//
////struct: create a new instance each time they are invoked.
//
//struct DeveloperUnique {
//    var name: String
//    var jobTitle: String
//    var yearsExp: Int
//}
//
//var sean = DeveloperUnique(name: "Sean", jobTitle: "Frontend Engineer", yearsExp: 2)
//
//var joe = sean
//joe.name = "Joe"
//sean.name
//
////Extension
//extension String {
//    
//    func removeWhitespace() -> String {
//        return components(separatedBy: .whitespaces).joined()
//    }
//}
//
//let alphabet = "A B C D E F"
//print(alphabet.removeWhitespace())
////fizzBuzz
////Write a function that iterates through numbers 1-1000
////For numbers divisible by 3, print "FIZZ"
////For numbers divisible by 5, print "BUZZ"
////For numbers divisible by 3 & 5 (like the number 15), print "FIZZBUZZ"
////For numbers that don't meet any of these qualifications, print the number.
//func runFizzBuzz() {
//    for i in 1...100 {
//        if i % 3 == 0 && i % 5 == 0 {
//            print("FIZZBUZZ! \(i)")
//        }else if i % 3 == 0 {
//            print("FIZZ \(i)")
//        }else if i % 5 == 0 {
//            print("BUZZ \(i)")
//        }else {
//            print(i)
//        }
//    }
//}
