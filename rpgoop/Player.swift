//
//  Player.swift
//  rpgoop
//
//  Created by Todd Fields on 2015-11-20.
//  Copyright © 2015 Todd Fields. All rights reserved.
//

import Foundation

class Player: Character {
  
  private var _name = "Player"
  
  var name: String {
    get {
      return _name
    }
  }
  
  private var _inventory = [String]()
  
  var inventory: [String] {
    get {
      return _inventory
    }
  }
  
  func addItemToInventory(item: String) {
    _inventory.append(item)
  }
  
  convenience init(name: String, hp: Int, attackPwr: Int) {
    
    self.init(startingHP: hp, attackPwr: attackPwr)
    _name = name
  }
  
}