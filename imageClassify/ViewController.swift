//
//  ViewController.swift
//  imageClassify
//
//  Created by Jayashree Kalpathy-Cramer on 1/29/18.
//  Copyright © 2018 Jayashree Kalpathy-Cramer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imgDisplay: UIImageView!
    @IBOutlet weak var myLabel: UILabel!

    var ourPicker = UIImagePickerController()
    var anImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myLabel.text="hello world"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func myButton(_ sender: Any) {
        
            ourPicker.delegate = self
        
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            
            print("got a camera")

            ourPicker.sourceType = .camera

            ourPicker.cameraCaptureMode = .photo
            ourPicker.cameraDevice = .rear
        
            print("configured...")
            
            self.present(ourPicker, animated: true, completion: {
                print("back from presenting?")
            })
            
        } else {
            print("No camera available?")
            
//            ourPicker.sourceType = .photoLibrary
        }
        
        
        

        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("done picking!")
        
        anImage = info[UIImagePickerControllerOriginalImage] as! UIImage?
        
        if let im = anImage {
            self.myLabel.text = "\(im.size.width) x \(im.size.height)"
            self.imgDisplay.image=im
        }
        
        picker.dismiss(animated: true) { 
            print("Done dismissing?")
        }
    }

}

