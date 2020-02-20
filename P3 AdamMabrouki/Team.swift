//
//  Team.swift
//  Proget 3.adam
//
//  Created by Adam Mabrouki on 27/01/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import Foundation

class Team {
     // MARK: - properties
    static var uniqueTeamNames = [String]()
    var characters = [Character]()
    static var  uniquecharactersNames = [String]()  // verifie si nom existe deja
    var playerTeamName: String = ""
    init( ){
        self.playerTeamName = chosenTeamName()
        choseCharacters()
        
    }
    
     // MARK: - methods
    
    /// choisie un nom de heroe unique
    func chosenCharactersName() -> String {
        
        var username = ""
        repeat {
            if let data = readLine(){
                username = data
                if Team.uniquecharactersNames.contains(data){
                    print("Thise name already exist, please select a other name")
                    username = ""
                }else {
                    Team.uniquecharactersNames.append(data)
                }
                
            }
        } while username == ""
        return username
    }
    
    /// choisie un nom d'équipe unique 
    func chosenTeamName() -> String {
        print("Please enter you team name")
        var userTeamName = ""
        repeat {
            
            if let data = readLine(){
                userTeamName = data
                if Team.uniqueTeamNames.contains(data){
                    print("thise name already exist, please enter a team name")
                    userTeamName = ""
                    
                } else {
                    Team.uniqueTeamNames.append(data)
                }
                
            }
        } while userTeamName == ""
        return userTeamName
    }
    
    
    
    
    /// ajoute un heroe dans chaque equipe
    func choseCharacters()  {
        var Userchoice = 0
        for i in 0..<3 {
            print("")
            print("===============================")
            print("Choose character n°:\(i+1)")
            print("1 - 👾Samourai: 100 Hp - Catanna - Damage: 20")
            print("2 - 👾OneFistMan: 200 Hp - Fist - Damage: 10")
            print("3 - 👾Soldier: 80 Hp - Shotgun - Damage: 25")
            print("4 - 👾Wizard: 150 Hp - Magic Stick - Damage: 15")
            print("===============================")
            repeat { if let data = readLine() {
                if let dataToInt = Int(data) {
                    Userchoice = dataToInt }
                }
            } while  Userchoice != 1 && Userchoice != 2 && Userchoice != 3 && Userchoice != 4
            switch Userchoice {
            case 1:
                print("==========================")
                print("Amazing! what's his name ?")
                let samourai = Samourai(name:chosenCharactersName())
                characters.append(samourai)
                
            case 2:
                print("==============================")
                print("Good choice! What's his name ?")
                let oneFistMan = OnefistMan(name: chosenCharactersName())
                characters.append(oneFistMan)
                
            case 3:
                print("===============================================")
                print ("Great character ! how do you want to call him?")
                let soldier = Soldier(name: chosenCharactersName())
                characters.append(soldier)
                
            case 4:
                print("================================================")
                print("great wizzard !! how do you want to call him ?")
                let wizard =  Wizard(name: chosenCharactersName())
                characters.append(wizard)
                
            default:  break }
        }
        
    }
    
    
    /// Décrie les different heroe contenue dans l'équipe
    func description() {
        
        for i in 0..<characters.count{
            let heroe = characters[i]
            heroe.description(index: i)
            
            
        }
    }
    
    /// Vérifie si tout les personnages de l'équipe sont morts
    func teamisDead() -> Bool{
       
        for heroe in characters{
            if heroe.health > 0 {
                return false  }
        }
        return true
}
    

    
}
