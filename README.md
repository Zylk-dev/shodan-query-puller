# shodan-query-puller
# Shodan Query Puller

A Bash script to pull Shodan queries from GitHub repositories.

## Overview

The **Shodan Query Puller** is a simple script designed to search for and retrieve repositories containing specific Shodan queries. It utilizes GitHub's API to search through repository descriptions, providing users with a convenient way to discover relevant resources.

## Features

- Search GitHub repositories for specific Shodan queries.
- Outputs the repository name and its description.
- Utilizes `curl` to fetch data from the GitHub API and `jq` for JSON parsing.

## Requirements

- **Bash**: The script is written in Bash and should run on any Unix-like system.
- **curl**: Command-line tool for transferring data with URLs.
- **jq**: A lightweight and flexible command-line JSON processor.

### Installation

Make sure you have `curl` and `jq` installed on your system. You can install `jq` using the following commands based on your OS:

- **Ubuntu/Debian**:

    ```bash
    sudo apt-get install jq
    ```

- **macOS** (using Homebrew):

    ```bash
    brew install jq
    ```

- **Windows**: You can use Windows Subsystem for Linux (WSL) and install it as above, or download a binary from the [jq website](https://stedolan.github.io/jq/download/).

## Usage

To use the script, clone the repository and navigate to the project directory:

```bash
git clone https://github.com/Zylk-dev/shodan-query-puller.git
cd shodan-query-puller

## Example Commands

Here are some example commands to use the `pull_shodan_queries.sh` script:

1. `./pull_shodan_queries.sh "security"`
2. `./pull_shodan_queries.sh "network"`
3. `./pull_shodan_queries.sh "vulnerability"`
4. `./pull_shodan_queries.sh "penetration testing"`
5. `./pull_shodan_queries.sh "threat intelligence"`
6. `./pull_shodan_queries.sh "IoT"`
7. `./pull_shodan_queries.sh "malware"`
8. `./pull_shodan_queries.sh "hacking"`
9. `./pull_shodan_queries.sh "cybersecurity"`
10. `./pull_shodan_queries.sh "exploit development"`
