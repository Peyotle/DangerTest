import Danger 
let danger = Danger()
SwiftLint.lint()

let editedFiles = danger.git.modifiedFiles + danger.git.createdFiles
message("These files have changed: \(editedFiles.joined(separator: ", "))")

if danger.github.pullRequest.body == nil || danger.github.pullRequest.body!.isEmpty {
    warn("Please provide a summary in the Pull Request description")
}

let additions = danger.github.pullRequest.additions
