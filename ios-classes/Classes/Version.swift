import Foundation

import Foundation

struct Version {
    
    let versionNumber: String
    
    init(_ versionNumber: String) {
        self.versionNumber = versionNumber
    }
    
    /// 現在のアプリバージョン (info.plist の CFBundleShortVersionString の値)
    static var bundleShortVersion: Version {
        let versionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
        return Version(versionNumber)
    }
}

extension Version: Comparable {
    
    static func == (lhs: Version, rhs: Version) -> Bool {
        return compare(lhs: lhs, rhs: rhs) == .orderedSame
    }
    
    static func < (lhs: Version, rhs: Version) -> Bool {
        return compare(lhs: lhs, rhs: rhs) == .orderedDescending
    }
}

private extension Version {
    
    static func splitByDot(_ versionNumber: String) -> [Int] {
        return versionNumber.split(separator: ".").map { string -> Int in
            return Int(string) ?? 0
        }
    }
    
    static func filled(_ target: [Int], count: Int) -> [Int] {
        return (0..<count).map { i -> Int in
            (i < target.count) ? target[i] : 0
        }
    }
    
    static func compare(lhs: Version, rhs: Version) -> ComparisonResult {
        var lhsComponents = splitByDot(lhs.versionNumber)
        var rhsComponents = splitByDot(rhs.versionNumber)
        
        let count = max(lhsComponents.count, rhsComponents.count)
        lhsComponents = filled(lhsComponents, count: count)
        rhsComponents = filled(rhsComponents, count: count)
        
        for i in 0..<count {
            let lhsComponent = lhsComponents[i]
            let rhsComponent = rhsComponents[i]
            
            if lhsComponent < rhsComponent {
                return .orderedDescending
            }
            if lhsComponent > rhsComponent {
                return .orderedAscending
            }
        }
        return .orderedSame
    }
}
