# Automated testing

## Static analysis

1. Compiler/parser/interprer

The validate command, is used to validate the configuration internally i.e., locally on the host system. Its focus is on validating the Terraform configuration files for syntax and internal consistencies.

```

terraform validate
```

Validate runs checks that verify whether a configuration is syntactically valid and internally consistent, regardless of any provided variables or existing state. It is thus primarily useful for general verification of reusable modules, including correctness of attribute names and value types.

2. Linter

```

tflint
```

https://github.com/terraform-linters/tflint 3.9K Stars
https://dhaneshmadavil.wordpress.com/2021/10/29/how-to-use-tflint-to-check-errors-in-your-terraform-code/

3. Dry run

```

terraform plan
```

```

kubectl apply --dry-run='none|server|client'
```

## Unit tests

terratest

## Integration tests

terratest

## E2E tests

## Contract tests

https://www.hashicorp.com/blog/testing-hashicorp-terraform

## Complience testing

https://github.com/terraform-compliance/cli

## Policy
https://github.com/open-policy-agent/conftest

## Performance test

## Chaos test