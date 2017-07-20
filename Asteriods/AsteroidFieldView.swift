//
//  AsteroidFieldView.swift
//  Asteriods
//
//  Created by Michael De La Cruz on 7/19/17.
//  Copyright © 2017 Michael De La Cruz. All rights reserved.
//

import UIKit

class AsteroidFieldView: UIView
{
    var asteroidBehavior: AsteroidBehavior? {
        didSet {
            for asteroid in asteroids {
                oldValue?.removeAsteroid(asteroid)
                asteroidBehavior?.addAsteroids(asteroid)
            }
        }
    }
    
    private var asteroids: [AsteroidView] {
        return subviews.flatMap { $0 as? AsteroidView }
    }
    
    var scale: CGFloat = 0.0002 // size of average asteroid (compared to bounds.size)
    var minAsteroidSize: CGFloat = 0.25 // compared to average
    var maxAsteroidSize: CGFloat = 2.00 // compared to average
    
    func addAsteroids(count: Int, exclusionZone: CGRect = CGRect.zero) {
        assert(!bounds.isEmpty, "can't add asteroids to an empty field")
        let averageAsteroidSize = bounds.size * scale
        for _ in 0..<count {
            let asteroid = AsteroidView()
            asteroid.frame.size = (asteroid.frame.size / (asteroid.frame.size.area /
                averageAsteroidSize.area)) * CGFloat.random(in:
                minAsteroidSize..<maxAsteroidSize)
            repeat {
                asteroid.frame.origin = bounds.randomPoint
            } while !exclusionZone.isEmpty && asteroid.frame.intersects(exclusionZone)
            addSubview(asteroid)
            asteroidBehavior?.addAsteroids(asteroid)
        }
    }
    
}
