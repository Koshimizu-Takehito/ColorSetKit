//
//  FileInfo.swift
//  ColorSetKit
//
//  Created by Takehito Koshimizu on 2019/02/10.
//

public struct FileInfo {

    public let outputName: String

    public let workspaceName: String?

    public let projectName: String?

    public let directoryName: String?

}

extension FileInfo {

    public static func currentDir() -> FileInfo {
        return FileInfo(
            outputName: outputName,
            workspaceName: workspaceName,
            projectName: projectName,
            directoryName: directoryName)
    }

}

extension FileInfo {

    private static var outputName: String {
        return workspaceName
            ?? projectName
            ?? directoryName!
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

    private static var directoryName: String? {
        return Command.pwd.text
    }
}
