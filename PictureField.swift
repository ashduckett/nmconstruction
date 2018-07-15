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
    
    init(placeholders: [String], delegate: ViewController, textFieldCount: Int, viewController: UIViewController) {
        super.init(frame: CGRect.zero, delegate: delegate, textFieldCount: textFieldCount, placeholders: placeholders)
        self.viewController = viewController
        imagePicker.delegate = self
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    @objc func pictureFieldTapped() {
        print("Method fired")
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        self.delegate?.present(imagePicker, animated: true, completion: nil)
    }
    
    override func setupViewHierarchy() {
        super.setupHorizontalSubview()
        addSubview(horizontalSubview)
        textFields![0].addTarget(self, action: #selector(pictureFieldTapped), for: .touchDown)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info)
    }

}
