//
//  IntroduceFlow.swift
//  PMS-iOS-V2
//
//  Created by GoEun Jeong on 2021/05/19.
//

#if os(iOS)

import RxFlow
import UIKit

final public class IntroduceFlow: Flow {
    public var root: Presentable {
        return self.rootViewController
    }

    private let rootViewController = UINavigationController()

    public init() {}

    public func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? PMSStep else { return .none }

        switch step {
        case .introduceIsRequired:
            return navigateToIntroduceScreen()
        case .clubIsRequired:
            return navigateToClubScreen()
        case .detailClubIsRequired(let name):
            return navigateToDetailClubScreen(name: name)
        case .companyIsRequired:
            return navigateToCompanyScreen()
        case .detailCompanyIsRequired(let name):
            return navigateToDetailCompanyScreen(name: name)
        case .developerIsRequired:
            return navigateToDeveloperScreen()
        case .alert(let string, let access):
            return alert(string: string, access: access)
        default:
            return .none
        }
    }

    private func navigateToIntroduceScreen() -> FlowContributors {
        let vc = AppDelegate.container.resolve(IntroduceViewController.self)!
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vc.viewModel))
    }
    
    private func navigateToClubScreen() -> FlowContributors {
        let vc = AppDelegate.container.resolve(ClubViewController.self)!
        vc.hidesBottomBarWhenPushed = true
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vc.viewModel))
    }
    
    private func navigateToDetailClubScreen(name: String) -> FlowContributors {
        let vc = ClubDetailViewController(name: name)
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vc.viewModel))
    }
    
    private func navigateToCompanyScreen() -> FlowContributors {
        let vc = AppDelegate.container.resolve(CompanyViewController.self)!
        vc.hidesBottomBarWhenPushed = true
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vc.viewModel))
    }
    
    private func navigateToDetailCompanyScreen(name: String) -> FlowContributors {
        let vc = CompanyDetailViewController(name: name)
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vc.viewModel))
    }
    
    private func navigateToDeveloperScreen() -> FlowContributors {
        let vc = AppDelegate.container.resolve(DeveloperViewController.self)!
        vc.hidesBottomBarWhenPushed = true
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vc.viewModel))
    }
    
    private func alert(string: String, access: AccessibilityString) -> FlowContributors {
        self.rootViewController.showErrorAlert(with: string, access: access)
        return .none
    }
}

#endif
