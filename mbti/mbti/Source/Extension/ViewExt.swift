//
//  ViewExt.swift
//  mbti
//
//  Created by dgsw8th71 on 12/18/23.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}



extension View {
    func addMbtiLogo() -> some View {
        ZStack {
            self
            VStack {
                HStack {
                    MbtiLogo()
                        .padding(.leading, 20)
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    func addBackButton(callback: @escaping () -> Void) -> some View {
        ZStack {
            self
            VStack {
                HStack {
                    Button {
                        callback()
                    } label: {
                        Image("Back")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    .padding(.leading, 20)
                    .padding(.top, 44)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}


extension View {
    func toLeading() -> some View {
        HStack {
            self
            Spacer()
        }
    }
    
    func toTrailing() -> some View {
        HStack {
            Spacer()
            self
        }
    }
    
    func toTop() -> some View {
        VStack {
            self
            Spacer()
        }
    }
    func toBottom() -> some View {
        VStack {
            Spacer()
            self
        }
    }
}
