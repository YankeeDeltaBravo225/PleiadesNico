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

        if AppDelegate.savedOrientation == UIDevice.current.orientation {
            // UI orientation is not rotated
            return
        }

        UIDevice.current.setValue(AppDelegate.savedOrientation.rawValue, forKey: "orientation")
        UINavigationController.attemptRotationToDeviceOrientation()
    }

}
