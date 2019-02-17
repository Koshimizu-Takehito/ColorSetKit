//
//  FileInfo.swift
//  ColorSetKit
//
//  Created by Takehito Koshimizu on 2019/02/10.
//

import ShellKit
import Foundation

struct FileInfo {

    let outputName: String

    let workspaceName: String?

    let projectName: String?

    let directoryName: String?
}

extension FileInfo {

    static func currentDir() -> FileInfo {
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
            ?? directoryName
    }

    private static var workspaceName: String? {
        return fileNameFirst(of: Command.findWorkspace.lines)
    }

    private static var projectName: String? {
        return fileNameFirst(of: Command.findProject.lines)
    }

    private static func fileNameFirst(of paths: AnySequence<String>) -> String? {
        return paths
            .first { !$0.isEmpty }
            .map(fileName)
    }

    private static func fileName(path: String) -> String {
        let url = URL(fileURLWithPath: path)
        let nameWithExt = url.lastPathComponent as NSString
        return nameWithExt.deletingPathExtension
    }

    private static var directoryName: String {
        return Command.pwd.text
    }
}
