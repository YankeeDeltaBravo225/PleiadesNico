//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import SwiftUI

@main
struct PleiadesNicoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


class AppDelegate: UIResponder, UIApplicationDelegate {
    private static var orientationMask : UIInterfaceOrientationMask = .all
    private static var savedOrientation : UIDeviceOrientation        = .unknown
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationMask
    }

    
    static func lockOrientation(mask : UIInterfaceOrientationMask, rotation : UIDeviceOrientation){
        AppDelegate.orientationMask  = mask
        AppDelegate.savedOrientation = UIDevice.current.orientation

        // Failed to get current orientation
        if AppDelegate.savedOrientation == .unknown {
            let isPortrait = UIScreen.main.bounds.size.width < UIScreen.main.bounds.size.height
            AppDelegate.savedOrientation = isPortrait ? .portrait : .landscapeLeft
        }

        UIDevice.current.setValue(rotation.rawValue, forKey: "orientation")
        UINavigationController.attemptRotationToDeviceOrientation()
    }


    static func unlockOrientation(){
        AppDelegate.orientationMask = UIInterfaceOrientationMask.all

        UIDevice.current.setValue(AppDelegate.savedOrientation.rawValue, forKey: "orientation")
        UINavigationController.attemptRotationToDeviceOrientation()
    }
    
}


public extension UIDevice {

    var model: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let rawName = withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {
                ptr in String.init(validatingUTF8: ptr)
            }
        }
        return rawName ?? "unknown"
    }

}
