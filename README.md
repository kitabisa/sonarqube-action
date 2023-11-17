# SonarQube GitHub Action

Using this GitHub Action, scan your code with SonarQube scanner to detects bugs, vulnerabilities and code smells in more than 20 programming languages!

<img src="https://assets-eu-01.kc-usercontent.com/d1e40bf0-65fc-01ef-5235-9aeaedac229b/12e3974b-220d-4cde-8f17-2ff9fa9d9c27/SonarQube_Logo.svg" width="320px">

SonarQube is an open-source platform developed by SonarSource for continuous inspection of code quality to perform automatic reviews with static analysis of code to detect bugs, code smells, and security vulnerabilities on 20+ programming languages.

## Requirements

* [SonarQube server](https://docs.sonarqube.org/latest/setup/install-server/).
* That's all!

## Usage

The workflow, usually declared in `.github/workflows/build.yaml`, looks like:

```yaml
on:
  # Trigger analysis when pushing in master or pull requests, and when creating
  # a pull request. 
  push:
    branches:
      - master
  pull_request:
      types: [opened, synchronize, reopened]

name: SonarQube Scan
jobs:
  sonarqube:
    name: SonarQube Trigger
    runs-on: ubuntu-latest
    steps:
    - name: Checking out
      uses: actions/checkout@master
      with:
        # Disabling shallow clone is recommended for improving relevancy of reporting
        fetch-depth: 0
    - name: SonarQube Scan
      uses: kitabisa/sonarqube-action@v1.2.0
      with:
        host: ${{ secrets.SONARQUBE_HOST }}
        login: ${{ secrets.SONARQUBE_TOKEN }}
```

You can change the analysis base directory and/or project key by using the optional input like this:

```yaml
uses: kitabisa/sonarqube-action@master
with:
  host: ${{ secrets.SONARQUBE_HOST }}
  login: ${{ secrets.SONARQUBE_TOKEN }}
  projectBaseDir: "src/"
  projectKey: "my-custom-project"
```

### Inputs

These are some of the supported input parameters of action.

| **Parameter**        | **Description**                                   | **Required?** | **Default** | **Note**                                                                                      |
|----------------------|---------------------------------------------------|---------------|-------------|-----------------------------------------------------------------------------------------------|
| **`host`**           | SonarQube server URL                              | 🟢            |             |                                                                                               |
| **`login`**          | Login or authentication token of a SonarQube user | 🟢            |             | `Execute Analysis` permission required.                                                       |
| **`password`**       | The password that goes with the `login` username  | 🔴            |             | This should be left blank if an `login` are authentication token.                             |
| **`projectBaseDir`** | Set custom project base directory analysis        | 🔴            | `.`         |                                                                                               |
| **`projectKey`**     | The project's unique key                          | 🔴            |             | Allowed characters are: letters, numbers, `-`, `_`, `.` and `:`, with at least one non-digit. |
| **`projectName`**    | Name of the project                               | 🔴            |             | It will be displayed on the SonarQube web interface.                                          |
| **`projectVersion`** | The project version                               | 🔴            |             |                                                                                               |
| **`encoding`**       | Encoding of the source code                       | 🔴            | `UTF-8`     |                                                                                               |


> [!NOTE]
> If you opt to configure the project metadata and other related settings in a **`sonar-project.properties`** file (must be placed within the base directory, `projectBaseDir`) instead of using input parameters, this action is compatible with that approach!

## License

The Dockerfile and associated scripts and documentation in this project are released under the MIT License.

Container images built with this project include third party materials.