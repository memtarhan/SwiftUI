import Foundation

func fetchWeatherHistory() async -> [Double] {
    (1 ... 100).map { _ in Double.random(in: 10 ... 30) }
}

func calculateAverageTemperature(for records: [Double]) async -> Double {
    records.reduce(0, +) / Double(records.count)
}

func upload(result: Double) async -> String {
    "OK"
}

func processWeather() async {
    let records = await fetchWeatherHistory()
    let average = await calculateAverageTemperature(for: records)
    let response = await upload(result: average)
    print("Uploaded average: \(response)")
}

// await processWeather()

func fetchFavorites() async throws -> [Int] {
    let url = URL(string: "https://hws.dev/user-favorites.json")!
    let (data, _) = try await URLSession.shared.data(from: url)
    return try JSONDecoder().decode([Int].self, from: data)
}

if let favorites = try? await fetchFavorites() {
    print("Fetched favorites: \(favorites.count)")

} else {
    print("Favorites fetch failed.")
}
