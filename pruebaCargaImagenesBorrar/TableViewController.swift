//
//  TableViewController.swift
//  pruebaCargaImagenesBorrar
//
//  Created by guitarrkurt on 23/06/15.
//  Copyright (c) 2015 BUAP. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var arrayImage:[UIImage] = [UIImage]()
    var imageStringArray:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conexion()
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return imageStringArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellPromos", forIndexPath: indexPath) as! TableViewCell
        cell.imageCell.image = arrayImage[indexPath.row]

        return cell
    }
    
    func conexion(){
        let url=NSURL(string:"http://supremasalsa.azurewebsites.net/movil/promo.php")
        let allContactsData=NSData(contentsOfURL:url!)
        var allContacts: AnyObject! = NSJSONSerialization.JSONObjectWithData(allContactsData!, options: NSJSONReadingOptions(0), error: nil)

        if let arrayJson = allContacts as? Array<AnyObject> {
            for index in 0...arrayJson.count-1 {
                println("ditco")
                
                let contact : AnyObject? = arrayJson[index]
                let collection = contact! as! Dictionary<String, AnyObject>
                let image : AnyObject? = collection["imagen"]
                println("Image: \(image)")
                var url = "http://supremasalsa.azurewebsites.net" + (image as! NSString).substringFromIndex(2)
                //era con 16
                println("url: \(url)")
                imageStringArray.append(url)
                println("imageStringArray: \(imageStringArray[index])")
                var formatoURLImage: NSURL = NSURL(string: imageStringArray[index])!
                var imageData: NSData = NSData(contentsOfURL: formatoURLImage)!
                arrayImage.append(UIImage(data: imageData)!)
                
            }
        }
    }
}
