
import SwiftUI

@main
struct HW_API_5JunApp: App {
    
    @StateObject private var storeModel = StoreModel()
    
    var body: some Scene {
        WindowGroup {
            CategoryListScreen().environmentObject(storeModel)
            
        }
    }
}
