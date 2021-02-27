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
        if original == nil {
            return
        }
        
        let filter = CIFilter(name: "CISepiaTone")
        filter?.setValue(05, forKey: kCIInputIntensityKey)
        display(filter: filter!)
        
    }
    
    
    @IBAction func noir(_ sender: Any) {
        if original == nil {
            return
        }
        let filter = CIFilter(name: "CIPhotoEffectNoir")
        display(filter: filter!)
    }
    
    @IBAction func vintage(_ sender: Any) {
        if original == nil {
            return
        }
        let filter = CIFilter(name: "CIPhotoEffectProcess")
        display(filter: filter!)
    }
    
    
    @IBAction func bloom(_ sender: Any) {
        if original == nil {
            return
        }
        let filter = CIFilter(name: "CIBloom")
        filter?.setValue(0.5, forKey: kCIInputIntensityKey)
        filter?.setValue(0.5, forKey: kCIInputRadiusKey)
        display(filter: filter!)
    }
    
    func display(filter: CIFilter){
        filter.setValue(CIImage(image: original!), forKey: kCIInputImageKey)
        let output = filter.outputImage
        displayImage.image = UIImage(cgImage: self.context.createCGImage(output!, from: output!.extent)!)
    }
    
  override func viewDidLoad() {
        super.viewDidLoad()
   }
}

