//
//  DevilWizard.swift
//  rpgoop
//
//  Created by Todd Fields on 2015-11-20.
//  Copyright © 2015 Todd Fields. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
  
  override var loot: [String] {
    return ["Magic Wand", "Dark Amulet", "Salted Pork"]
  }
  
  override var type: String {
    return "Devil Wizard"
  }
  
  
}