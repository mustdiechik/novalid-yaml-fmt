# novalid-yaml-fmt

Make pretty format for yaml like files

## Example

### before
```
basicAuth:
  username: user
  password: name
  foo:
    - one
    - two
  else:
    one:
            two: two
                        three:tree
----
one:
            two:
                            thee: end
---
sometext: |
                    ---
                    one
                        two
                            thee
                    four
            five
        foo: bar
```
### after:

```
basicAuth:
  username: user
  password: name
  foo:
    - one
    - two
  else:
    one:
      two: two
        three:tree
----
one:
  two:
    thee: end
---
sometext: |
                    ---
                    one
                        two
                            thee
                    four
            five
        foo: bar

## Configure pre-commit

Add to .pre-commit-config.yaml

```
  - repo: https://github.com/mustdiechik/novalid-yaml-fmt.git
    rev: v0.0.18
    hooks:
      - id: novalid-yaml-fmt
```
