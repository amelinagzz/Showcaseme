//
//  DataService.swift
//  Showcaseme
//
//  Created by Adriana Gonzalez on 2/17/16.
//  Copyright © 2016 Adriana Gonzalez. All rights reserved.
//

import Foundation
import Firebase

class DataService{
    static let ds = DataService()
    
    private var _REF_BASE = Firebase(url: "https://showcasemeapp.firebaseio.com")
    
    var REF_BASE: Firebase {
        return _REF_BASE
    }
    
}