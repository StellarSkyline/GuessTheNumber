//
//  ViewController.swift
//  FinalProject-ST
//
//  Created by Seth Osric Torralba on 11/29/18.
//  Copyright © 2018 Seth Osric Torralba. All rights reserved.
//

// To do: finish implementing Input and Reset Button - implement hints
// List of stuff done: Number buttons work - Score label works

import UIKit

class ViewController: UIViewController {
    
    //Supplementary Elements created at program start
    var inputString:String = "0"                                            //Create a string element
    let myGame = Game()                                                  //Create Game object from Game.swift class file seperated
    var guess:String = "Guessed Numbers: "                     //Create a String to store guessed numbers
    
    //Label Objects
    @IBOutlet weak var labelHints: UILabel!                     // Hints lael to display hints
    @IBOutlet weak var labelScore: UILabel!                    // Score label to display current score (Score has a max of 100 that decreases by 25 every wrong attempt)
    @IBOutlet weak var labelInput: UILabel!                     // Input Label to display current entered buttons
    @IBOutlet weak var labelRandomNum: UILabel!
    @IBOutlet weak var labelGuess: UILabel!                  // Label to Display the user gussed numbers
    
    
    //NumberButtons
    /*
     Action Event handler for the number buttons 0-9. This reads the label text from the button properties
     stores it into inputString. This also calls the update text function.
 
     */
    @IBAction func buttonNumbers(_ sender: UIButton) {
        let buttonValue:String? = sender.titleLabel?.text      // Create a buttonValue Optional String element and stores the optional label value into it
        inputString = inputString.appending(buttonValue!)   // store button value in input String
        updateText()                                                             // Calls updateText() function
    }
    
    @IBAction func buttonInput(_ sender: Any) {
        myGame.compareNum()                                         // Calls the compareNums function
        labelScore.text = String(myGame.getScore())        // Changes display score text box to show game score
        
        if(myGame.getScore() > 0) {                                   // Compares game score to 0, if not 0 proceed to change hints, if 0 display you lose
            labelHints.text = myGame.getHints()
        }
        else if( myGame.getScore() == 0) {
            labelHints.text = "You Lose try again?"
            labelRandomNum.text = "The number was " + String(myGame.getRandomNum())
        }
        guess = guess + String(myGame.getUserInput())  + " "
        labelGuess.text = guess
        
        
        resetView()                                                             // Calls resetView() function
    }
    
    @IBAction func buttonReset(_ sender: Any) {
        resetView()
        labelCheat.text = " "
        labelHints.text = "Hints"
        myGame.resetGame()
        labelScore.text = String(myGame.getScore())
        guess = "Guessed Numbers: "
        labelGuess.text = " "
        labelRandomNum.text = " "
    }
    
    
    //This function is auto generated with each ios project,
    //Anything you want loaded before the application start is put here
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        labelScore.text = String(myGame.getScore())
    }
    
    //Resets display view
    func resetView() {
        inputString = "0"
        labelInput.text = "0"
        
    }
    
    //updates text labels
    func updateText() {
        guard let chkValue:Int = Int(inputString) else {return}             // Checks if inputString can be converted to Int. This is swifts equivalent to try and catch statements
        myGame.setUserInput(inputIN: chkValue)                             // Calls setUserInput function and pass in chkValue
        labelInput.text = String(myGame.getUserInput())
        
        
    }
    
    //Cheat Codeeee!
    
    @IBOutlet weak var labelCheat: UILabel!
    
    @IBAction func buttonCheat(_ sender: Any) {
        labelCheat.text = String(myGame.getRandomNum())
        
    }
    
    
}

