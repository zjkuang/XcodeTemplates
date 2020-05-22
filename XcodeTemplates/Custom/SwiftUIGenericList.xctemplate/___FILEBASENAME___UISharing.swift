//___FILEHEADER___

import SwiftUI

// The contents of this file could be moved to a common place in your project, or even to an SPM library, so it can be shared globally

public struct GenericNavigationListActivityIndicatorView: UIViewRepresentable {
    public var uiActivityIndicatorView = UIActivityIndicatorView()
    
    public init() {
        
    }
    
    public func makeUIView(context: Context) -> UIActivityIndicatorView {
        return uiActivityIndicatorView
    }
    
    public func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
    
    public func startAnimating() -> Self {
        uiActivityIndicatorView.startAnimating()
        return self
    }
    
    public func stopAnimating() -> Self {
        uiActivityIndicatorView.stopAnimating()
        return self
    }
}

public extension Image {
    init(imageName: GenericNavigationListImageName) {
        switch imageName {
        case .inBundle(let name):
            self.init(name)
        case .system(let systemName):
            self.init(systemName: systemName)
        }
    }
}
