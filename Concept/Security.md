<!-- Security -->

# Auth

## Legs

* 2-legged: service-to-service (service scope)
* 3-legged: client-frontend-backend (user scope)

## Authentication (Auth N)

Verifies the identity of a user or service

## Authorization (Auth Z)

Determines the access rights of a user or service


* OAuth 2.0 - industry-standard protocol for authorization

# Certificate

An electronic file tied to a key pair, authenticates (N) identity

## Terms

* Public key - Used for encryption (plain text -> cipher text)
* Private key - Used for decryption (cipher text -> plain text)
* Subject - The owner of public key
* Issuer - The entity that verfies the cert content

## Products

* cacert (Certificate Authority) - Issues certificate to the public at large for free
* Transport Layer Security (TLS)
* Secure Socket Layer (SSL, outdated)

# Token

Identify a session

## JSON Web Token (JWT)

* String of encoded data that represents a user
* Signed by a trusted authority (okta or monolith)
* Only valid for a period of time

## Bearer

An opaque string served as access token used in OAuth 2.0 (sometimes this can be JWT)
