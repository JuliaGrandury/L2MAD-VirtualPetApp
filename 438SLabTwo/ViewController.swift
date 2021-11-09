//
//  ViewController.swift
//  JuliaGrandury-Lab2
//
//  Created by Julia Grandury on 9/16/19.
//  Copyright © 2019 Julia Grandury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var petBackground: UIView!
    
    //buttons background color
    @IBOutlet weak var playColor: UIButton!
    @IBOutlet weak var feedColor: UIButton!
    
    //view background color
    @IBOutlet weak var happColor: UIView!
    @IBOutlet weak var foodColor: UIView!
    
    //total plays and feed labels
    @IBOutlet weak var totalPlaysLabel: UILabel!
    @IBOutlet weak var totalFeedsLabel: UILabel!
    
    
    
    // CREATING THE PETS
    var bird = Pet(happinessValue: 0, nutritionValue: 0, totalPlays: 0, totalFeeds: 0, image: UIImage(named: "bird")!, color: UIColor(red:244/255, green:202/255, blue:148/255, alpha: 1.0))
    var bunny = Pet(happinessValue: 0, nutritionValue: 0, totalPlays: 0, totalFeeds: 0, image: UIImage(named: "bunny")!, color: UIColor(red:0.4, green:1.0, blue:0.2, alpha: 0.5))
    var cat = Pet(happinessValue: 0, nutritionValue: 0, totalPlays: 0, totalFeeds: 0, image: UIImage(named: "cat")!, color: UIColor(red:0.2, green:0.4, blue:1.0, alpha: 0.5))
    var fish = Pet(happinessValue: 0, nutritionValue: 0, totalPlays: 0, totalFeeds: 0, image: UIImage(named: "fish")!, color: UIColor(red:0.4, green:0.2, blue:1.0, alpha: 0.5))
    var dog = Pet(happinessValue: 0, nutritionValue: 0, totalPlays: 0, totalFeeds: 0, image: UIImage(named: "doggo")!, color: UIColor(red:1.0, green:0.3, blue:0.3, alpha: 0.5))
    
    //making current pet
    var currentPet: Pet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentPet = bird
        petImage.alpha = CGFloat(0.2)
    }
    @IBAction func playButt(_ sender: Any) {
        currentPet.play()
        UIView .setAnimationsEnabled(true)
        updateView()
    }
    @IBAction func feedButt(_ sender: Any) {
        currentPet.feed()
        UIView .setAnimationsEnabled(true)
        updateView()
    }
    
    @IBOutlet weak var happinessBar: DisplayView!
    @IBOutlet weak var nutritionBar: DisplayView!
    
    
    @IBAction func birdButt(_ sender: Any) {
        currentPet = bird
        UIView .setAnimationsEnabled(false)
        updateView()
    }
    @IBAction func bunnyButt(_ sender: Any) {
        currentPet = bunny
        UIView .setAnimationsEnabled(false)
        updateView()
    }
    @IBAction func catButt(_ sender: Any) {
        currentPet = cat
        UIView .setAnimationsEnabled(false)
        updateView()
    }
    @IBAction func fishButt(_ sender: Any) {
        currentPet = fish
        UIView .setAnimationsEnabled(false)
        updateView()
    }
    @IBAction func dogButt(_ sender: Any) {
        currentPet = dog
        UIView .setAnimationsEnabled(false)
        updateView()
    }
    
    func updateView(){
        //CREATIVE PORTION: if nutrition value is too low, feed me button becomes red to indicate
        //to the user that the pet needs to be fed
        if (currentPet.nutritionValue<0.2){
            feedColor.tintColor = .red
        }
        else{
            feedColor.tintColor = .black
        }
        petImage.image = currentPet.image
        petBackground.backgroundColor = currentPet.color
        playColor.backgroundColor = currentPet.color
        feedColor.backgroundColor = currentPet.color
        happColor.backgroundColor = currentPet.color
        foodColor.backgroundColor = currentPet.color
        happinessBar.animateValue(to:CGFloat(currentPet.happinessValue))
        nutritionBar.animateValue(to:CGFloat(currentPet.nutritionValue))
        totalPlaysLabel.text = "played: \(currentPet.totalPlays)"
        totalFeedsLabel.text = "fed: \(currentPet.totalFeeds)"
        //CREATIVE PORTION: if nutrition value is low, pet begins to die
        if (currentPet.nutritionValue>0.2){
            petImage.alpha = CGFloat(nutritionBar.value)
        }
        else{
            petImage.alpha = CGFloat(0.2)
        }
    }
}





