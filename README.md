# novalid-yaml-fmt

Makes pretty format for yaml like files. This script does not check syntasis and validation.

It only analyzes the leftside indents and edits them.

## Example

### before
```
basicAuth:
  username: user
  password: name
  foo:
    - one
    - two
  bar:
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
```
### after:

```
basicAuth:
  username: user
  password: name
  foo:
    - one
    - two
  bar:
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
```

## Configure pre-commit

Add to .pre-commit-config.yaml

```
  - repo: https://github.com/mustdiechik/novalid-yaml-fmt.git
    rev: v0.0.23
    hooks:
      - id: novalid-yaml-fmt
```
## Tests
```
bash test.sh
```
