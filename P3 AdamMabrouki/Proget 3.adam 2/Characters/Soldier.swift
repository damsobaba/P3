//
//  Soldier.swift
//  Proget 3.adam
//
//  Created by Adam Mabrouki on 27/01/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import Foundation

final class Soldier:Character{
    
    init(name: String){
        super.init(type:"Soldier",name: name, health: 40, weapon: Shotgun(), maxHealth: 40, healingPower: 10)
    }
}
