//
//  ViewController.swift
//  filterBytes
//
//  Created by xcode on 2/20/21.
//  Copyright © 2021 elBytes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let context = CIContext()
    var original: UIImage?
    
    @IBOutlet weak var displayImage: UIImageView!
    
    @IBAction func choosePhoto(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            navigationController?.present(imagePicker, animated: true,
                                          completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        navigationController?.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            displayImage.image = image
            original = image
        }
    }
    
  
    @IBAction func sepia(_ sender: Any) {
        guard let original = original else {
            return
        }
        let filter = CIFilter(name: "sepiaFilter")
        filter?.setValue(0.5, forKey: kCIInputIntensityKey)
        filter?.setValue(CIImage(image: original), forKey: kCIInputImageKey)
        let output = filter?.outputImage
        displayImage.image = UIImage(cgImage: self.context.createCGImage(output!, from: output!.extent)!)
    }
    
    
    @IBAction func noir(_ sender: Any) {
        
    }
    
    @IBAction func vintage(_ sender: Any) {
    }
    
  override func viewDidLoad() {
        super.viewDidLoad()
   }
}

