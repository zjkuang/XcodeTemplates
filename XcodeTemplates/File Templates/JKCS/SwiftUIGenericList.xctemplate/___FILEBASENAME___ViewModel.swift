//___FILEHEADER___

import Foundation
import Combine

class ___FILEBASENAMEASIDENTIFIER___: ObservableObject {
    var viewTitle: String
    
    init(viewTitle: String, initialToggleValue: Bool = false) {
        self.viewTitle = viewTitle
        self.somethingToggle = initialToggleValue
        
        DispatchQueue.main.async {
            self.setupListData()
        }
    }
    
    struct Section: Identifiable {
        var id = UUID()
        var title: String
        var items: [Item]
    }
    
    struct Item: Identifiable {
        var id = UUID()
        var title: String
        var detail: String? = nil
        var imageName: GenericNavigationListImageName? = nil
        var navigationLink: Bool = false
    }
    
    static let itemImmediatePushTitle = "Immediate Push"
    static let itemLoadAndPushTitle = "Load And Push"
    static let itemAlertAndPushTitle = "Alert And Push"
    static let itemAlertAndToggleTitle = "Alert And Toggle"
    static let itemAlertAndPopTitle = "Alert And Pop"
    static let itemVersionTitle = "Version" // Unclickable
    
    @Published var listData: [Section] = []
    
    private func setupListData() {
        var listData: [Section] = []
        listData.append(
            Section(title: "GENERAL", items: [
                Item(title: ___FILEBASENAMEASIDENTIFIER___.itemImmediatePushTitle, imageName: GenericNavigationListImageName.system(systemName: "p.circle"), navigationLink: true),
                Item(title: ___FILEBASENAMEASIDENTIFIER___.itemLoadAndPushTitle, imageName: GenericNavigationListImageName.system(systemName: "l.circle")),
                Item(title: ___FILEBASENAMEASIDENTIFIER___.itemAlertAndPushTitle, imageName: GenericNavigationListImageName.system(systemName: "a.circle")),
                Item(title: ___FILEBASENAMEASIDENTIFIER___.itemAlertAndToggleTitle, imageName: GenericNavigationListImageName.system(systemName: "t.circle")),
                Item(title: ___FILEBASENAMEASIDENTIFIER___.itemAlertAndPopTitle, imageName: GenericNavigationListImageName.system(systemName: "b.circle"))
            ])
        )
        listData.append(
            Section(title: "ABOUT", items: [
                Item(title: ___FILEBASENAMEASIDENTIFIER___.itemVersionTitle, imageName: GenericNavigationListImageName.system(systemName: "v.circle")),
            ])
        )
        self.listData = listData
    }
    
    private func version() -> String {
        return "x.y.z (build)"
    }
    
    var somethingLoaded: [String : String]? = nil
    
    private var loadSomethingRequest: AnyCancellable? = nil
    func loadSomething(completionHandler: @escaping (Result<Any?, MyCustomError>) -> ()) {
        loadSomethingRequest = self.mockingModelLoadSomething().receive(on: RunLoop.main).sink(receiveCompletion: { (completion) in
            switch completion {
            case .failure(let error):
                completionHandler(Result.failure(error))
            case .finished:
                self.loadSomethingRequest = nil
                completionHandler(Result.success(nil))
            }
        }, receiveValue: { (response) in
            if let result = response["result"] {
                self.somethingLoaded = result
            }
        })
    }
    
    private func mockingModelLoadSomething() -> AnyPublisher<[String : [String : String]], MyCustomError> {
        let success = true
        return Future<[String : [String : String]], MyCustomError> { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
                let result = success ? Result.success(["result" : ["result" : "success", "hint": "To trigger the 'Failed to load' case, go to viewModel's mockingModelLoadSomething method, change 'let success = true' to 'let success = false'"]]) : Result.failure(MyCustomError.customError(message: "Server side failure\n\nTo trigger the 'Success' case, go to viewModel's mockingModelLoadSomething method, change 'let success = false' to 'let success = true'"))
                promise(result)
            }
        }.eraseToAnyPublisher()
    }
    
    @Published var somethingToggle = false
    
    func toggleSomething() {
        somethingToggle.toggle()
    }
}
