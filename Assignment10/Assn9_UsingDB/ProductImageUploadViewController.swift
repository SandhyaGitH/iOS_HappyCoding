//
//  ProductImageUploadViewController.swift
//  Assn9_UsingDB
//
//  Created by Samarth chaturvedi on 12/3/20.
//

import UIKit

class ProductImageUploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let appDelecate = UIApplication.shared.delegate as! AppDelegate
   
    var prodObj = EProduct();
    var currentImage: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Upload Pic"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
        // Do any additional setup after loading the view.
    }
    

    @objc func importPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
       // present(picker, animated: true)
        
        showPhotoMenu();
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }

        dismiss(animated: true)

        currentImage = image
        if let imageData = currentImage?.pngData() {

            appDelecate.saveImage(prodObj,data: imageData)
        }
    }
   /* let actPhoto = UIAlertAction(title: "Take Photo",
          style: .default, handler: { _ in
            self.takePhotoWithCamera();
          })
 
    let actLibrary = UIAlertAction(title: "Choose From Library",
          style: .default, handler: { _ in
            self.choosePhotoFromLibrary();
          }) */
    
    func takePhotoWithCamera() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
      }
    func choosePhotoFromLibrary() {
      let imagePicker = UIImagePickerController()
      imagePicker.sourceType = .photoLibrary
      imagePicker.delegate = self
      imagePicker.allowsEditing = true
      present(imagePicker, animated: true, completion: nil)
    }
    
    func showPhotoMenu() {
      let alert = UIAlertController(title: nil, message: nil,
                           preferredStyle: .actionSheet)

      let actCancel = UIAlertAction(title: "Cancel", style: .cancel,
                                  handler: nil)
      alert.addAction(actCancel)

      let actPhoto = UIAlertAction(title: "Take Photo",
                                   style: .default, handler: nil)
      alert.addAction(  UIAlertAction(title: "Take Photo",
                                                      style: .default, handler: { _ in
                                                        self.takePhotoWithCamera();
                                                      }))

      let actLibrary = UIAlertAction(title: "Choose From Library",
                                     style: .default, handler: nil)
      alert.addAction(UIAlertAction(title: "Choose From Library",
                                    style: .default, handler: { _ in
                                      self.choosePhotoFromLibrary();
                                    })
      )
        
     present(alert, animated: true, completion: nil)
    }
}

