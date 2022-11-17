//
//  game.swift
//  Practica1erTrimestre
//
//  Created by Osasu sanchez on 16/11/22.
//

import Foundation
import UIKit
class Game : UIViewController {
    
    var difucultad : String?
    var correctAnswer = 0
    var pez = 0
    let digimon = [UIImage(named:  "agumon"),UIImage(named:  "gatomon"),UIImage(named:  "guilmon"),UIImage(named: "veemon")]
    
   
    @IBOutlet weak var ivDigimon: UIImageView!
    
    @IBOutlet weak var tvpreba: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        tvpreba.text = difucultad
        
        if difucultad == "1"{
            repeat{
                getrandom()
                pez ++
            }while pez == 4 
            
        }
    }
    
    func getrandom(){
        
        
            let deadline = Date().advanced(by: 2)
            Thread.sleep(until: deadline)
            correctAnswer = Int.random(in: 0...3)
            ivDigimon.image = digimon[correctAnswer]
           
          
 
    }

}
