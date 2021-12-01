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
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
            
            // Convert to CIImage
            imagePicker.dismiss(animated: true, completion: nil)
            
            guard let ciImage = CIImage(image: image) else {
                fatalError("Failed to convert UIImage to CIImage.")
            }
            
            detect(image: ciImage)
        }
    }
    
    // Detect function:
    // 1. Model
    // 2. Request
    // 3. Result
    // 4. Handler
    
    func detect(image: CIImage) {
        // Initialize Model
        if let model = try? VNCoreMLModel(for: Inceptionv3().model) {
            // Request
            let request = VNCoreMLRequest(model: model, completionHandler: { (request, error) in
                // Results -> (0.8, 0.7, 0.3) -> 0.8: Hot Dog
                guard let results = request.results as? [VNClassificationObservation], let topResult = results.first else {
                    fatalError("Could not get the correct data classification value.")
                }
                
                if topResult.identifier.contains("hotdog") {
                    // Using main thread
                    DispatchQueue.main.async {
                        self.navigationItem.title = "Hotdog"
                    }
                }
                else {
                    DispatchQueue.main.async {
                        self.navigationItem.title = "Not Hotdog!"
                    }
                }
            })
            
            // Handler
            let handler = VNImageRequestHandler(ciImage: image)
            do {
                try handler.perform([request])
            }
            catch {
                print(error)
            }
            
        }
        
    }

}
