//
//  ViewController.swift
//  Photo Frame
//
//  Created by Paul Baker on 3/19/19.
//  Copyright © 2019 Paul Baker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet var photoView: UIImageView!
    let photoStore = PhotoStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoView!.image = photoStore.getPhoto()
    }

    @IBAction func takePicture(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .savedPhotosAlbum
        }
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.originalImage] as! UIImage
        photoView.image = image
        photoStore.savePhoto(image: image)
        picker.dismiss(animated: true, completion: nil)
        print("image saved")
    }
    
}

