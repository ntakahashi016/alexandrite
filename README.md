# Alexandrite
Alexandrite is a lending management system targeting mainly libraries.<br>
It can manage not only books, but also lending and returning any registered resources.

Ver 0.1 is intended for managing bookshelves in the home. Place a client terminal near the bookshelf.

## Table of Contents
- Introduction
- Installation
- Documentation
- License

## Introduction
- Main Features
  - For Users
    - Manageing lending and returning of resources
    - Searching for resources
    - Checking own history
  - For Administrators
    - Registera, edit, and delete resources
    - Registera, edit, and delete users
- Optional Features
  - Print lending slips (compatible printer: EPSON TM-m10 (M332B))
  - Create user barcodes

## Installation
To install Alexandrite, you need to set up a "server" and a "client".

### Server
There are several ways to set up a server.
- docker-compose
- On-Premise

For more information, see [here](./app/api/README.md).

### Client
Currently, only the web version of the client is available. <br>
Once the server setup is complete, access the web client screen using a web browser on the client terminal. <br>
For more information, see [here](./app/client/README.md).

## Documentation
- User's Guide
- Administrator's Guide
- Developer's Guide

## License
See [License](./LICENCE).
