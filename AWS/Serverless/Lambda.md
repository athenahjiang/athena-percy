<!-- Lambda -->

Run code without thinking about servers

<!-- Terms -->

* Function - A resource that can be invoked to run code.

* Trigger - A resource or config that invokes a lambda function.

* Event Source Mapping - A resource in lambda that reads items from a stream or queue and invokes a function.

* Event - A JSON that contains data for a lambda to process. When an AWS service invokes the lambda function, the service defines the shape of the event.

* Execution Environment - Provides a secure and isolated runtime env for the lambda function and manages the resources that are required to run the function.

* Instruction Set Architecture - Determines the type of computer processor that lambda uses to run the function.

* Deployment Package - Deploy the lambda function code into either a zip file archive that contains code and dependencies or a container image including the operating system and lambda runtime.

* Runtime - Provides a language-specific environment that runs in an execution environment. For zip file archive, function must be configured to use a runtime that matches the programming language. For container image, runtime must be included when the image is built.

* Layer - A zip file archive that can obtain additional code or content. Can contain libraries, a custom runtime, data, or config files. Functions deployed as container images do not use layers.

* Extension - Integrate lambda function with preferred monitoring, observability, security, and governance tools.

* Concurrency - The number of requests that the function is serving at any given time. How many requests can the lambda function handle at once.

* Qualifier - Either a version or an alias. A version is an immutable snapshot of a function's code and configs that has numerical qualifier, like "my-function:1". An alias is a pointer to a version, like "my-function:BLUE".

* Destination - An AWS resource where lambda can send events to.

<!-- Operation -->

# Event Driven

Functions get invoked by AWS event when needed.

# Integration

* Integrated with the whole AWS suite of services.
* Integrated with many programming languages.
* Easy to monitor with AWS CloudWatch.
* Easy to get more resources per functions (up to 10GB of RAM).

# Examples

* new image in s3 -> lambda stores metadata in db
* cloudwatch events eventbridge trigger every hour -> lambda performs task

<!-- Performance -->

<!-- Pricing -->

* Pay per request and compute time
* Free tier of 1,000,000 AWS Lambda requests
* Free tier of 400,000 GBs of compute time

<!-- Security -->

<!-- Test -->
