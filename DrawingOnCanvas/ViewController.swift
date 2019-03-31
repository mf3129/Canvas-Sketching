//
//  ViewController.swift
//  DrawingOnCanvas
//
//  Created by Makan Fofana on 3/30/19.
//  Copyright © 2019 Makan Fofana. All rights reserved.
//

import UIKit

class Canvas: UIView {
    
    override func draw(_ rect: CGRect) {
        //Custom Drawing Section
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else
        {return}
        
        //Line to be drawn
        let startingPoint = CGPoint(x: 0, y: 0)
        let endingPoint = CGPoint(x: 100, y: 100)
        
        context.move(to: startingPoint)
        context.addLine(to: endingPoint)
        
        context.strokePath()
        
    }
    
    //Tracking the first finger touch
    override func touchesMoved(_ touches: Set<UITouch>, with: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else
        {return}
        print(point)
    }
    
    
}

class ViewController: UIViewController {
    
    let canvas = Canvas()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(canvas)
        canvas.backgroundColor = .white
        canvas.frame = view.frame
    }


}
