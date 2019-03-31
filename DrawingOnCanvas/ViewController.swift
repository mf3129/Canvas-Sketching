//
//  ViewController.swift
//  DrawingOnCanvas
//
//  Created by Makan Fofana on 3/30/19.
//  Copyright © 2019 Makan Fofana. All rights reserved.
//

import UIKit

class Canvas: UIView {
    
    
    //Canvas Methods
    
    override func draw(_ rect: CGRect) {
        //Custom Drawing Section
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else
        {return}
        
        //Example/Dummy Points
        //Line to be drawn
        
//        let startingPoint = CGPoint(x: 0, y: 0)
//        let endingPoint = CGPoint(x: 100, y: 100)
//
//        context.move(to: startingPoint)
//        context.addLine(to: endingPoint)
        
        //Defning Properites Of The Line
        context.setStrokeColor(UIColor.blue.cgColor)
        context.setLineWidth(10)
        context.setLineCap(.butt)
        
        lines.forEach { (line) in
            for (i, firstPoint) in line.enumerated() {
                if i == 0 {
                    context.move(to: firstPoint)
                } else {
                    context.addLine(to: firstPoint)
                }
            }
        }
        
        
        context.strokePath()
    }
    
    
    var lines = [[CGPoint]]()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]()) //Adding a new line to the lines array when a new touch is detected.
    }
    
    
    //Tracking the first finger touch
    override func touchesMoved(_ touches: Set<UITouch>, with: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else
        {return}
        //print(point)
        
        guard var lastLine = lines.popLast() else {return}
        lastLine.append(point)
        lines.append(lastLine)

        
        //line.append(point)
        
        setNeedsDisplay()
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

