//
//  CreateTaskScreenController.swift
//  TodoAppUiKit
//
//  Created by macbook pro on 09/07/24.
//

import UIKit

class CreateTaskScreenController: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var vm: MainViewModel? = nil
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var imageTask: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageTask.image = UIImage(resource: .placeholder)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageTask.isUserInteractionEnabled = true
        imageTask.addGestureRecognizer(tapGestureRecognizer)
        
        date.minimumDate = Date.now
    
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)

    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        imageTask.image = image
        
        dismiss(animated: true)
    }

    
    
    @IBAction func saveTask(_ sender: Any) {
            
        if(validation()){
            showAlertError()
        }else{
            vm?.addTask(task: TaskData(
                id: UUID().uuidString,
                title: titleTextField.text ?? "",
                descreption:descriptionTextField.text,
                date: date.date,
                image: imageTask.image))
            
            showAlertSuccess()
        }
    }
    
    func validation()-> Bool{
        return titleTextField.text?.isEmpty ?? true
    }
    
    func showAlertError(){
        let alert = UIAlertController(title: "Error", message: "Title is empty", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: NSLocalizedString("Close Alert", comment: "This closes alert"), style: .default, handler: { _ in
               }))
               self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertSuccess(){
        let alert = UIAlertController(title: "Success", message: "Your task added", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: NSLocalizedString("Back to home", comment: "Back to home"), style: .default, handler: { _ in
            self.navigationController?.popToRootViewController(animated: true)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
