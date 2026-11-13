# novalid-yaml-fmt

Makes pretty format for yaml like files. This script does not check syntax and validation.

It only analyzes left side indents and fixes them.

This hook is very useful when working with Helm or Helmfile template files, which use Go templates.

## Example

### before
```yaml
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

### after
```yaml
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

## Usage

### Command line
```bash
# Print formatted output to stdout
./novalid-yaml-fmt file.yaml

# Overwrite file in-place
./novalid-yaml-fmt -w file.yaml
```

### Configure pre-commit
Add to `.pre-commit-config.yaml`:

```yaml
  - repo: https://github.com/mustdiechik/novalid-yaml-fmt.git
    rev: v0.0.24
    hooks:
      - id: novalid-yaml-fmt
```

## Development

### How it works
The formatter works by scanning the leading whitespace of each line and maintaining a tracking dictionary of indentation levels (`posDict`).

Key implementation details:
- **List Detection**: It distinguishes between YAML list markers (`- `) and text that starts with a dash (like `-Dquarkus...`) by requiring a space after the dash.
- **Block Scalars**: The formatter is designed to handle YAML block scalars (`|`, `>`), ensuring that the relative indentation within these blocks is preserved or normalized correctly without breaking the YAML structure.
- **No Parsing**: This tool does **not** parse YAML. It operates solely on line-by-line indentation patterns, making it safe for files containing template syntax (e.g., `{{ .Values... }}`) that would break a standard YAML parser.

### Running Tests
To verify changes, run the test suite:
```bash
bash test.sh
```

### Adding Test Cases
To add a new test case:
1. Create a file `tests/N.in` with the input content.
2. Create a file `tests/N.out` with the expected output content.
3. Run `bash test.sh` to verify.
