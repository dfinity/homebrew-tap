# Dfinity Tap

This tap contains `icp-cli@beta`, released more often than the `icp-cli` formula available in homebrew-core. The binaries use the same names, so it's recommended to `brew unlink icp-cli` or `brew uninstall icp-cli` first.

## How do I install these formulae?

`brew install dfinity/tap/<formula>`

Or `brew tap dfinity/tap` and then `brew install <formula>`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "dfinity/tap"
brew "<formula>"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

## Releasing

To make a new release, update the download URL and sha2 at the top of the formula in a PR branch (you do not need to touch the bottle section). Then *after* brew CI passes, add the label `!add-bottles` to your PR. You will usually need to close and reopen the PR after this, and then if it has been approved it can be merged even if it shows CI as still running. If there are any edits you make to the PR afterwards you'll need to rerun `!add-bottles`.

Merging the PR should create the release. If the release publishing action fails for whatever reason, manually rerun it from the Actions page using the last commit ID *you* made in the PR (not the bot's commit, and not the PR merge commit).

PRs that *aren't* releases should be labeled `merge-without-publishing`. 

## License

This project is licensed under the [Apache-2.0](./LICENSE) license.

## Contribution

This project does not accept external contributions. Pull requests from individuals outside the organization will be automatically closed.
