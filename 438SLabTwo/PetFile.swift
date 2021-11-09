//
//  PetFile.swift
//  JuliaGrandury-Lab2
//
//  Created by Julia Grandury on 9/23/19.
//  Copyright © 2019 Julia Grandury. All rights reserved.
//

import Foundation
import UIKit

class Pet{
    var happinessValue: Double = 0
    var nutritionValue: Double = 0
    var totalPlays: Int = 0
    var totalFeeds: Int = 0
    var image: UIImage
    var color: UIColor
    
    // CONSTRUCTOR FOR BIRD PET
    init(happinessValue: Int, nutritionValue: Int, totalPlays: Int, totalFeeds: Int, image: UIImage, color: UIColor ) {
        self.happinessValue = 0
        self.nutritionValue = 0
        self.totalPlays = 0
        self.totalFeeds = 0
        self.image = image
        self.color = color
    }
    
    // PLAYING FUNCTION
    func play(){
        //if its bigger than 0.1 it can play
        //else it doesnt do anything
        if (nutritionValue>0.1){
            happinessValue += 0.1
            nutritionValue -= 0.1
            totalPlays += 1
        }
        else{
            //feed me dummy
        }
    }
    
    // FEEDING FUNCTION
    func feed(){
        //if its 10 it cant get bigger
        //else it can do its thang
        if (nutritionValue>=1){
            nutritionValue=1
            totalFeeds += 1
        }
        else{
            nutritionValue += 0.1
            totalFeeds = totalFeeds + 1
        }
    }
}


