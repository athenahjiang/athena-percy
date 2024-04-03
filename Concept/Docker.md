# Docker

## Docker Container in General

A standalone piece that runs something.
Lightweight standalone executable package of software, includes everything needed to run an app, like code, runtime, system tools, system libs, and settings.

## Architecture

* Client - Executes commands to servers (multiple)
* Server/Host/Daemon - Listens for requests from client (can also talk to each other) and manages objects
* Registry - Stores images
* Hub - Public registry that anyone can use (Docker looks for images in hub by default)

## Objects

* Image - Read-only template with instructions for creating a container
* Container - Runnable instance of image (can be deployed into prod env)
* Volume - Persist data generated and used by containers
