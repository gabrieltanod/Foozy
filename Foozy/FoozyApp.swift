import SwiftData
import SwiftUI

@main
struct FoozyApp: App {
    @State var selectedCuisines: Set<String> = []

    init() {
        UIView.appearance().overrideUserInterfaceStyle = .light
        
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.orange]
    }

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Restaurant.self  // ✅ FIXED: Now correctly using Restaurant model
        ])
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false
        )

        do {
            return try ModelContainer(
                for: schema,
                configurations: [modelConfiguration]
            )
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .modelContainer(for: Restaurant.self)  // Ensures SwiftData is used
        }
    }
}

// Function to insert sample restaurants only if data is empty
//func addSampleRestaurantsIfNeeded() async {
//    do {
//        let modelContainer = try ModelContainer(for: Restaurant.self)
//        let modelContext = ModelContext(modelContainer)
//
//        // Check if restaurants exist
//        let fetchDescriptor = FetchDescriptor<Restaurant>()
//        let existingRestaurants = try modelContext.fetch(fetchDescriptor)
//
//        print("📊 Found \(existingRestaurants.count) existing restaurants")
//
//        if existingRestaurants.isEmpty {
//            print("🆕 Adding sample restaurants")
//            addSampleRestaurants(modelContext: modelContext)
//            try modelContext.save()
//            print("✅ Sample restaurants added successfully")
//        }
//    } catch {
//        print("⚠️ Error initializing ModelContainer or fetching data: \(error.localizedDescription)")
//    }
//}
