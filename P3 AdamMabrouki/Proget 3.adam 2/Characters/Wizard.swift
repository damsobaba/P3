//
//  Wizard.swift
//  Proget 3.adam
//
//  Created by Adam Mabrouki on 27/01/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import Foundation

final class Wizard: Character{
    
    init(name: String ){
        super.init(type:"Wizard",name: name, health: 70, weapon: MagicStick(), maxHealth: 70, healingPower: 10)
    }
}
 
