//
//  MealStep.swift
//  PMS-iOS-V2
//
//  Created by GoEun Jeong on 2021/05/19.
//

#if os(iOS)

import RxFlow
import UIKit

final public class MealFlow: Flow {
    public var root: Presentable {
        return self.rootViewController
    }

    private let rootViewController = UINavigationController()

    public init() {}

    public func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? PMSStep else { return .none }

        switch step {
        case .mealIsRequired:
            return navigateToMealScreen()
        case .alert(let string, let access):
            return alert(string: string, access: access)
        default:
            return .none
        }
    }

    private func navigateToMealScreen() -> FlowContributors {
        let vc = AppDelegate.container.resolve(MealViewController.self)!
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vc.viewModel))
    }
    
    private func alert(string: String, access: AccessibilityString) -> FlowContributors {
        self.rootViewController.showErrorAlert(with: string, access: access)
        return .none
    }
}

#endif
