//
//  DadJokes.swift
//  iKid
//
//  Created by ishansaksena on 4/26/16.
//  Copyright © 2016 ishansaksena. All rights reserved.
//

import Foundation

public class DadJokes {
    // Following setup: punchline
    var jokes: [String: String] = [String: String]()
    
    // Entering all the data
    public init() {
        jokes["Reversing the car..."] = "\"Ahh, this takes me back.\""
        jokes["Every time I stubbed my toe as a kid,"] = "my dad would ask if he should call a toe truck."
        jokes["Was talking about drugs at the dinner table (can't remember what brought up the discussion). \nDad: I used to be addicted to the hokey pokey \nRest of us: ???"] = "Dad: But then I turned myself around."
        jokes["What do you call a man with no nose and no body?"] = "Nobody nose."
        jokes[""] = ""
    }
    
    public func addJoke(joke: String) {
        
    }
}