//
//  ViewController.swift
//  VezTabela007
//
//  Created by Milos Jovanovic on 03/02/2019.
//  Copyright © 2019 Milos Jovanovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let slike = [
        Painting(artist: "Jasper Johns", name: "Rocking Lady", style: "Oil & Acrylic Color", size: "91 x 91cm", price: "110e"),
        Painting(artist: "Dorothea Sharp", name: "The Path", style: "Oil Color", size: "60 x 60cm", price: "172e"),
        Painting(artist: "Edward Brian", name: "I Love Life", style: "Oil & Acrylic Color", size: "60 x 90cm", price: "93e"),
        Painting(artist: "Adrianus Eversen", name: "Drizzle In The City", style: "Oil & Acrylic Color", size: "70 x 100cm", price: "160e"),
        Painting(artist: "Vekkas M", name: "A Window", style: "Acrylic Colors", size: "120 x 120cm", price: "105e"),
        Painting(artist: "Andrea Landini", name: "Engrossed", style: "Oil & Acrylic Color", size: "70 x 100cm", price: "108e"),
        Painting(artist: "Eduard Cortes", name: "Mondrian Inspired", style: "Oil & Acrylic Color", size: "70 x 120cm", price: "98e"),
        Painting(artist: "Cesare Ciani", name: "Desert Sun", style: "Oil & Acrylic Color", size: "90 x 90cm", price: "220e"),
        Painting(artist: "Vekkas M", name: "Boat Landscape", style: "Oil & Acrylic Color", size: "120 x 120cm", price: "125e")
    
    
    ]
    

    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var prikazVeci: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.myTable.dataSource = self
        self.myTable.delegate = self
        
        self.view.backgroundColor = .white
    }
    
    @IBAction func unwindToViewController(unwindSegue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toImage") {
            let view = segue.destination as! ImageView
            
            DispatchQueue.main.async {
                view.prikazVeci.image =  UIImage(named: self.slike[self.myTable.indexPathForSelectedRow!.row].name + ".jpg")
                
            }
            
        }
    }


}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return slike.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "mojaCelija", for: indexPath) as! mojaCelijaPodaci
        
        cell.ime.text = slike[indexPath.row].artist
        cell.nazivSlike.text = slike[indexPath.row].name
        cell.stil.text = slike[indexPath.row].style
        cell.velicina.text = slike[indexPath.row].size
        cell.cena.text = slike[indexPath.row].price
        cell.prikazManji.image = UIImage(named: slike[indexPath.row].name + ".jpg")
        cell.layer.borderWidth = CGFloat(8)
        cell.layer.borderColor = tableView.backgroundColor?.cgColor
        cell.layer.cornerRadius = 15
        cell.backgroundColor = .white
        
        return cell
    }


    
}


