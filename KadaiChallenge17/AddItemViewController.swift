//
//  AddItemViewController.swift
//  KadaiChallenge17
//
//  Created by 澤田世那 on 2022/06/04.
//

import UIKit

class AddItemViewController: UIViewController {

    enum Mode {
        case add
        case rename(String)
    }

    weak var delegate: EditItemListDelegate?
    private var mode: Mode?

    @IBOutlet weak var itemTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        switch mode {
        case .add:
            break
        case .rename(let name):
            itemTextField.text = name
        case nil:
            fatalError("mode is nil")
        }
    }

    @IBAction func saveButton(_ sender: Any) {
        guard let text = itemTextField.text else { return }
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        switch mode {
        case .add:
            delegate?.addDidSave(item: .init(name: text, isChecked: false))
        case .rename:
            delegate?.editDidSave(name: text)
        case nil:
            fatalError("mode is nil")
        }
    }

    @IBAction func cancelButton(_ sender: Any) {
        delegate?.didCancel()
    }

    func setup(mode: Mode) {
        self.mode = mode
    }
}
