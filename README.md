# Infrastructure-as-code for "Blennies" projects

[![OpenTofu badge](https://img.shields.io/badge/OpenTofu-%23FFDA18?style=for-the-badge&logo=opentofu&labelColor=%23333)](https://opentofu.org/)

[![Conventional Commits badge](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)

Infrastructure-as-code repository for the "Blennies" projects. Primarily, it automates the
creation of GitHub repositories with consistent settings.

Uses HCL configuration files. Designed for use with [OpenTofu](https://opentofu.org/).

## Getting started

Ensure the latest version of [OpenTofu](https://opentofu.org/) is installed.

OpenTofu needs suitable access to this repository's origin on GitHub in order to function
correctly. You can achieve this by authenticating an account with suitable permissions via the
[GitHub CLI](https://cli.github.com/) tool.

To prepare OpenTofu to manage the infrastructure:

```sh
tofu init
```

To generate an infrastructure plan and then apply it:

```sh
tofu plan
tofu apply
```

To verify changes to the infrastructure code:

```sh
tofu fmt --recursive
tofu validate
```

Verification of the infrastructure code is also performed by the CI flow.
Commit logs are checked for
[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
compliance as part of this flow.

## License

This software is distributed under Apache License (Version 2.0) or MIT License
terms, at your option.

See [LICENSE](LICENSE) for details.

**SPDX-License-Identifier: MIT OR Apache-2.0**
