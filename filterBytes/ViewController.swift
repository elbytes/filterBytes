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
        }
    }
    
  
    @IBAction func sepia(_ sender: Any) {
        let filter = CIFilter(name: "sepiaFilter")
    }
    
  override func viewDidLoad() {
        super.viewDidLoad()
   }
}

