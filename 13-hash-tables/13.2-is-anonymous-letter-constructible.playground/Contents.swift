/**
 Write a program that takes text for an anonymous letter and text for a magazine and determines if it is possible to write the anonymous letter using the magazine.
 Hint: Count the number of distinct characters appearing in the letter.
 */

// Worst case time: O(m + n) where m = characters in magazineText, n = characters in letterText
// Space complexity: O(L) where L is the number of unique letters in the letterText
func isLetterConstructibleFromMagazine(letterText: String, magazineText: String) -> Bool {
    var seenChar = [Character: Int]()
    for char in letterText {
        if let count = seenChar[char] {
            seenChar[char] = count + 1
        } else {
            seenChar[char] = 1
        }
    }
    
    for char in magazineText {
        if let count = seenChar[char] {
            if count - 1 == 0 {
                seenChar.removeValue(forKey: char)
            } else {
                seenChar[char] = count - 1
            }
        }
    }
    
    return seenChar.isEmpty
}

// Testing
let letterText = "hello world"
let magazineText = "hello to the world"
let letterConstructible = isLetterConstructibleFromMagazine(letterText: letterText, magazineText: magazineText)
assert(true == letterConstructible)

let letterConstructible2 = isLetterConstructibleFromMagazine(letterText: magazineText, magazineText: letterText)
assert(false == letterConstructible2)
