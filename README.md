This repository aims to reproduce and perform root cause analysis of the production bug:

> Failure for sentinel backend when using `global_prefix` configuration: functools.partial object has not attribute `from_pool`

at Celery - Kombu.

Ref: https://github.com/celery/kombu/issues/1809
