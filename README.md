# sales-dbt

Welcome to the sales-dbt repository. This repo contains the dbt transformation logic, documentation, tests, and analytics models for our AcmeMart transaction analytics pipeline. It is intended for all team members who need to set up Bitcld, work with the DRT repo, and contribute safely and consistently.

## Table of Contents

- [Purpose](#purpose)
- [What is Bitcld](#what-is-bitcld)
- [Prerequisites](#prerequisites)
- [Local Setup](#local-setup)
  - [Clone the Repo](#clone-the-repo)
  - [Install Bitcld](#install-bitcld)
  - [Install dbt](#install-dbt)
  - [Configure dbt Profiles](#configure-dbt-profiles)
- [Working with the DRT Repo](#working-with-the-drt-repo)
  - [Branching and Naming](#branching-and-naming)
  - [Building and Testing Changes](#building-and-testing-changes)
  - [Documenting Changes](#documenting-changes)
  - [Submitting a Pull Request](#submitting-a-pull-request)
- [Repository Structure](#repository-structure)
- [Common Commands](#common-commands)
- [Troubleshooting](#troubleshooting)
- [How to Ask for Help](#how-to-ask-for-help)

## Purpose

This README is designed to help any team member:

- get Bitcld installed and configured,
- clone and set up the DRT repo locally,
- run dbt models and tests,
- contribute code, documentation, and tests in a standard way.

## What is Bitcld

Bitcld is our team’s standard tooling platform for repository initialization, dependency management, and environment setup. In this repo, Bitcld helps ensure that everyone uses the same local setup, consistent Git flow, and recommended tooling when working on DRT.

> If you are unsure whether Bitcld is already installed on your machine, follow the steps below to install and verify it.

## Prerequisites

Before you begin, make sure you have:

- access to the `Sales-dbt` repository and the DRT repo in your organization,
- a GitHub account with the correct repo access,
- a supported command line shell on Windows (PowerShell, Git Bash, or Windows Terminal),
- Python 3.10+ installed if dbt is installed locally,
- the latest version of Git installed.

## Local Setup

### Clone the Repo

1. Open a terminal in the workspace directory.
2. Run:

```bash
git clone https://github.com/Sidikat123/Sales-dbt.git
cd Sales-dbt
```

3. Confirm the repo contains `dbt_project.yml`, `models/`, and `README.md`.

### Install Bitcld

1. Follow your organization’s Bitcld installation guide. If you do not have a guide yet, use the standard install command provided by the team.

2. Once installed, verify Bitcld is available:

```bash
bitcld --version
```

3. If the command succeeds, Bitcld is installed correctly.

### Install dbt

We use dbt for model development, testing, and documentation.

1. Install dbt using pip or your preferred Python package manager.

```bash
python -m pip install dbt-core dbt-postgres
```

2. Confirm dbt is installed:

```bash
dbt --version
```

3. If your team uses a specific dbt adapter, install that adapter instead of `dbt-postgres`.

### Configure dbt Profiles

The repo uses the `default` profile defined in `dbt_project.yml`.

1. Create or update `~/.dbt/profiles.yml`.
2. Add a profile entry matching your environment. Example:

```yaml
default:
  target: dev
  outputs:
    dev:
      type: postgres
      host: your-host.example.com
      user: your-user
      password: your-password
      dbname: your_database
      schema: your_schema
      threads: 4
```

3. Confirm that dbt can connect:

```bash
dbt debug
```

4. Fix any issues shown by `dbt debug` before continuing.

## Working with the DRT Repo

The DRT repository is our shared environment for data transformation work. Follow these guidelines when making changes.

### Branching and Naming

1. Always create a feature branch for your work.

```bash
git checkout -b feature/<short-description>
```

2. Use a clear branch name with a prefix such as:

- `feature/` for new models or enhancements,
- `bugfix/` for fixes,
- `hotfix/` for urgent production fixes.

3. Keep the branch name short but descriptive, for example:

- `feature/add-facebook-ad-sales-staging`
- `bugfix/fix-google-sales-email`

### Building and Testing Changes

Use dbt to validate your changes before you submit a pull request.

1. Run your models locally:

```bash
dbt run --models <model_name>
```

2. Run tests for changed models:

```bash
dbt test --models <model_name>
```

3. Optionally run the full project if needed:

```bash
dbt build
```

4. If you have added or updated seeds, refresh them:

```bash
dbt seed
```

### Documenting Changes

1. Add or update docs for any new or changed model files.
2. Use YAML schema files in `models/` or `models/staging/` to document sources and model metadata.
3. Keep descriptions current so the next team member can understand the logic and dependencies.

### Submitting a Pull Request

1. Push your branch:

```bash
git push origin feature/<short-description>
```

2. Open a pull request against the main branch.
3. Include:

- a short summary of what changed,
- the models affected,
- any tests run,
- any required follow-up actions.

4. Request review from at least one other data team member.

## Repository Structure

The repo follows a standard dbt layout:

- `dbt_project.yml` - main dbt project configuration.
- `models/` - dbt SQL model files.
- `models/staging/` - staging models that clean and shape raw source data.
- `macros/` - reusable dbt macros used by models and hooks.
- `tests/` - custom tests and assertions.
- `seeds/` - CSV seed data loaded by dbt.
- `snapshots/` - snapshot definitions for slowly changing datasets.
- `analyses/` - ad hoc SQL queries and analytics explorations.

## Common Commands

- `dbt debug` - verify dbt connection and configuration.
- `dbt run` - build models.
- `dbt test` - run tests.
- `dbt build` - run models, tests, and snapshots.
- `dbt seed` - load seed data.
- `dbt docs generate` - build documentation.
- `dbt docs serve` - view docs locally.

## Troubleshooting

### Bitcld Issues

- Confirm Bitcld is installed and on your `PATH`.
- Run `bitcld --help` or `bitcld --version`.
- If Bitcld does not start, reinstall it using the team’s approved installer.

### dbt Connection Issues

- Verify the profile name in `dbt_project.yml` matches `~/.dbt/profiles.yml`.
- Confirm database credentials and host values.
- Use `dbt debug` to identify the failing step.

### Git and Branching Issues

- Use `git status` to see uncommitted changes.
- Use `git pull --rebase` before pushing to reduce merge conflicts.
- If a branch is stale, rebase onto `main` or merge main before submitting a PR.

## How to Ask for Help

If you need assistance:

- share your current terminal commands,
- include the output from `dbt debug`,
- describe the exact repo paths you are changing,
- tag the data team channel or a teammate responsible for DRT.

---

Thank you for contributing to the sales-dbt and DRT workflows. Keeping these steps consistent helps the whole team deliver stable, documented, and testable data transformations.

