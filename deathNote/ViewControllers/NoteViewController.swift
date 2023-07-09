//
//  NoteViewController.swift
//  deathNote
//
//  Created by Anastasia Nevodchikova on 08.07.2023.
//

import UIKit

class NoteViewController: UIViewController {

    private let noteView: NoteView = {
        let view = NoteView()
        return view
    }()
    
    override func loadView() {
        super.loadView()
    
        view = noteView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        noteView.nameTextField.delegate = self
        noteView.descriptionTextField.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveNote))
        navigationItem.leftBarButtonItem?.target = self
        navigationItem.leftBarButtonItem?.action = #selector(backAction)
        navigationItem.title = "Add a Person"
    }
    
}

//MARK: Private functions
private extension NoteViewController {
    @objc func saveNote() {
        navigationController?.popViewController(animated: true)
        //validate empty fields and selected date
        //send data
    }
    
    @objc func backAction() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: UITextFieldDelegate
extension NoteViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            // return NO to disallow editing.
            print("TextField should begin editing method called")
            return true
        }

        func textFieldDidBeginEditing(_ textField: UITextField) {
            // became first responder
            print("TextField did begin editing method called")
            
        }

        func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
            // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
            print("TextField should snd editing method called")
            return true
        }

        func textFieldDidEndEditing(_ textField: UITextField) {
            // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
            print("TextField did end editing method called")
        }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
            // if implemented, called in place of textFieldDidEndEditing:
            print("TextField did end editing with reason method called")
        }

        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            // return NO to not change text
            print("While entering the characters this method gets called")
            return true
        }

        func textFieldShouldClear(_ textField: UITextField) -> Bool {
            // called when clear button pressed. return NO to ignore (no notifications)
            print("TextField should clear method called")
            return true
        }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            // called when 'return' key pressed. return NO to ignore.
            print("TextField should return method called")
            // may be useful: textField.resignFirstResponder()
            return true
        }
}
