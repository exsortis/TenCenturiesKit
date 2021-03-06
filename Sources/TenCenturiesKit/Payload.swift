import Foundation


enum Payload {
    case parameters([Parameter]?)
    case media(MediaAttachment?)
    case empty
}

extension Payload {

    var items: [URLQueryItem]? {
        switch self {
        case .parameters(let parameters): return parameters?.flatMap(toQueryItem)
        case .media: return nil
        case .empty: return nil
        }
    }

    var data: Data? {
        switch self {
        case .parameters(let parameters): return parameters?.flatMap(toString).joined(separator: "&").data(using: .utf8)
        case .media(let attachment): return attachment.flatMap(Data.init)
        case .empty: return nil
        }
    }

    var type: String? {
        switch self {
        case .parameters(let parameters): return parameters.flatMap { _ in "application/x-www-form-urlencoded; charset=utf-8" }
        case .media(let mediaAttachment): return mediaAttachment.flatMap { _ in "multipart/form-data; boundary=TenCenturiesKitBoundary" }
        case .empty: return nil
        }
    }
    
}
