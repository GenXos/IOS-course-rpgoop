//
//  ViewController.swift
//  rpgoop
//
//  Created by Todd Fields on 2015-11-20.
//  Copyright © 2015 Todd Fields. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var printLbl: UILabel!

  @IBOutlet weak var playerHPLbl: UILabel!
  
  @IBOutlet weak var enemyHPLbl: UILabel!
  
  @IBOutlet weak var enemyImg: UIImageView!
  
  @IBOutlet weak var chestBtn: UIButton!
  
  @IBOutlet weak var attackBtn: UIButton!
  
  var player: Player!
  var enemy: Enemy!
  var chestMessage: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    player = Player(name: "DirtyLaundry21", hp: 110, attackPwr: 20)
    playerHPLbl.text = "\(player.hp) HP"
    
    createRandomEnemy()
    
  }
  
  func createRandomEnemy() {
    
    let rand = Int(arc4random_uniform(2))
    
    if rand == 0 {
      enemy = Kimara(startingHP: 50, attackPwr: 12)
    } else {
      enemy = DevilWizard(startingHP: 60, attackPwr: 15)
    }
    
    enemyImg.hidden = false
    
  }
  
  @IBAction func onChestTapped(sender: AnyObject) {
    
    chestBtn.hidden = true
    printLbl.text = chestMessage
    NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "createRandomEnemy", userInfo: nil, repeats: false)
  }
  
  @IBAction func attackButtonTapped(sender: AnyObject) {
    
    if enemy.attemptAttack(player.attackPwr) {
      printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP."
      enemyHPLbl.text = "\(enemy.hp) HP"
    } else {
      printLbl.text = "Attack was unsuccessful!"
    }
    
    if let loot = enemy.dropLoot() {
      player.addItemToInventory(loot)
      chestMessage = "\(player.name) found \(loot)"
      chestBtn.hidden = false
    }
    
    if !enemy.isAlive {
      enemyHPLbl.text = ""
      printLbl.text = "\(player.name) killed \(enemy.type)!"
      enemyImg.hidden = true
    }
  }

}

