#!/bin/bash

# The version of Xcode you want to fetch the framework for.
# If you need a given version built for you let us know.
# Our CI Servers build for XCode 9.#-10.0 by default.

#This directory has to match up with your Framework Search paths in XCode Build Configuration.

FRAMEWORK_DIR=./Framework/Release

#Ensure it exists and change to it.
mkdir -p $FRAMEWORK_DIR
pushd $FRAMEWORK_DIR

source ~/.bash_profile

if [[ -z "${DEQUE_ATTEST_XCODE_VERSION}" ]]; then
    XCODE_VERSION=$(xcodebuild -version | head -n 1 | tr -d '[:space:]')
else
    XCODE_VERSION=$DEQUE_ATTEST_XCODE_VERSION
fi

if [ "$XCODE_VERSION" = "Xcode9.3.1" ]; then
    XCODE_VERSION = "Xcode9.3"
fi

if [ "$XCODE_VERSION" = "Xcode9.4.1" ]; then
    XCODE_VERSION="Xcode9.4"
fi 

ATTEST_FRAMEWORK_VERSION=${DEQUE_ATTEST_IOS_VERSION}

if [ -z "$ATTEST_FRAMEWORK_VERSION" ]; then
    echo "No Attest IOS Framework version set.  Please set the environment variable \${DEQUE_ATTEST_IOS_VERSION} in your Bash profile. A list of framework versions is available at https://www.github.com/dequelabs/Deque-University-for-iOS/wiki/Releases"
    exit 1
fi

if [ -z "${DEQUE_ANON_APIKEY}" ]; then
    echo "No API key found to retrieve the Attest IOS Framework.  In your Bash profile, please set the environment variable \${DEQUE_ANON_APIKEY} to be the API key that you have been emailed. See https://www.github.com/dequelabs/Deque-University-for-iOS/wiki/Getting-Started for more information."
    exit 1
fi

#Try fetching full version.
curl -H "X-JFrog-Art-Api: ${DEQUE_ANON_APIKEY}" \
    -O "https://agora.dequecloud.com/artifactory/Attest-iOS/framework/$XCODE_VERSION/Attest.framework-$ATTEST_FRAMEWORK_VERSION.zip"

#Try unzipping full version of framework
if unzip Attest.framework-$ATTEST_FRAMEWORK_VERSION.zip &> /dev/null; then
    echo "Full Version of Attest Successfully Fetched"
    exit 0
fi

rm -rf Framework

curl -H "X-JFrog-Art-Api: ${DEQUE_ANON_APIKEY}" \
    -O "https://agora.dequecloud.com/artifactory/AttestIOSFree/framework/$XCODE_VERSION/Attest.framework-$ATTEST_FRAMEWORK_VERSION.zip"

#Try unzipping free version of framework
if unzip Attest.framework-$ATTEST_FRAMEWORK_VERSION.zip &> /dev/null; then
    echo "Free Version of Attest Successfully Fetched"
    exit 0
else
    LIBRARY="AttestIOSFree"
    echo "Attest Failed to Download"
    echo "\"$XCODE_VERSION\" should match one of the URIs below (Except the /)"
        curl -H "X-JFrog-Art-Api: ${DEQUE_ANON_APIKEY}" "https://agora.dequecloud.com/artifactory/api/storage/$LIBRARY/framework/"
    
    echo ""

    echo "If your exact Xcode version isn't available you can override this in your bash_profile."
    echo "For example for Xcode 9.3.1 a proper bash_profile entry would be"
    echo ""
    echo "export DEQUE_ATTEST_XCODE_VERSION=Xcode9.3"
    echo "" 

    echo "Also \"$ATTEST_FRAMEWORK_VERSION\" should be available in the list below." 
    echo "The following artifacts are available for $XCODE_VERSION"

    curl -H "X-JFrog-Art-Api: ${DEQUE_ANON_APIKEY}" "https://agora.dequecloud.com/artifactory/api/storage/$LIBRARY/framework/$XCODE_VERSION"
    echo ""
    
    echo "If you're having trouble accessing an Attest framework bundle for your Xcode Version please contact helpdesk@deque.com"
    exit 1
fi
