#!/bin/bash

set -e

if [[ "${GITHUB_EVENT_NAME}" == "pull_request" ]]; then
	EVENT_ACTION=$(jq -r ".action" "${GITHUB_EVENT_PATH}")
	if [[ "${EVENT_ACTION}" != "opened" ]]; then
		echo "No need to run analysis. It is already triggered by the push event."
		exit 78
	fi
fi

[[ ! -z ${INPUT_PASSWORD} ]] && SONAR_PASSWORD="${INPUT_PASSWORD}" || SONAR_PASSWORD=""
[[ ! -z ${INPUT_PROJECTKEY} ]] && SONAR_PROJECTKEY="${INPUT_PROJECTKEY}" || SONAR_PROJECTKEY=""
[[ ! -z ${INPUT_PROJECTNAME} ]] && SONAR_PROJECTNAME="${INPUT_PROJECTNAME}" || SONAR_PROJECTNAME=""
[[ ! -z ${INPUT_PROJECTVERSION} ]] && SONAR_PROJECTVERSION="${INPUT_PROJECTVERSION}" || SONAR_PROJECTVERSION=""


sonar-scanner \
	-Dsonar.host.url=${INPUT_HOST} \
	-Dsonar.projectKey=${SONAR_PROJECTKEY} \
	-Dsonar.projectName=${SONAR_PROJECTNAME} \
	-Dsonar.projectVersion=${SONAR_PROJECTVERSION} \
	-Dsonar.projectBaseDir=${INPUT_PROJECTBASEDIR} \
	-Dsonar.login=${INPUT_LOGIN} \
	-Dsonar.password=${INPUT_PASSWORD} \
	-Dsonar.sources=. \
	-Dsonar.sourceEncoding=UTF-8
