//
//  SecondViewController.swift
//  coredata database
//
//  Created by Syed.Reshma Ruksana on 21/12/19.
//  Copyright © 2019 Syed.Reshma Ruksana. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var imgButton: UIButton!
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var ageTF: UITextField!
    
    
    @IBOutlet weak var mailID: UITextField!
    
   var imagePicker = UIImagePickerController()

      var imageInData:Data!
      
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
         imgButton.layer.cornerRadius = 85
         
         imgButton.clipsToBounds = true
         
        
         
         nameTF.keyboardType = .asciiCapable
         ageTF.keyboardType = .numberPad
         mailID.keyboardType = .emailAddress
        // Do any additional setup after loading the view.
    }
    
    @IBAction func galleryBtn(_ sender: Any) {
        
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.savedPhotosAlbum)){
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
                imagePicker.allowsEditing = true
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
        {
            
            if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            {
              
              print(pickedImage)
              
              //imgButton.setImage(pickedImage, for: UIControl.State.normal)
              
             imgButton.setBackgroundImage(pickedImage, for: UIControl.State.normal)
              
              imageInData = pickedImage.pngData()
            }
            
               dismiss(animated: true, completion: nil)
        
        
        
        
        
        
        
        
    }
    
    @IBAction func onSaveBtnTap(_ sender: UIButton) {
        
       CRUD.insertValue(entitiyName: "PersonalDetail", key1: "name", value1:nameTF.text!, key2: "mail", value2: mailID.text!, key3: "age", value3: Int16(ageTF.text!)!, key4: "image", value4: imageInData)
       
        

        
    }
    
    
        
    
    

}
