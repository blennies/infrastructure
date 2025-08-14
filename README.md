# Infrastructure-as-code for Blennies projects

[![Static Badge](https://img.shields.io/badge/OpenTofu-%23FFDA18?style=for-the-badge&logo=opentofu&labelColor=%23333)](https://opentofu.org/)

Infrastructure-as-code for the Blennies projects, enabling gitops management of
source code repositories.

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
