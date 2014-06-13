//
//  main.swift
//  swift-rk4
//
//  Created by Peter Demarest on 6/12/14.
//  Copyright (c) 2014 Peter Demarest. All rights reserved.
//

import Foundation

println("Hello, World!")

var y = [1.0]

func deriv (y: Double[], t: Double) -> Double {
    return y[0]
}

let f = [deriv]
var t = 0.0
let h = 0.1

while t < 2.0 {
    y = RK4step(y, f, t, h)
    println(y[0])
    t += h
}
