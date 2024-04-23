#!/bin/sh

echo "license report"
gradlew --info generateLicenseReport
open build/reports/dependency-license/index.html
gradlew --info checkLicense
open build/reports/dependency-license/dependencies-without-allowed-license.json

echo "Reguired: npm install -g license-report"
license-report --package=src/main/webapp/templates/basecms/package.json --config licensereport-npm.json > build/reports/dependency-license/npm.html
open build/reports/dependency-license/npm.html