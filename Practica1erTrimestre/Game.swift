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
    
    var copia : [UIImage?] = []
    var correcion : [UIImage?] = []
    let digimon = [UIImage(named: "agumon"),UIImage(named:  "gatomon"),UIImage(named:  "guilmon"),UIImage(named: "veemon")]
    
    @IBOutlet weak var btAgumon: UIButton!
    
    @IBOutlet weak var btGatomon: UIButton!
    
    @IBOutlet weak var btGulmon: UIButton!
    
    
    @IBOutlet weak var btVeemon: UIButton!
    
    @IBOutlet weak var ivDigimon: UIImageView!
    
    @IBOutlet weak var tvpreba: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ivDigimon.image = nil
       
        tvpreba.text = difucultad
        
        if difucultad == "1"{
            ezGame()
            
        }else if difucultad == "2"{
            normalGame()
        }else {
            difGame()
        }
        
            
    }
    
    @IBAction func addAgumon(_ sender: Any) {
        correcion.append(UIImage(named: "agumon"))
        checkArray()
    }
    @IBAction func addGatomon(_ sender: Any) {
        correcion.append(UIImage(named: "gatomon"))
       checkArray()
    }
    @IBAction func addGuilmon(_ sender: Any) {
        correcion.append(UIImage(named: "guilmon"))
       checkArray()
    }
    @IBAction func addVeemon(_ sender: Any) {
        correcion.append(UIImage(named: "veemon"))
        checkArray()
    }
    
    func ezGame(){
        enabledButton()
        changeImage()
        DispatchQueue.main.async {
            sleep(2)
            self.imageNil()
            DispatchQueue.main.async {
                sleep(3)
                self.changeImage()
                DispatchQueue.main.async {
                    sleep(3)
                    self.imageNil()
                    DispatchQueue.main.async {
                        sleep(3)
                        self.changeImage()
                        DispatchQueue.main.async {
                            sleep(3)
                            self.imageNil()
                            DispatchQueue.main.async {
                                sleep(3)
                                self.changeImage()
                                self.abledButton()
                            }
                        }
                    }
                }
            }
        }
    }
    func normalGame(){
        enabledButton()
        changeImage()
        DispatchQueue.main.async {
            sleep(2)
            self.imageNil()
            DispatchQueue.main.async {
                sleep(3)
                self.changeImage()
                DispatchQueue.main.async {
                    sleep(3)
                    self.imageNil()
                    DispatchQueue.main.async {
                        sleep(3)
                        self.changeImage()
                        DispatchQueue.main.async {
                            sleep(1)
                            self.imageNil()
                            DispatchQueue.main.async {
                                sleep(3)
                                self.changeImage()
                                DispatchQueue.main.async {
                                    sleep(3)
                                    self.imageNil()
                                    DispatchQueue.main.async {
                                        sleep(3)
                                        self.changeImage()
                                        self.abledButton()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    func difGame(){
        enabledButton()
        changeImage()
        DispatchQueue.main.async {
            sleep(2)
            self.imageNil()
            DispatchQueue.main.async {
                sleep(3)
                self.changeImage()
                DispatchQueue.main.async {
                    sleep(3)
                    self.imageNil()
                    DispatchQueue.main.async {
                        sleep(3)
                        self.changeImage()
                        DispatchQueue.main.async {
                            sleep(1)
                            self.imageNil()
                            DispatchQueue.main.async {
                                sleep(3)
                                self.changeImage()
                                DispatchQueue.main.async {
                                    sleep(3)
                                    self.imageNil()
                                    DispatchQueue.main.async {
                                        sleep(3)
                                        self.changeImage()
                                        DispatchQueue.main.async {
                                            sleep(3)
                                            self.imageNil()
                                            DispatchQueue.main.async {
                                                sleep(3)
                                                self.changeImage()
                                                self.abledButton()
                                                
                                            }
                                        }
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
    }
    func getRandom(){
        // let deadline = Date().advanced(by: 2)
        //Thread.sleep(until: deadline)
        correctAnswer = Int.random(in: 0...3)
        ivDigimon.image = digimon[correctAnswer]
       
    }
    func changeImage(){
        
        UIView.transition(with: self.ivDigimon,
                          duration: 4.0,
                          options: .transitionCrossDissolve,
                          animations: {
            self.getRandom()
        }, completion: nil)
        getCopi()
     
    }
        
    func getCopi(){
        let nombre = ivDigimon.image!
        copia.append(nombre)
        let nana = copia.count
        tvpreba.text = nana.description
        
   }
    func imageNil(){
        UIView.transition(with: self.ivDigimon,
                          duration: 3.0,
                          options: .transitionCrossDissolve,
                          animations: {
            self.ivDigimon.image = nil
        }, completion: nil)
    }
    func comprobation(){
        if copia.elementsEqual(correcion){
           
            tvpreba.text = "correcto"
        }else {
          
            tvpreba.text = "incorrecto"
            
        }
        
    }
    func checCorretion(numer: Int ){
        if correcion.count == numer {
            comprobation()
            enabledButton()
            
        }
    
    }
    func enabledButton(){
        btAgumon.isEnabled = false
        btGatomon.isEnabled = false
        btGulmon.isEnabled = false
        btVeemon.isEnabled = false
    }
    func abledButton(){
        btAgumon.isEnabled = true
        btGatomon.isEnabled = true
        btGulmon.isEnabled = true
        btVeemon.isEnabled = true
    }
    func checkArray() {
        tvpreba.text = correcion.count.description
        if difucultad == "1"{
            checCorretion(numer: 4)
        }else if difucultad == "2"{
            checCorretion(numer: 5)
        }else {
            checCorretion(numer: 6)
        }
    
    }
}
