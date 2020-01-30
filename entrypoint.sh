#!/bin/bash

set -e

if [[ -z "${INPUT_PASSWORD}" ]]; then
	SONAR_PASSWORD="&& true"
else
	SONAR_PASSWORD="${INPUT_PASSWORD}"
fi

sonar-scanner \
	-Dsonar.host.url=${INPUT_HOST} \
	-Dsonar.projectKey=${PWD##*/} \
	-Dsonar.projectBaseDir=${INPUT_PROJECTBASEDIR} \
	-Dsonar.login=${INPUT_LOGIN} \
	-Dsonar.password=${INPUT_PASSWORD} \
	-Dsonar.sources=. \
	-Dsonar.sourceEncoding=UTF-8 \
	${SONAR_PASSWORD}

