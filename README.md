# `dorian-yaml-compare`

Compare keys and string leaves between two YAML files.

## Install

```bash
gem install dorian-yaml-compare
```

Also included in the aggregate gem:

```bash
gem install dorian
```

## Usage

```bash
yaml-compare file1.yml file2.yml [root1 root2]
```

Run `yaml-compare -h` for generated option details and `yaml-compare -v` for the installed version.

## Notes

- Useful for locale files. Prints missing keys or type mismatches to stderr and exits non-zero when differences are found.

## Examples

### Compare locale roots

```bash
yaml-compare config/locales/en.yml config/locales/fr.yml en fr
```
