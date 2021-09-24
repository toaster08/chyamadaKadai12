//
//  Presenter.swift
//  chyamadaKadai12
//
//  Created by toaster on 2021/09/21.
//

import Foundation

protocol PresenterInput {
    func calculate(amount: String?, tax: String?)
    func viewDidLoad()
}

final class Presenter: PresenterInput {
    private weak var view: ResultPresentationOutput?
    private var taxDealModel: TaxUserDefaultModel&TotalFeeCalculationModel

    init(view: ResultPresentationOutput,
         model: TaxUserDefaultModel&TotalFeeCalculationModel) {
        self.view = view
        self.taxDealModel = model
    }

    func calculate(amount: String?, tax: String?) {
        guard let tax = Double(tax ?? "")  else { return }
        taxDealModel.save(tax)

        guard let amount = Double(amount ?? "") else { return }
        let result = taxDealModel.multyply(amount, by: tax)
        view?.congfigure(result: result)
    }

    func viewDidLoad() {
        if taxDealModel.hasDefaultTax() {
            let tax = taxDealModel.loadDefaultTax()
            view?.congfigure(tax: tax)
        }
    }
}
