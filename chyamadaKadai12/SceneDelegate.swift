//
//  SceneDelegate.swift
//  chyamadaKadai12
//
//  Created by toaster on 2021/09/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }

        guard let viewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateInitialViewController() as? ViewController else {
            return
        }

        let model = TaxDealModel()
        let presenter = Presenter(view: viewController, model: model)
        viewController.inject(presenter: presenter)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
