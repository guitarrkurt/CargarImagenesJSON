//
//  ViewController.swift
//  pruebaCargaImagenesBorrar
//
//  Created by guitarrkurt on 22/06/15.
//  Copyright (c) 2015 BUAP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var recievedData : NSMutableData?
    var imagenArray = [UIImage]()
    var imageStringArray = [String]()
    
    @IBOutlet weak var imagePrincipal: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recievedData = NSMutableData(capacity: 0)
        
        
        
        let url=NSURL(string:"http://supremasalsa.azurewebsites.net/movil/promo.php")
        let allContactsData=NSData(contentsOfURL:url!)
        var allContacts: AnyObject! = NSJSONSerialization.JSONObjectWithData(allContactsData!, options: NSJSONReadingOptions(0), error: nil)
        

        if let arrayJson = allContacts as? Array<AnyObject> {
            println("Entro al if")
            for index in 0...arrayJson.count-1 {
                println("Entro al ciclo")
                let contact : AnyObject? = arrayJson[index]

                let collection = contact! as! Dictionary<String, AnyObject>

                let image : AnyObject? = collection["imagen"]

                imageStringArray.append(image as! String)

            }
        }
        
        //Llenamos los campos
        var URLSinPuntos: String = (self.imageStringArray[0] as NSString).substringFromIndex(16)
        var URLEntera = "http://supremasalsa.azurewebsites.net" + URLSinPuntos
        println("URLEntera: \(URLEntera)")
        var formatoURLImage: NSURL = NSURL(string: URLEntera)!
        var imageData: NSData = NSData(contentsOfURL: formatoURLImage)!
        self.imagenArray.append(UIImage(data: imageData)!)
        imagePrincipal.image = imagenArray[0]
        
        println("Salimos del ciclo")
        println("imageStringArray: \(imageStringArray)")
        //println("El arreglo de imagenes es: \(imagenArray)")
    }
    
}

