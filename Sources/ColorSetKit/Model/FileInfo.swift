//
//  FileInfo.swift
//  ColorSetKit
//
//  Created by Takehito Koshimizu on 2019/02/10.
//

public struct FileInfo {

    private init() {}

    public static var colorsetPaths: [String] {
        return Command.findColorSets.lines
    }

    public static var productName: String {
        return workspaceName
            ?? projectName
            ?? workingDirectoryName!
    }

    private static var workspaceName: String? {
        return Command.findWorkspace.lines
            .first { !$0.isEmpty }?
            .split(separator: "/").last?
            .split(separator: ".").first
            .map(String.init)

    }

    private static var projectName: String? {
        return Command.findProject.lines
            .first { !$0.isEmpty }?
            .split(separator: "/").last?
            .split(separator: ".")
            .first
            .map(String.init)
    }

    private static var workingDirectoryName: String? {
        return Command.pwd.lines
            .first { !$0.isEmpty }?
            .split(separator: "/").last
            .map(String.init)
    }
}
