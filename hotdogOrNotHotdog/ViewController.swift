//
//  ViewController.swift
//  hotdogOrNotHotdog
//
//  Created by Karan Gandhi on 11/29/21.
//

import UIKit
import CoreML
import Vision


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    
    
    
    
    // Delegation design pattern -> Text field: Properties
    
    // Steps to implement a delegate:
    // 1. Create an object
    
    let imagePicker = UIImagePickerController()
    let results : [VNClassificationObservation] = []
    
//Type Annotation    //[0.8, 0.4, 0.3] -> 0.8 -> Hotdog
    
    

    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //2. Initialize the delegate in View Did Load
        imagePicker.delegate = self
        
        
        
        
    }
    

    

    @IBAction func cameraPressed(_ sender: UIBarButtonItem) {
        
        imagePicker.sourceType = .camera
        
        
        
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        
        
        
    }
    
    
    func detect(){
        
        
    }
    
}

