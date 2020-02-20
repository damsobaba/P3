//
//  Samourai .swift
//  Proget 3.adam
//
//  Created by Adam Mabrouki on 27/01/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import Foundation

final class Samourai:Character{
   
    
    init(name: String) {
        super.init(type: "Samourai:", name: name , health: 50, weapon: Catanna(), maxHealth: 50, healingPower: 10)
    
}
}


