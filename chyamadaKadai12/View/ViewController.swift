//
//  ViewController.swift
//  chyamadaKadai12
//
//  Created by toaster on 2021/09/20.
//

import Foundation
import UIKit

protocol ResultPresentationOutput: AnyObject {
    func configure(result: Double)
    func configure(tax: Double)
}

final class ViewController: UIViewController {
    @IBOutlet private weak var amountInputTextField: UITextField!
    @IBOutlet private weak var taxInputTextField: UITextField!
    @IBOutlet private weak var resultOutputLabel: UILabel!
    @IBOutlet private weak var calculateButton: UIButton! {
        didSet {
            calculateButton.addTarget(self,
                                      action: #selector(didTapCalculate),
                                      for: .touchUpInside)
        }
    }

    private var presenter: PresenterInput!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    func inject(presenter: PresenterInput) {
        self.presenter = presenter
    }

    @objc private func didTapCalculate() {
        presenter.calculate(amount: amountInputTextField.text,
                            tax: taxInputTextField.text)

        amountInputTextField.endEditing(true)
        taxInputTextField.endEditing(true)
    }
}

extension ViewController: ResultPresentationOutput {
    func configure(tax: Double) {
        taxInputTextField.text = String(format: "%.f", tax)
    }

    func configure(result: Double) {
        let result = String(format: "%.f", result)
        resultOutputLabel.text = result
    }
}
