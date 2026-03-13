# Dfinity Tap

This tap contains `icp-cli-beta`, released more often than the `icp-cli` formula available in homebrew-core. The binaries use the same names, so it's necessary to `brew uninstall icp-cli` first.

## Installation

```sh
brew install dfinity/tap/icp-cli-beta
```

## Releasing

The formula installs prebuilt binaries from [dfinity/icp-cli](https://github.com/dfinity/icp-cli) releases. To update the formula:

1. Ensure the icp-cli release is published with platform archives and `.sha256` checksum files.
2. Go to **Actions > Update formula from icp-cli release** and dispatch the workflow with the release version (e.g., `0.3.0-beta.0`).
3. The workflow fetches checksums, updates the formula's `version` and `sha256` lines, and creates a PR. Review and merge.

To update manually, run `./scripts/update-icp-cli-beta.sh <version>` from the repo root.

## License

This project is licensed under the [Apache-2.0](./LICENSE) license.

## Contribution

This project does not accept external contributions. Pull requests from individuals outside the organization will be automatically closed.
