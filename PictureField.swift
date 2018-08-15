//
//  PictureField.swift
//  ControlExperiment2
//
//  Created by Ash Duckett on 10/07/2018.
//  Copyright © 2018 Ash Duckett. All rights reserved.
//

import UIKit

class PictureField: NewmanField, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //
    //  TextFieldPairView.swift
    //  ControlExperiment2
    //
    //  Created by Ash Duckett on 08/07/2018.
    //  Copyright © 2018 Ash Duckett. All rights reserved.
    //
    
    let imagePicker = UIImagePickerController()
    var viewController: UIViewController?
    
    init(placeholders: [String], delegate: NewmanFormViewController, textFieldCount: Int, viewController: UIViewController, type: NewmanFieldType) {
        super.init(frame: CGRect.zero, delegate: delegate, textFieldCount: textFieldCount, placeholders: placeholders, type: type)
        self.viewController = viewController
        imagePicker.delegate = self
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    @objc func pictureFieldTapped() {
        //print("Method fired")
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        self.delegate?.present(imagePicker, animated: true, completion: nil)
    }
    
    override func setupViewHierarchy() {
        super.setupHorizontalSubview()
        addSubview(horizontalSubview)
        textFields![0].addTarget(self, action: #selector(pictureFieldTapped), for: .touchDown)
        
        textFields![0].layer.masksToBounds = true
        textFields![0].layer.borderWidth = 1
        
        textFields![0].layer.borderColor = UIColor.orange.cgColor
        
        let image = UIImage(named: "cameraIcon")
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: (image?.size.width)!, height: (image?.size.height)!))
        imageView.image = image
        
        textFields![0].rightView = imageView
        textFields![0].rightViewMode = .always
        
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
       // print(info)
    }

}
