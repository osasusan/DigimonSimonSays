//
//  ViewController.swift
//  Practica1erTrimestre
//
//  Created by Osasu sanchez on 14/11/22.
//

import UIKit

class MainVC: UIViewController {
    
    var numero : String?

  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

  
   // @IBAction func ezGame(_ sender: Any) {
   //     numero = "1"
   //     gm.difucultad = numero
   // }
   //
   // @IBAction func goNormal(_ sender: Any) {
   //     numero = "2"
   //     gm.difucultad = numero
   // }
   //
   // @IBAction func doDif(_ sender: Any) {
   //     numero = "3"
   //     gm.difucultad = numero
   //
   // }
   //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ezGame"{
            let destino = segue.destination as! Game
            numero = "1"
            destino.difucultad = numero!
        }else if segue.identifier == "norGame"{
            let destino = segue.destination as! Game
            numero = "2"
            destino.difucultad = numero!
        }else if segue.identifier == "difGame"{
            let destino = segue.destination as! Game
            numero = "3"
            destino.difucultad = numero!
        }
   
    }
    
}

