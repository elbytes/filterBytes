//
//  ViewController.swift
//  filterBytes
//
//  Created by xcode on 2/20/21.
//  Copyright © 2021 elBytes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var displayImage: UIImageView!
    
    @IBAction func choosePhoto(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true,
                                          completion: nil)
        }
    }
    

  override func viewDidLoad() {
        super.viewDidLoad()
   }
}

