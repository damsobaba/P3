//
//  game.swift
//  Proget 3.adam
//
//  Created by Adam Mabrouki on 29/01/2020.
//  Copyright © 2020 Adam Mabrouki. All rights reserved.
//

import Foundation

final class  Game {
    
    // MARK: - properties
    
    private  var teams = [Team]()
    private var round = 0
    
    // MARK: - methods
    
    func start(){
        for i in 0..<2 {
            print("")
            print("team N°\(i+1)")
            teams.append(Team())
            // ajoutes toutes les methodes de la classe Team et créé donc deux index dans le tableau teams pour chaque equipe
        }
        battle()
        showGameStat()
    }
    
    
    /// la fonction permet aux deux equipes de choisir un heroe a soigner ou un enemie a attaquer,
    func battle(){
        showPlayersTimes()
        
        while true {
            
            for i in 0..<2{
                round += 1
                print("Round N°\(round)")
                print(" \(Team.uniqueTeamNames[i]) Please select a heroe:")
                print("==================================================")
                
                teams[i].description()
                var  curentCharacter = teams[i].characters[playerChoice() - 1 ]// joueur choisie dans l'équipe 1 le heroe
                
                tresure(heroe: curentCharacter) // fais apparaitre une arme aleatoirement juste apres le choix du héroe
                
                if curentCharacter.isDead {
                    
                    repeat {  print("thise heroe is dead")
                        print(" \(teams[i].playerTeamName) Please select a heroe:")
                        print("==================================================")
                        teams[i].description()
                        
                        curentCharacter = teams[i].characters[playerChoice() - 1] // impose choix d'un heroe pas mort
                    } while curentCharacter.isDead
                }
                print(" You have selected: 👾\(curentCharacter.name) \(curentCharacter.type)")
                print("====================================================================")
                var userChoice = 0
                
                repeat{  print("Please chose a Action:")
                    print ("1. Attack⚔️: ")
                    print ("2. Heal  💉:  ")
                    print ("================================================================")
                    if let data = readLine() {
                        if let dataToInt = Int(data) {
                            userChoice = dataToInt
                        }
                    }
                } while userChoice != 1 && userChoice != 2
                
                switch userChoice{
                case 1:
                    print("Witch Enemy would you like to attack 🗡 ")
                    if i == 0{
                        teams[i+1].description()
                        
                    }else{
                        teams[i-1].description()
                    }
                    
                    if i == 0 {
                        //                    var  enemyCharacter = teams[i+1].characters[playerChoice()] // permet de choisir heroe dans l'equipe advairse
                        //
                        //                        print(" You have selected: \(enemyCharacter.name) \(enemyCharacter.type)")
                        //                        curentCharacter.attack(enemy: enemyCharacter )
                        
                        fightStatement(index: i, curentCharacter: curentCharacter)
                        if teams[i+1].teamisDead(){
                            return }
                        
                        //                        if enemyCharacter.isDead  {
                        //
                        //                            repeat {
                        //                                print("")
                        //                                print(" \(Team.uniqueTeamNames[i]) Please select a heroe:")
                        //                                print("==================================================")
                        //                                teams[+1].description()
                        //                                enemyCharacter = teams[i+1].characters[playerChoice()] // Impose choix d'un enemy par mort
                        //                                curentCharacter.attack(enemy: enemyCharacter )
                        //                            } while enemyCharacter.isDead
                        //                        }
                    } else {
                        
                        //                        var enemyCharacter = teams[i-1].characters[playerChoice()]  // permet de choisir heroe dans l'equipe advairse
                        //                        print(" You have selected: \(enemyCharacter.name) \(enemyCharacter.type)")
                        //                        curentCharacter.attack(enemy: enemyCharacter )
                        fightStatement(index: i, curentCharacter: curentCharacter)
                        
                        if teams[i-1].teamisDead()  {
                            return
                        }
                        //                        if enemyCharacter.isDead  {
                        //
                        //                            repeat {  print("thise heroe is dead")
                        //                                print(" \(Team.uniqueTeamNames[i]) Please select a heroe:")
                        //                                print("==================================================")
                        //                                teams[i-1].description()
                        //                                enemyCharacter = teams[i-1].characters[playerChoice()]
                        //                                curentCharacter.attack(enemy: enemyCharacter ) // Impose choix d'un enemy par mort
                        //                            } while enemyCharacter.isDead
                        //                        }
                    }
                case 2:
                    print("with heroe do you want to heal 💉:")
                    teams[i].description()
                    
                    var charachterToHeal = teams[i].characters[playerChoice() - 1]
                    
                    if charachterToHeal.isDead {
                        
                        repeat {  print("thise heroe is dead, he can not com back to life !")
                            print(" \(teams[i].playerTeamName) Please select a heroe:")
                            print("==================================================")
                            teams[i].description()
                            
                            charachterToHeal = teams[i].characters[playerChoice() - 1] // impose choix d'un heroe pas mort
                        } while charachterToHeal.isDead
                    }
                    print("you have chose: \(charachterToHeal.name)")  // les heroes se guerisse eux meme
                    curentCharacter.healing(heroe: charachterToHeal)
                    
                default:
                    break
                }
            }
        }
    }
    
    func fightStatement(index: Int, curentCharacter: Character) {
        let teamIndex: Int = index == 0 ? index + 1 : index - 1
        //        structure ternaire
        //        if index == 0 {
        //            teamIndex = index + 1
        //        }else{
        //            teamIndex = index - 1
        //        }
    
        var enemyCharacter = teams[teamIndex].characters[playerChoice()-1]  // permet de choisir heroe dans l'equipe advairse
        print(" You have selected: \(enemyCharacter.name) \(enemyCharacter.type)")
        curentCharacter.attack(enemy: enemyCharacter )
        
        if teams[teamIndex].teamisDead()  {
                                   return
                               }
        
        if enemyCharacter.isDead  {
            
            repeat {  print("thise heroe is dead")
                print(" \(Team.uniqueTeamNames[index]) Please select a heroe:")
                print("==================================================")
                teams[teamIndex].description()
                enemyCharacter = teams[teamIndex].characters[playerChoice()-1]
                curentCharacter.attack(enemy: enemyCharacter ) // Impose choix d'un enemy par mort
            } while enemyCharacter.isDead
        }
        
    }
    
    func showGameStat(){
        
        
        for i in 0...2 {
            
            if teams[i].teamisDead() == false { // choisie l'équipe encore vivante
                showPlayersTimes()
                print("🎖 Bravo !! \(teams[i].playerTeamName) Team have won the game 🏆🥇🎖 ")
                print(" Total Rounds 🛑 : \(round) ")
                print("============================")
                return // mercci Seb permet de sortir une fois que l e gagnant est affiché et cloture le jeux
            }
        }
    }
    
    
    
    func showPlayersTimes(){
        print("============================")
        print("============================")
        print (" 🏆 All Teams Review 🏆")
        print ("=========================")
        print ("")
        
        for team in teams {
            print("\(team.playerTeamName) is compose of :")
            print ("")
            team.description() // affiche tout les paramétres des Charactéres
            print("")
            print("=========================================")
        }
        
    }
    
    func tresure(heroe: Character ){
        
        
        let magicWepon = Sword()
        let ramdomNumber = Int.random(in: 1...5) // fais une boucle de 5
        
        if ramdomNumber == 2 { // si la boucle est sur 2 l'heroe prend la nouvelle arme
            heroe.weapon = magicWepon
            print("====================================================================")
            print(" Surpisee !!! a Cheast 🏺 appear: ")
            print(" \(heroe.name) have now a better weapon, it's the \(magicWepon.name)")
            print("who gives \(magicWepon.damage) Hp of damage.")
            print("=====================================================================")
        }
        
    }
    
    
    
    func playerChoice() -> Int{     // permet au joueur de faire un choix en rentrant un numéroe
        var choice = 0
        
        repeat {
            if let data = readLine() {
                if let dataToInt = Int(data) {
                    choice = dataToInt
                }
            }
        } while choice != 1 && choice != 2 && choice != 3
        
        return choice
    }
}


