// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GamesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Games($cursor: String!) {
      games(after: $cursor) {
        __typename
        nodes {
          __typename
          ...gameCardFields
        }
        pageInfo {
          __typename
          ...paginationFields
        }
      }
    }
    """

  public let operationName: String = "Games"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + GameCardFields.fragmentDefinition)
    document.append("\n" + PaginationFields.fragmentDefinition)
    return document
  }

  public var cursor: String

  public init(cursor: String) {
    self.cursor = cursor
  }

  public var variables: GraphQLMap? {
    return ["cursor": cursor]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("games", arguments: ["after": GraphQLVariable("cursor")], type: .object(Game.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(games: Game? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "games": games.flatMap { (value: Game) -> ResultMap in value.resultMap }])
    }

    /// List all games.
    public var games: Game? {
      get {
        return (resultMap["games"] as? ResultMap).flatMap { Game(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "games")
      }
    }

    public struct Game: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["GameConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nodes", type: .list(.object(Node.selections))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(nodes: [Node?]? = nil, pageInfo: PageInfo) {
        self.init(unsafeResultMap: ["__typename": "GameConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, "pageInfo": pageInfo.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of nodes.
      public var nodes: [Node?]? {
        get {
          return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
        }
      }

      /// Information to aid in pagination.
      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      public struct Node: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Game"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(GameCardFields.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var gameCardFields: GameCardFields {
            get {
              return GameCardFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PageInfo"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(PaginationFields.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(hasPreviousPage: Bool, hasNextPage: Bool, startCursor: String? = nil, endCursor: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "hasPreviousPage": hasPreviousPage, "hasNextPage": hasNextPage, "startCursor": startCursor, "endCursor": endCursor])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var paginationFields: PaginationFields {
            get {
              return PaginationFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public struct GameCardFields: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment gameCardFields on Game {
      __typename
      id
      name
      coverUrl(size: MEDIUM)
      platforms(first: 3) {
        __typename
        nodes {
          __typename
          name
        }
      }
      developers(first: 3) {
        __typename
        nodes {
          __typename
          name
        }
      }
      isFavorited
    }
    """

  public static let possibleTypes: [String] = ["Game"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("coverUrl", arguments: ["size": "MEDIUM"], type: .scalar(String.self)),
      GraphQLField("platforms", arguments: ["first": 3], type: .object(Platform.selections)),
      GraphQLField("developers", arguments: ["first": 3], type: .object(Developer.selections)),
      GraphQLField("isFavorited", type: .scalar(Bool.self)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String, coverUrl: String? = nil, platforms: Platform? = nil, developers: Developer? = nil, isFavorited: Bool? = nil) {
    self.init(unsafeResultMap: ["__typename": "Game", "id": id, "name": name, "coverUrl": coverUrl, "platforms": platforms.flatMap { (value: Platform) -> ResultMap in value.resultMap }, "developers": developers.flatMap { (value: Developer) -> ResultMap in value.resultMap }, "isFavorited": isFavorited])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// ID of the game.
  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  /// Name of the game.
  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  /// URL for the game's cover image. `null` means the game has no associated cover.
  public var coverUrl: String? {
    get {
      return resultMap["coverUrl"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "coverUrl")
    }
  }

  /// Platforms the game is available on.
  public var platforms: Platform? {
    get {
      return (resultMap["platforms"] as? ResultMap).flatMap { Platform(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "platforms")
    }
  }

  /// Developers of the game.
  public var developers: Developer? {
    get {
      return (resultMap["developers"] as? ResultMap).flatMap { Developer(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "developers")
    }
  }

  /// Whether the game is in the current user's favorites, or `null` if there is no logged-in user.
  public var isFavorited: Bool? {
    get {
      return resultMap["isFavorited"] as? Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "isFavorited")
    }
  }

  public struct Platform: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["PlatformConnection"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("nodes", type: .list(.object(Node.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(nodes: [Node?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "PlatformConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// A list of nodes.
    public var nodes: [Node?]? {
      get {
        return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
      }
    }

    public struct Node: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Platform"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String) {
        self.init(unsafeResultMap: ["__typename": "Platform", "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Name of the platform.
      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }

  public struct Developer: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["CompanyConnection"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("nodes", type: .list(.object(Node.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(nodes: [Node?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "CompanyConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// A list of nodes.
    public var nodes: [Node?]? {
      get {
        return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
      }
    }

    public struct Node: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Company"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String) {
        self.init(unsafeResultMap: ["__typename": "Company", "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Name of the company.
      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public struct PaginationFields: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment paginationFields on PageInfo {
      __typename
      hasPreviousPage
      hasNextPage
      startCursor
      endCursor
    }
    """

  public static let possibleTypes: [String] = ["PageInfo"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("hasPreviousPage", type: .nonNull(.scalar(Bool.self))),
      GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
      GraphQLField("startCursor", type: .scalar(String.self)),
      GraphQLField("endCursor", type: .scalar(String.self)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(hasPreviousPage: Bool, hasNextPage: Bool, startCursor: String? = nil, endCursor: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "PageInfo", "hasPreviousPage": hasPreviousPage, "hasNextPage": hasNextPage, "startCursor": startCursor, "endCursor": endCursor])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// When paginating backwards, are there more items?
  public var hasPreviousPage: Bool {
    get {
      return resultMap["hasPreviousPage"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "hasPreviousPage")
    }
  }

  /// When paginating forwards, are there more items?
  public var hasNextPage: Bool {
    get {
      return resultMap["hasNextPage"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "hasNextPage")
    }
  }

  /// When paginating backwards, the cursor to continue.
  public var startCursor: String? {
    get {
      return resultMap["startCursor"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "startCursor")
    }
  }

  /// When paginating forwards, the cursor to continue.
  public var endCursor: String? {
    get {
      return resultMap["endCursor"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "endCursor")
    }
  }
}
