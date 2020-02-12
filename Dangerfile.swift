import Danger
let danger = Danger()


message("Hello \(danger.github.pullRequest.user.login)")
let editedFiles = danger.git.modifiedFiles + danger.git.createdFiles
message("These files have changed: \(editedFiles.joined(separator: ", "))")

if danger.github.pullRequest.body == nil || danger.github.pullRequest.body!.isEmpty {
    warn("Please provide a summary in the Pull Request description")
}

SwiftLint.lint(.all(directory: nil), inline: true, configFile: ".swiftlint.yml", strict: false, quiet: true, swiftlintPath: nil)
