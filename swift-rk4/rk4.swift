//
//  rk4.swift
//  swift-rk4
//
//  Created by Peter Demarest on 6/12/14.
//  Copyright (c) 2014 Peter Demarest. All rights reserved.
//

func RK4step(y: Double[], f: ((Double[], Double) -> Double)[], t: Double, h: Double) -> Double[] {
    
    assert(y.count == f.count, "States and Derivatives must be the same length")
    
    let length = y.count
    
    let t_half_step = t + h / 2.0
    let t_step = t + h
    
    let k1 = Double[](count: length, repeatedValue: 0.0)
    let k2 = Double[](count: length, repeatedValue: 0.0)
    let k3 = Double[](count: length, repeatedValue: 0.0)
    let k4 = Double[](count: length, repeatedValue: 0.0)
    let w = Double[](count: length, repeatedValue: 0.0)
    let result = Double[](count: length, repeatedValue: 0.0)
    
    for i in 0..length {
        k1[i] = h * f[i](y, t)
        w[i] = y[i] + k1[i]/2.0
    }
    
    for i in 0..length {
        k2[i] = h * f[i](w, t_half_step)
        w[i] = y[i] + k2[i]/2.0
    }
    
    for i in 0..length {
        k3[i] = h * f[i](w, t_half_step)
        w[i] = y[i] + k3[i]
    }
    
    for i in 0..length {
        k4[i] = h * f[i](w, t_step)
    }
    
    for i in 0..length {
        result[i] = y[i] + (k1[i] + 2.0*k2[i] + 2.0*k3[i] + k4[i])/6.0
    }
    
    return result;
}

