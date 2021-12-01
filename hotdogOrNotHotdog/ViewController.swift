//
//  ViewController.swift
//  imageRecognitionApp
//

//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Delegation design pattern -> Text field: Properties
    
    // Steps to implement a delegate:
    // 1. Create an object
    let imagePicker = UIImagePickerController()
    
    var result: [VNClassificationObservation] = []
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func cameraPressed(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self    // 2. Initialize the delegate
        
        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 1. Select the image
        // 2. Convert this image from UIImage data type into CIImage
        // 3. Detect (CIImage)
    
        
        
    
    // Detect function:
    // 1. Model
    // 2. Request
    // 3. Result
    // 4. Handler
    
    func detect(image: CIImage) {
        // Initialize Model
      
            // Request
      
                // Results -> (0.8, 0.7, 0.3) -> 0.8: Hot Dog
               
            
            
        }
        
    }

}
