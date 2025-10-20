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
    var timeLeft = 0
    var points  = 0
    var imageInArray : [UIImage?] = []
    var playerImageArray : [UIImage?] = []
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
        ivDigimon.image = UIImage(named: "calendario")
        tvpreba.text = difucultad
        btRepit.tintColor = UIColor.gray
        tvPoints.text = "Puntos: \(points.description)"
        levelSelec()
       
      
        
        
    }
    @IBAction func addAgumon(_ sender: Any) {
        playerImageArray.append(UIImage(named: "agumon"))
        checkArray()
    }
    @IBAction func addGatomon(_ sender: Any) {
        playerImageArray.append(UIImage(named: "gatomon"))
        checkArray()
    }
    @IBAction func addGuilmon(_ sender: Any) {
        playerImageArray.append(UIImage(named: "guilmon"))
        checkArray()
    }
    @IBAction func addVeemon(_ sender: Any) {
        playerImageArray.append(UIImage(named: "veemon"))
        checkArray()
    }
    @IBAction func repit(_ sender: Any) {
        levelSelec()
    }
    func ezGame(){
       
        btRepit.isEnabled = false
        changeImage(time: 0.75)
        changeImage(time: 1.5)
        changeImage(time: 2.25)
        changeImage(time: 3)
       
    }
    func normalGame(){
       
        btRepit.isEnabled = false
        changeImage(time: 0.75)
        changeImage(time: 1.5)
        changeImage(time: 2.25)
        changeImage(time: 3)
        changeImage(time: 3.75)
        
    }
    func difGame(){
       
        btRepit.isEnabled = false
        changeImage(time: 0.75)
        changeImage(time: 1.5)
        changeImage(time: 2.25)
        changeImage(time: 3)
        changeImage(time: 3.75)
        changeImage(time: 4.5)
        
    }
    func getRandom(){
        correctAnswer = Int.random(in: 0...3)
        ivDigimon.image = digimon[correctAnswer]
        let dvimage = ivDigimon.image
        getCopi(nImage: dvimage!)
    }
    func changeImage(time : TimeInterval){
        DispatchQueue.main.asyncAfter(deadline: .now()+time){
            UIView.transition(with: self.ivDigimon,
                              duration: 0.5,
                              options: .transitionFlipFromRight,
                              animations: {
                self.getRandom()
            }, completion: nil)
        }
    }
    func getCopi(nImage : UIImage){
        
        imageInArray.append(nImage)
        let nana = imageInArray.count
        tvpreba.text = nana.description
    }
    func comprobation(){
        if imageInArray.elementsEqual(playerImageArray){
            tvpreba.text = "correcto"
            sleep(2)
            lifeAndPointos()
        }else {
            tvpreba.text = "incorrecto"
            lifeAndPointos()
        }
    }
    func checkCorrection(numer: Int ){
        if playerImageArray.count == numer {
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
        tvpreba.text = playerImageArray.count.description
        if difucultad == "1"{
            checkCorrection(numer: 4)
        }else if difucultad == "2"{
            checkCorrection(numer: 5)
        }else {
            checkCorrection(numer: 6)
        }
    }
    func levelSelec(){
        enabledButton()
        if difucultad == "1"{
            vidas = 5
            vidas = vidas - life
            tvLife.text = "Vidas: \(vidas.description)"
            vidas = 5
            ezGame()
            let when = DispatchTime.now() + 3
                DispatchQueue.main.asyncAfter(deadline: when){
                    self.abledButton()
                }

        }else if difucultad == "2"{
            vidas = 3
            vidas -= life
            tvLife.text = "Vidas: \(vidas.description)"
            vidas = 3
            normalGame()
            let when = DispatchTime.now() + 3.75
                DispatchQueue.main.asyncAfter(deadline: when){
                    self.abledButton()
                }

        }else {
            vidas = 1
            vidas -= life
            tvLife.text = "Vidas: \(vidas.description)"
            vidas = 1
            difGame()
            let when = DispatchTime.now() + 4.5
                DispatchQueue.main.asyncAfter(deadline: when){
                    self.abledButton()
                }

        }
    }
    func lifeAndPointos(){
        if tvpreba.text == "correcto"{
            points += 10
            btRepit.isEnabled = false
            btRepit.tintColor = UIColor.gray
            tvPoints.text = "Puntos: \(points.description)"
            
            if points < 50{
                imageInArray.removeAll()
                playerImageArray.removeAll()
                levelSelec()
            }else{
                tvpreba.text = "nivel superado"
            }
        }else if tvpreba.text == "incorrecto"{
            life += 1
            vidas -= life
            imageInArray.removeAll()
            playerImageArray.removeAll()
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
