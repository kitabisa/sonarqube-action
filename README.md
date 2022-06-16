# SonarQube GitHub Action

Using this GitHub Action, scan your code with SonarQube scanner to detects bugs, vulnerabilities and code smells in more than 20 programming languages!

<img src="https://www.sonarqube.org/assets/logo-31ad3115b1b4b120f3d1efd63e6b13ac9f1f89437f0cf6881cc4d8b5603a52b4.svg" width="320px">

SonarQube is an open-source platform developed by SonarSource for continuous inspection of code quality to perform automatic reviews with static analysis of code to detect bugs, code smells, and security vulnerabilities on 20+ programming languages.

## Requirements

* [SonarQube server](https://docs.sonarqube.org/latest/setup/install-server/).
* That's all!

## Usage

The workflow, usually declared in `.github/workflows/build.yaml`, looks like:

```yaml
on: push
name: Main Workflow
jobs:
  sonarQubeTrigger:
    name: SonarQube Trigger
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: SonarQube Scan
      uses: kitabisa/sonarqube-action@v1.1.2
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
  projectBaseDir: "/path/to/my-custom-project"
  projectKey: "my-custom-project"
```

### Inputs

These are some of the supported input parameters of action.

- `host` - **_(Required)_** this is the SonarQube server URL.
- `login` - **_(Required)_** the login or authentication token of a SonarQube user with Execute Analysis permission on the project. See [how to generate SonarQube token](https://docs.sonarqube.org/latest/user-guide/user-token/).
- `password` - The password that goes with the `login` username. This should be left blank if an `login` are authentication token.
- `projectBaseDir` - Set custom project base directory analysis.
- `projectKey` - The project's unique key _(allowed characters are: letters, numbers, `-`, `_`, `.` and `:`, with at least one non-digit)_.
- `projectName` - Name of the project that will be displayed on the SonarQube web interface.
- `projectVersion` - The project version.

> **Note**:
> This action also supports the **`sonar-project.properties`** configuration file.
> Please avoid default arguments/properties as [input parameters](#inputs) we use in the action to prevent collisions.

## License

The Dockerfile and associated scripts and documentation in this project are released under the MIT License.

Container images built with this project include third party materials.