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
    var life  = 0
    var vidas = 0
    
    var points  = 0
    var copia : [UIImage?] = []
    var correcion : [UIImage?] = []
    let digimon = [UIImage(named: "agumon"),UIImage(named:  "gatomon"),UIImage(named:  "guilmon"),UIImage(named: "veemon")]
    
    @IBOutlet weak var tvLife: UILabel!
    @IBOutlet weak var tvPoints: UILabel!
    
    @IBOutlet weak var btAgumon: UIButton!
    @IBOutlet weak var btGatomon: UIButton!
    @IBOutlet weak var btGulmon: UIButton!
    @IBOutlet weak var btVeemon: UIButton!
    
    @IBOutlet weak var ivDigimon: UIImageView!
    
    @IBOutlet weak var btRepit: UIBarButtonItem!
    @IBOutlet weak var tvpreba: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        tvpreba.text = difucultad
        btRepit.tintColor = UIColor.gray
        tvPoints.text = "Puntos: \(points.description)"
        levelSelec()
        
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
    @IBAction func repit(_ sender: Any) {
        levelSelec()
    }
    func ezGame(){
        enabledButton()
        btRepit.isEnabled = false
        imageNil()
        DispatchQueue.main.async{
            sleep(3)
            self.changeImage()
            DispatchQueue.main.async {
                sleep(2)
                self.imageNil()
                DispatchQueue.main.async {
                    sleep(3)
                    self.changeImage()
                    DispatchQueue.main.async {
                        sleep(2)
                        self.imageNil()
                        DispatchQueue.main.async {
                            sleep(3)
                            self.changeImage()
                            DispatchQueue.main.async {
                                sleep(2)
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
    func normalGame(){
        enabledButton()
        btRepit.isEnabled = false
        imageNil()
        DispatchQueue.main.async{
            sleep(3)
            self.changeImage()
            DispatchQueue.main.async {
                sleep(2)
                self.imageNil()
                DispatchQueue.main.async {
                    sleep(3)
                    self.changeImage()
                    DispatchQueue.main.async {
                        sleep(2)
                        self.imageNil()
                        DispatchQueue.main.async {
                            sleep(3)
                            self.changeImage()
                            DispatchQueue.main.async {
                                sleep(2)
                                self.imageNil()
                                DispatchQueue.main.async {
                                    sleep(3)
                                    self.changeImage()
                                    DispatchQueue.main.async {
                                        sleep(2)
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
    func difGame(){
        enabledButton()
        btRepit.isEnabled = false
        imageNil()
        DispatchQueue.main.async{
            sleep(3)
            self.changeImage()
            DispatchQueue.main.async {
                sleep(2)
                self.imageNil()
                DispatchQueue.main.async {
                    sleep(3)
                    self.changeImage()
                    DispatchQueue.main.async {
                        sleep(2)
                        self.imageNil()
                        DispatchQueue.main.async {
                            sleep(3)
                            self.changeImage()
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
            sleep(2)
            lifeAndPointos()
            
        }else {
            tvpreba.text = "incorrecto"
            lifeAndPointos()
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
    func levelSelec(){
        if difucultad == "1"{
            vidas = 5
            vidas = vidas - life
            tvLife.text = "Vidas: \(vidas.description)"
            vidas = 5
            ezGame()
            
            
        }else if difucultad == "2"{
            vidas = 3
            vidas -= life
            tvLife.text = "Vidas: \(vidas.description)"
            vidas = 3
            normalGame()
            
        }else {
            vidas = 1
            vidas -= life
            tvLife.text = "Vidas: \(vidas.description)"
            vidas = 1
            
            difGame()
        }
    }
    func lifeAndPointos(){
        if tvpreba.text == "correcto"{
            points += 10
            btRepit.isEnabled = false
            btRepit.tintColor = UIColor.gray
            tvPoints.text = "Puntos: \(points.description)"
            
            if points < 50{
                levelSelec()
                copia.removeAll()
                correcion.removeAll()
            }else{
                tvpreba.text = "nivel superado"
            }
        }else if tvpreba.text == "incorrecto"{
            life += 1
            vidas -= life
            copia.removeAll()
            correcion.removeAll()
            btRepit.isEnabled = true
            btRepit.tintColor = UIColor.blue
            tvLife.text = "Vidas: \(vidas.description)"
            if vidas == 0 {
                tvpreba.text = "GAME OVER"
                btRepit.isEnabled = false
            }
        }
    }
}
