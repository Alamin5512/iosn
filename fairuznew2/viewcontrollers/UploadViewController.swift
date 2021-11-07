//
//  UploadViewController.swift
//  fairuznew2
//
//  Created by kuetcse on 4/11/21.
//  Copyright © 2021 kuet. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
//import XCTest
//import Kingfisher
//import Photos
//import BSImagePicker



class UploadViewController: UIViewController, UIImagePickerControllerDelegate {

    @IBOutlet weak var pname: UITextField!
    @IBOutlet weak var pdetails: UITextField!
    @IBOutlet weak var pprice: UITextField!
    @IBOutlet weak var plocation: UITextField!
    @IBOutlet weak var uimage: UIImageView!
    @IBOutlet weak var upload: UIButton!
    @IBOutlet weak var uploadImage: UIImageView!
    @IBOutlet weak var upload: UIButton!
    @IBOutlet weak var error: UILabel!
    
    
    private let database = Database.database().reference()
   // @IBOutlet weak var
   // var SelectedAssets = [PHAsset]{}
   // var PhotoArray = [UIImage]
    var filename = "abc.jpg"
    var imageReference: StorageReference {
        return Storage.storage ().reference.child("image")
    }
  
    
    func setUpElements() {
    
        errorLabel.alpha = 0
        
        Utilities.styleTextField(pname)
        Utilities.styleTextField(pdetails)
        Utilities.styleTextField(plocation)
        Utilities.styleTextField(pprice)
        //Utilities.style
        Utilities.styleFilledButton(upload)
    }
    
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if pname.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            pdetails.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            pprice.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            plocation.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
    
    
        
        
        @IBAction func uploadTapped(_ sender: Any) {
            
            let error = validateFields()
            
            if error != nil {
                
                // There's something wrong with the fields, show error message
                showError(error!)
            }
            else {
                
                // Create cleaned versions of the data
                let pname = pnameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let pdetails = pdetailsTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let pprice = ppricTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let plocation = plocationTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                
                let product : [ String : AnyObject] = ["pname" : pname,"pdetails" : pdetails,"pprice" : pprice,"plocation" : plocation]
                  database.child("Product_\(Int.random(in: 0..<100))").setvalue(product)  in
                    // Check for errors
                    if err != nil {
                        
                        self.showError("Error creating product details")
                    }
                    else {
                        
                        let db = Firestore.firestore()
                        
                        db.collection("prdocts").addDocument(data: ["pname":pname, "pdetails":pdetails, "pprice":pprice,"plocation":plocation, "uid": result!.products.uid ]) { (error) in
                            
                            if error != nil {
                                // Show error message
                                self.showError("Error saving user data")
                            }
                        }
                       
                    }
                    
                }
                
                
                
            }

            
        }
        
        func showError(_ message:String) {
            
            errorLabel.text = message
            errorLabel.alpha = 1
        }
        
        
        
        
        
    
    /*
    
    
    
    
    
    
    @IBAction func uimageClicked(_sender: Any){
    
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func onUploadTapped(){
        guard let image = ImageView.image else { return }
        guard let imageData = UIImageJPEGRepresentation(image,1) else { return }
        
        let uploadImageRef = imageReference.child(filename)
        
        let uploadTask =  imageReference.putData(data, metadata: null) { (metadata ,err ) in if let err = err{
            presentAlter(title: "Error", message: err.localizedDescription)
            return
        }
        }
    }
  */

}
