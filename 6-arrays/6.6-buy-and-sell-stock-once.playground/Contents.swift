// Write a program that takes an array denoting the daily stock price, and returns the maximum profit that could be made by buying and then selling one share of that stock.
// Hint: Identifying the min and max is not enough since the min may appear after the max height. Focus on valid differences.

// Brute force method. O(1) space and O(n^2) time
func computeMaxProfitBruteForce(prices: [Int]) -> Int {
    var currentMax = Int.min
    for (index, buyPrice) in prices.enumerated() {
        for (index2, sellPrice) in prices.enumerated() {
            if index < index2 {
                currentMax = max(currentMax, sellPrice - buyPrice)
            }
        }
    }
    return currentMax
}

// Optimal solution. O(1) space and O(n) time
func computeMaxProfit(prices: [Int]) -> Int {
    var currentMin = Int.max
    var highestProfit = Int.min
    for price in prices {
        currentMin = min(currentMin, price)
        highestProfit = max(highestProfit, price - currentMin)
    }
    return highestProfit
}

// Testing
let dailyStockPrice = [310, 315, 275, 295, 260, 270, 290, 230, 255, 250]
print(computeMaxProfitBruteForce(prices: dailyStockPrice)) //expected: 30

let dailyStockPrice2 = [310, 315, 275, 295, 260, 270, 290, 230, 255, 250]
print(computeMaxProfit(prices: dailyStockPrice2)) //expected: 30
