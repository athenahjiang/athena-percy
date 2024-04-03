# validate the project is correct and all necessary information is available
mvn validate

# compile the source code of the project
mvn compile

# test the compiled source code using a suitable unit testing framework
# these tests should not require the code be packaged or deployed
mvn test

# take the compiled code and package it in its distributable format, such as a JAR.
mvn package

# run any checks on results of integration tests to ensure quality criteria are met
mvn verify

# install the package into the local repository
# for use as a dependency in other projects locally
mvn install

# done in the build environment
# copies the final package to the remote repository 
# for sharing with other developers and projects
mvn deploy

# yyds
mvn clean install -DskipTests
mvn clean package -DskipTests

# check pom dependency tree (group id)
mvn dependency:tree -Dincludes='org.apache.cxf'
