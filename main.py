from celery import Celery

app = Celery('simple app')

app.conf.broker_url = "sentinel://localhost:6379"

app.conf.broker_transport_options = {
    "global_keyprefix": "prefix-local",
    "master_name": "master",
}

if __name__ == '__main__':
    app.start()

