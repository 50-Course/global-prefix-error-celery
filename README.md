This repository aims to reproduce and perform root cause analysis of the production bug:

> Failure for sentinel backend when using `global_prefix` configuration: functools.partial object has not attribute `from_pool`

at Celery - Kombu.

Ref: https://github.com/celery/kombu/issues/1809

Associated patch: https://github.com/celery/kombu/pull/1838


## Installation

To replicate the environment prior to the bug, you should run the following commands on your system:

### Build the image prior to bug:

```sh
$ docker build -f Dockerfile -t celery-prefix-error
```

and run with:

```sh
$ docker run -it celery-prefix-error
```

### Build the image containing the patch:

```sh
$ docker build -f celery-prefix-patched.Dockerfile -t celery-prefix-patched
```

and run with:

```sh
$ docker run -it celery-prefix-patched
```

## Bug tracker

Please report error regarding this issue to official `kombu` repository.
Or continue the discussion at: https://github.com/celery/kombu/issues/1809
