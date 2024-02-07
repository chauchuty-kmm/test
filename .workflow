name: Validate Branch Name

on:
  push:
    branches:
      - '*'

jobs:
  validate_branch:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout Repository
      uses: actions/checkout@v2

    - name: Validate Branch Name
      run: |
        if [[ "${GITHUB_REF#refs/heads/}" =~ ^feature/ ]]; then
          echo "Branch name is valid."
        else
          echo "Error: Invalid branch name. Feature branches must start with 'feature/'."
          exit 1
        fi
