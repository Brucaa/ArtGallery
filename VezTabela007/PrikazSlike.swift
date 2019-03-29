//
//  ImageView.swift
//  VezTabela007
//
//  Created by Milos Jovanovic on 08/03/2019.
//  Copyright © 2019 Milos Jovanovic. All rights reserved.
//

import UIKit

class ImageView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareImage))
        
        addPinchGesture()
        addPanGesture()
        
    }
    

    @IBOutlet weak var prikazVeci: UIImageView!

    
    var startSize = CGSize()
    var startPoint: CGPoint?
    
    func addPinchGesture() {
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(sender:)))
        self.prikazVeci.addGestureRecognizer(pinch)
    }
    
    
    @objc func handlePinch(sender: UIPinchGestureRecognizer) {

        let scale = sender.scale

        if sender.state == .began {
            startSize = prikazVeci.frame.size
        } else if sender.state == .changed {
            prikazVeci.frame.size.width = startSize.width * scale
            prikazVeci.frame.size.height = startSize.height * scale
            prikazVeci.center = view.center
        } else {
            startSize = CGSize()
        }

    }
    
    @objc func shareImage() {
        let vc = UIActivityViewController(activityItems: [prikazVeci.image!], applicationActivities: [])
        present(vc, animated: true)
    }
    
    
    func addPanGesture() {
        prikazVeci.isUserInteractionEnabled = true
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.view.addGestureRecognizer(pan)
    }
    
    @objc
    func handlePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        prikazVeci.center = CGPoint(x: prikazVeci.center.x + translation.x, y: prikazVeci.center.y)
        sender.setTranslation(CGPoint.zero, in: view)
        print(sender.translation(in: view))
    }
    
    

}
