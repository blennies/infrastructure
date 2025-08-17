# Infrastructure-as-code for "Blennies" projects

[![OpenTofu badge](https://img.shields.io/badge/OpenTofu-%23FFDA18?style=for-the-badge&logo=opentofu&labelColor=%23333)](https://opentofu.org/)
[![PNPM badge](https://img.shields.io/badge/pnpm-%23F69220?style=for-the-badge&logo=pnpm&labelColor=%23333)](https://pnpm.io/)

[![Conventional Commits badge](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)

Infrastructure-as-code that enables gitops management for the "Blennies"
projects. In particular, the creation of  GitHub repositories with consistent
settings is automated.

Uses HCL configuration files. Designed for use with [OpenTofu](https://opentofu.org/).

## Getting started

Ensure the latest version of [OpenTofu](https://opentofu.org/) is installed.

To initialize the repository, generate an infrastructure plan and then apply it:

```sh
tofu init
tofu plan
tofu apply
```

To verify changes to the infrastructure code:

```sh
tofu fmt --recursive
tofu validate
```

## License

This software is distributed under the terms of both the MIT license and the
Apache License (Version 2.0).

See [LICENSE](LICENSE) for details.

**SPDX-License-Identifier: MIT OR Apache-2.0**
