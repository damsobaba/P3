//
//  OneFistMan.swift
//  Proget 3.adam
//
//  Created by Adam Mabrouki on 27/01/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import Foundation

final class OnefistMan: Character{
    
    init(name: String){
        super.init(type:"OneFistMan", name: name, health: 50, weapon: Fist(), maxHealth: 50, healingPower: 10 )
}
}
