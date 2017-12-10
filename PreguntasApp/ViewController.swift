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
    var numPasoPregunta : Int = 0
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
    
    func preparaYMuestraPregunta(numPregunta : Int){
        let alertController = UIAlertController(title: "\n\n\n", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let margin:CGFloat = 2.0
        
        let lblTitle = UILabel(frame: CGRect(x: margin, y: margin, width: alertController.view.bounds.size.width - margin * 4.0, height: 100.0))
        lblTitle.textAlignment = .center
        lblTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        
        let lblQuestion = UILabel(frame: CGRect(x: margin, y: margin+25, width: alertController.view.bounds.size.width - margin * 4.0, height: 100.0))
        lblQuestion.font = UIFont(name: "Helvetica", size: 15)
        lblQuestion.textAlignment = .center
        
        lblTitle.text = "Pregunta \(self.numPasoPregunta+1)"
        lblQuestion.text = self.preguntas[self.numPasoPregunta].titulo
        
        alertController.view.addSubview(lblTitle)
        alertController.view.addSubview(lblQuestion)
        
        let somethingAction = UIAlertAction(title: self.preguntas[self.numPasoPregunta].respuesta1, style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in self.sumaRespuestaCorrecta(respuesta: self.preguntas[self.numPasoPregunta].respuestaCorrecta==1)
        })
        let somethingAction2 = UIAlertAction(title: self.preguntas[self.numPasoPregunta].respuesta2, style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in self.sumaRespuestaCorrecta(respuesta: self.preguntas[self.numPasoPregunta].respuestaCorrecta==2)
        })
        let somethingAction3 = UIAlertAction(title: self.preguntas[self.numPasoPregunta].respuesta3, style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in self.sumaRespuestaCorrecta(respuesta: self.preguntas[self.numPasoPregunta].respuestaCorrecta==3)
        })
        let somethingAction4 = UIAlertAction(title:self.preguntas[self.numPasoPregunta].respuesta4, style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in self.sumaRespuestaCorrecta(respuesta: self.preguntas[self.numPasoPregunta].respuestaCorrecta==4)
        })
        
        alertController.addAction(somethingAction)
        alertController.addAction(somethingAction2)
        alertController.addAction(somethingAction3)
        alertController.addAction(somethingAction4)
        
        self.present(alertController, animated: true, completion:{})
    }
    
    func generadorDePreguntas()
    {
        preparaYMuestraPregunta(numPregunta: self.numPasoPregunta)
    }
    
    func sumaRespuestaCorrecta(respuesta : Bool){
        if (respuesta){
            self.preguntasCorrectas += 1
        }
        self.numPasoPregunta += 1
        if (self.numPasoPregunta>=4){
            lblResult.alpha = 1
        }
        else{
            preparaYMuestraPregunta(numPregunta: self.numPasoPregunta)
        }
       
    }
    
    @IBAction func btnStartGame(_ sender: UIButton) {
        btnStartGame.alpha = 0
        if (self.versionMayorIOS8){
            generadorDePreguntas()
        }

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

