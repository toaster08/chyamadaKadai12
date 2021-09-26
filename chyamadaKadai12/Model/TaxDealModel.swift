//
//  Model.swift
//  chyamadaKadai12
//
//  Created by toaster on 2021/09/21.
//

import Foundation

protocol TotalFeeCalculationModel {
    func multyply(_ amount: Double, by tax: Double) -> Double
}

protocol TaxUserDefaultModel {
    func loadDefaultTax() -> Double
    func hasDefaultTax() -> Bool
    func save(_ tax: Double)
}

final class TaxDealModel: TaxUserDefaultModel, TotalFeeCalculationModel {
    static let taxString = "tax"
    static let userDefaults = UserDefaults.standard

    func hasDefaultTax() -> Bool {
        if TaxDealModel.userDefaults.object(forKey: Self.taxString) != nil {
            return true
        }
        return false
    }

    func loadDefaultTax() -> Double {
        guard let tax = TaxDealModel.userDefaults.object(forKey: Self.taxString) as? Double else {
            fatalError()
        }
        return tax
    }

    func save(_ tax: Double) {
        TaxDealModel.userDefaults.setValue(tax, forKey: Self.taxString)
    }

    func multyply(_ amount: Double, by tax: Double) -> Double {
        // 消費税率計算後の端数は四捨五入として処理
        let result = round(amount * (1 + tax / 100))
        return result
    }
}

/* Feedback後コメント
 将来的にはUserDefaultsはRepositoryデザインパターンを踏襲して
 Repositoryとしてクラスを分割していくのが
 責務と機能の追加のしやすさという点で良いかもしれない
*/
 
