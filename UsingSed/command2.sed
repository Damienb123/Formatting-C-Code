# command2.sed is used as another file for sed innvocations with assign2.bash
# Remove whitespace immediately inside parentheses in conditions
s/\(if\s*([^[:space:]]*\)[[:space:]]\+\([^[:space:]]\)/\1\2/g
s/\(else\s*if\s*([^[:space:]]*\)[[:space:]]\+\([^[:space:]]\)/\1\2/g
