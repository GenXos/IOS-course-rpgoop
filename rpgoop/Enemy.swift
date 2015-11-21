//
//  Enemy.swift
//  rpgoop
//
//  Created by Todd Fields on 2015-11-20.
//  Copyright © 2015 Todd Fields. All rights reserved.
//

import Foundation

class Enemy: Character {
  
  var loot: [String] {
    return ["Rusty Dagger", "Cracked Buckler"]
  }
  
  var type: String {
    return "Grunt"
  }
  
  func dropLoot() -> String? {
    
    if !isAlive {
      let rand = Int(arc4random_uniform(UInt32(loot.count)))
      return loot[rand]
    }
    
    return nil
  }
}