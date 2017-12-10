//
//  ViewController.swift
//  PreguntasApp
//
//  Created by Administrator on 9/12/17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    struct Pregunta {
        let titulo: String
        let respuesta1: String
        let respuesta2: String
        let respuesta3: String
        let respuesta4: String
        let respuestaCorrecta: Int
    }
    
    @IBOutlet weak var btnStartGame: UIButton!
    @IBOutlet weak var lblResult: UILabel!
    var versionMayorIOS8 : Bool = false
    var preguntasCorrectas : Int = 0
    //var preguntasJuego :[(name: String, value: Int)] = []
    /********************************************************
     INICIALIZAMOS PREGUNTAS
    ********************************************************/
    let preguntas : Array<Pregunta> = [
        Pregunta(titulo: "¿Cuál es la moneda oficial de España?" , respuesta1: "Dolar", respuesta2: "Euro", respuesta3: "Yen", respuesta4: "Peseta", respuestaCorrecta: 2),
        Pregunta(titulo: "¿Cuál es el mejor jugador de futbol del mundo?" , respuesta1: "Cristiano", respuesta2: "Messi", respuesta3: "Griezman", respuesta4: "Iniesta", respuestaCorrecta: 2),
        Pregunta(titulo: "¿Cuál es la capital de Francia?" , respuesta1: "Paris", respuesta2: "Rennes", respuesta3: "Marsella", respuesta4: "Lion", respuestaCorrecta: 1),
        Pregunta(titulo: "¿Qué número representado en binario es igual a 2012?" , respuesta1: "11111110100", respuesta2: "11111011101", respuesta3: "11111001110", respuesta4: "11111011100", respuestaCorrecta: 2)
        ]
    /********************************************************
     FIN PREGUNTAS
     ********************************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblResult.text = "Has respondido correctamente a \(preguntasCorrectas) de 4 preguntas"
        lblResult.textColor = UIColor.black
        lblResult.alpha = 0
    }
    
    @objc func versionHigherThan8(){
        generadorDePreguntas()
    }
    @objc func versionLowerThan8(){
        
    }
    
    func preparaYMuestraPregunta(){
        
    }
    
    func generadorDePreguntas()
    {
        
        let alertController = UIAlertController(title: "\n\n\n", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let margin:CGFloat = 2.0

        let lblTitle = UILabel(frame: CGRect(x: margin, y: margin, width: alertController.view.bounds.size.width - margin * 4.0, height: 100.0))
        lblTitle.textAlignment = .center
        lblTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        
        let lblQuestion = UILabel(frame: CGRect(x: margin, y: margin+25, width: alertController.view.bounds.size.width - margin * 4.0, height: 100.0))
        lblQuestion.font = UIFont(name: "Helvetica", size: 15)
        lblQuestion.textAlignment = .center

        preparaYMuestraPregunta(0)
        var txtTituloPregunta = "Pregunta 1"
        var txtPregunta = "¿Cuál es la moneda oficial de España?"
        
        lblTitle.text = txtTituloPregunta
        lblQuestion.text = txtPregunta
    
        alertController.view.addSubview(lblTitle)
        alertController.view.addSubview(lblQuestion)
        
        let somethingAction = UIAlertAction(title: "Opcion1", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in print("opcion1")
        })
        let somethingAction2 = UIAlertAction(title: "Opcion2", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in print("Opcion2")
        })
        let somethingAction3 = UIAlertAction(title: "Opcion3", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in print("opcion3")
        })
        let somethingAction4 = UIAlertAction(title: "Opcion4", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in print("opcion4")
        })

        alertController.addAction(somethingAction)
        alertController.addAction(somethingAction2)
        alertController.addAction(somethingAction3)
        alertController.addAction(somethingAction4)
        
        self.present(alertController, animated: true, completion:{})
    
    }
    
    @IBAction func btnStartGame(_ sender: UIButton) {
        btnStartGame.alpha = 0
        if (self.versionMayorIOS8){
            popUpController()
        }
        
        //lblResult.alpha = 1
    }

    override func viewDidAppear(_ animated: Bool) {
        switch UIDevice.current.systemVersion.compare("8.0.0",options:NSString.CompareOptions.numeric) {
        case .orderedSame, .orderedDescending:
            self.versionMayorIOS8 = true
        case .orderedAscending:
            self.versionMayorIOS8 = false
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

