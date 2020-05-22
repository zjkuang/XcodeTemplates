//___FILEHEADER___

import Foundation

// The contents of this file could be moved to a common place in your project, or even to an SPM library, so it can be shared globally

public enum GenericNavigationListImageName {
    case inBundle(imageName: String)
    case system(systemName: String)
}

public enum MyCustomError: Error {
    case noError(message: String = "No error")
    case genericError(message: String = "Generic error")
    case customError(message: String)
    case restServiceError((code: Int, message: String))
    
    public var code: Int? {
        switch self {
        case .customError, .genericError, .noError:
            return nil
        case .restServiceError((let code, _)):
            return code
        }
    }
    
    public var message: String {
        switch self {
        case .customError(let msg), .genericError(let msg), .noError(let msg):
            return msg
        case .restServiceError((_, let msg)):
            return msg
        }
    }
}

