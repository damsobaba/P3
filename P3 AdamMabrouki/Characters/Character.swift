//
//  Character.swift
//  Proget 3.adam
//
//  Created by Adam Mabrouki on 27/01/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import Foundation

class Character {
    // MARK: - properties
    var type : String
    let name: String
    var health: Int
    var maxHealth: Int
    var weapon: Weapon
    var healingPower: Int
    var isDead: Bool {
        return health <= 0
    }
    // MARK: - methodes
    init(type: String, name: String, health: Int, weapon: Weapon, maxHealth: Int, healingPower: Int ){
        self.type = type
        self.name = name
        self.health = health
        self.weapon = weapon
        self.maxHealth = maxHealth
        self.healingPower = healingPower
        
    }
    /// le heroe  attaque  l'enemie si il est vivant
    func attack(enemy: Character){
        if enemy.health > 0 {
            enemy.health -= weapon.damage
            print("=======================================================")
            print(" - \(name) \(type) attack \(enemy.name) \(enemy.type) with the \(weapon.name) ")
            print(" - \(enemy.name) \(enemy.type) loses \(weapon.damage) Hp ")
            print(" - \(enemy.name) \(enemy.type) health is now \(enemy.health)/ \(enemy.maxHealth)")
            print("=========================================================")
            
        }else if enemy.health <= 0 {
            enemy.health = 0
            print(" \(enemy.name) is alsready  dead ☠️")
        }
        
    }
    
    /// fonction permettant de soigner
    func healing(heroe:Character){
        if heroe.health <= 0 {
            print ("\(heroe.name) is dead, he can't be ill")
        } else{
            
            heroe.health += heroe.healingPower
            if heroe.health >= heroe.maxHealth {
                heroe.health = heroe.maxHealth
            }
            print("===========================================================")
            print(" \(heroe.name) \(heroe.type) is healing ")
            print ("his health is now \(heroe.health) / \(heroe.maxHealth) Hp")
            print("===========================================================")
            
        }
        
        
    }
    
    
    /// fonction permettant d'acceder a la décription du personnage 
    func description(index: Int ){
        if isDead{
            print(" \(index+1)- 👾\(name) \(type) is DEAD; ")
        }else{
            print(" \(index+1) - 👾\(name) -\(type) - Health : \(health)/\(maxHealth)Hp - Weapon: \(weapon.name) - Dammage: \(weapon.damage) - Healing power: \(healingPower) Hp")
            
            
        }
        
    }
    
    
    
}
