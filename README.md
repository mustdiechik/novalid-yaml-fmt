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
