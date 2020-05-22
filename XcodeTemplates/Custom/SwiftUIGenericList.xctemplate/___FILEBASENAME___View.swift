//___FILEHEADER___

import SwiftUI
import Combine

struct ___FILEBASENAMEASIDENTIFIER___: View, ___FILEBASENAMEASIDENTIFIER___AlertActionDelegate {
    @ObservedObject private var viewModel: ___FILEBASENAMEASIDENTIFIER___Model
    private var isNavigationRoot: Bool
    @Environment(\.presentationMode) var presentationMode
    @State private var showActivityIndicator = false
    @State private var showAlert = false
    @State private var pushLoadedView = false
    @State private var pushConfirmedView = false
    @State private var alert: ___FILEBASENAMEASIDENTIFIER___Alert = .none {
        didSet {
            switch alert {
            case .confirmPush, .confirmToggle, .confirmPop, .failedLoading(_):
                showAlert = true
            default:
                break
            }
        }
    }
    func onAlertActionConfirm(alert: ___FILEBASENAMEASIDENTIFIER___Alert) {
        switch alert {
        case .confirmPush:
            pushConfirmedView.toggle()
        case .confirmToggle:
            viewModel.toggleSomething()
        case .confirmPop:
            DispatchQueue.main.async {
                self.presentationMode.wrappedValue.dismiss()
            }
        default:
            break
        }
    }
    
    init(isNavigationRoot: Bool, viewTitle: String, initialToggleValue: Bool = false) {
        self.isNavigationRoot = isNavigationRoot
        self.viewModel = ___FILEBASENAMEASIDENTIFIER___Model(viewTitle: viewTitle, initialToggleValue: initialToggleValue)
    }

    var body: some View {
        bodyView
    }
    
    private var bodyView: AnyView {
        if self.isNavigationRoot {
            return AnyView(
                NavigationView {
                    baseView
                }
                .navigationViewStyle(StackNavigationViewStyle()) // to prevent it from showing as split view on iPad
            )
        }
        else {
            return baseView
        }
    }
    
    private var baseView: AnyView {
        AnyView(
            ZStack {
                List {
                    ForEach(viewModel.listData) { section in
                        Section(header: Text(section.title)) {
                            ForEach(section.items) { item in
                                self.itemView(item: item)
                            }
                        }
                    }
                }
                .alert(isPresented: $showAlert) {
                    return alert.alert(delegate: self)
                }
                
                NavigationLink(destination: ___FILEBASENAMEASIDENTIFIER___ChildView2(info: self.viewModel.somethingLoaded), isActive: self.$pushLoadedView) {
                    Text("")
                }.hidden()
                
                NavigationLink(destination: ___FILEBASENAMEASIDENTIFIER___ChildView1(title: "Confirmed Push Child"), isActive: self.$pushConfirmedView) {
                    Text("")
                }.hidden()
                
                if showActivityIndicator {
                    GenericNavigationListActivityIndicatorView().startAnimating()
                }
                else {
                    GenericNavigationListActivityIndicatorView().stopAnimating()
                }
            }.navigationBarTitle(Text(viewModel.viewTitle))
        )
    }
    
    private func itemView(item: ___FILEBASENAMEASIDENTIFIER___Model.Item) -> AnyView {
        if item.navigationLink {
            let navigationLink = NavigationLink(destination: self.itemDestinationView(item: item)) {
                HStack {
                    self.itemImage(item)
                    VStack(alignment: .leading) {
                        Text(item.title)
                        self.itemDetailView(item)
                    }
                }
            }
            return AnyView(navigationLink)
        }
        else {
            let view = AnyView(
                HStack {
                    self.itemImage(item)
                    VStack(alignment: .leading) {
                        Text(item.title)
                        self.itemDetailView(item)
                    }
                    if (item.title == ___FILEBASENAMEASIDENTIFIER___Model.itemAlertAndToggleTitle) {
                        Spacer()
                        Image(systemName: viewModel.somethingToggle ? "checkmark.circle" : "nosign")
                    }
                }
            )
            .gesture(TapGesture().onEnded({ (_) in
                self.itemTapped(item)
            }))
            return AnyView(view)
        }
    }
    
    private func itemImage(_ item: ___FILEBASENAMEASIDENTIFIER___Model.Item) -> Image {
        return Image(imageName: item.imageName ?? GenericNavigationListImageName.system(systemName: "list.bullet"))
    }
    
    private func itemDetailView(_ item: ___FILEBASENAMEASIDENTIFIER___Model.Item) -> Text? {
        guard let detail = item.detail else {
            return nil
        }
        return Text(detail).font(.subheadline).foregroundColor(.gray)
    }
    
    private func itemTapped(_ item: ___FILEBASENAMEASIDENTIFIER___Model.Item) {
        switch item.title {
        case ___FILEBASENAMEASIDENTIFIER___Model.itemLoadAndPushTitle:
            showActivityIndicator = true
            viewModel.loadSomething { (result) in
                self.showActivityIndicator = false
                switch result {
                case .failure(let error):
                    self.alert = .failedLoading(error: error)
                case .success(_):
                    self.pushLoadedView = true
                }
            }
            return
        case ___FILEBASENAMEASIDENTIFIER___Model.itemAlertAndPushTitle:
            alert = .confirmPush
        case ___FILEBASENAMEASIDENTIFIER___Model.itemAlertAndToggleTitle:
            alert = .confirmToggle(turnOn: !viewModel.somethingToggle)
        case ___FILEBASENAMEASIDENTIFIER___Model.itemAlertAndPopTitle:
            alert = .confirmPop
        default:
            print("*** \(item.title) tapped")
            return
        }
    }
    
    private func itemDestinationView(item: ___FILEBASENAMEASIDENTIFIER___Model.Item) -> AnyView {
        switch item.title {
        case ___FILEBASENAMEASIDENTIFIER___Model.itemImmediatePushTitle:
            return AnyView(___FILEBASENAMEASIDENTIFIER___ChildView1(title: "Immediate Push Child"))
        default:
            return AnyView(EmptyView())
        }
    }
}

struct ___FILEBASENAMEASIDENTIFIER____Previews: PreviewProvider {
    static var previews: some View {
        ___FILEBASENAMEASIDENTIFIER___(isNavigationRoot: false, viewTitle: "Generic Navigation List")
    }
}

// MARK: - Alert

protocol ___FILEBASENAMEASIDENTIFIER___AlertActionDelegate {
    func onAlertActionConfirm(alert: ___FILEBASENAMEASIDENTIFIER___Alert)
}

enum ___FILEBASENAMEASIDENTIFIER___Alert {
    case none
    case confirmPush
    case confirmToggle(turnOn: Bool)
    case confirmPop
    case failedLoading(error: MyCustomError)
    
    func alert<T: ___FILEBASENAMEASIDENTIFIER___AlertActionDelegate>(delegate: T) -> Alert {
        var title: String
        var message: String
        switch self {
        case .none:
            return Alert(title: Text("NONE"))
        case .confirmPush:
            title = "PUSH"
            message = "Proceed?"
        case .confirmToggle(let turnOn):
            title = "TOGGLE"
            message = "Turn it \(turnOn ? "on" : "off")?"
        case .confirmPop:
            title = "BACK"
            message = "Proceed?"
        case .failedLoading(let error):
            title = "FAILED LOADING"
            message = error.message
            return Alert(title: Text(title), message: Text(message), dismissButton: .default(Text("OK")))
        }
        return Alert(title: Text(title), message: Text(message), primaryButton: .destructive(Text("Yes")) {
            delegate.onAlertActionConfirm(alert: self)
        }, secondaryButton: .cancel())
    }
}

// MARK: - Child Views

struct ___FILEBASENAMEASIDENTIFIER___ChildView1: View {
    var title: String
    var body: some View {
        Text(title)
    }
}

struct ___FILEBASENAMEASIDENTIFIER___ChildView2: View {
    var info: [String : String]
    var body: some View {
        ScrollView {
            Text(self.stringifyInfo())
        }
    }
    
    init(info: [String : String]? = nil) {
        guard let info = info else {
            self.info = [:]
            return
        }
        self.info = info
    }
    
    private func stringifyInfo() -> String {
        do {
            let data = try JSONSerialization.data(withJSONObject: info, options: .prettyPrinted)
            return String(data: data, encoding: .utf8) ?? "<UTF8 decoding failed>"
        } catch {
            return "<JSON serialization failed>"
        }
    }
}
