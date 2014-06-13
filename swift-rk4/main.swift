//
//  main.swift
//  swift-rk4
//
//  Created by Peter Demarest on 6/12/14.
//  Copyright (c) 2014 Peter Demarest. All rights reserved.
//
import Foundation

func test_exp(){
    // Integrate: y' = y
    // y_0 = 1.0
    // from 0 to 2.0
    
    var y = [1.0]
    
    func deriv (y: Double[], t: Double) -> Double {
        return y[0]
    }
    
    let f = [deriv]
    var t = 0.0
    let h = 0.1
    
    
    while t < 2.0 {
        y = RK4step(y, f, t, h)
        t += h
    }

    let exact = exp(2.0)
    let error = y[0] - exact
    
    assert(error < pow(h, 4.0))
    println("y: \(y[0]) exact: \(exact) error: \(error)")

}


println("testing...")

test_exp()
