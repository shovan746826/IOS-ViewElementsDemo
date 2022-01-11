//
//  ViewModel.swift
//  NavigationDemo
//
//  Created by Infinity Tech on 10/1/22.
//

import Foundation
import SwiftUI

class NavigationUtilViewModel : ObservableObject {
    
    @Published var isNavigateActive: Bool = false
    
    func changeValue (){
        isNavigateActive = false
    }
    
    func navigatePopToRoot (){
        NavigationUtil.popToRootView()
    }
    
}


import UIKit

struct NavigationUtil {
    static func popToRootView() {
        findNavigationController(viewController: keyWindow?.rootViewController)?
            .popToRootViewController(animated: true)
    }

    static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }

        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }

        for childViewController in viewController.children {
            return findNavigationController(viewController: childViewController)
        }

        return nil
    }
}

let keyWindow = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
