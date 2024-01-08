from celery import Celery


app = Celery('tasks', broker='redis://localhost:6379/0')

app.conf.broker_url = 'sentinel://localhost:26379;sentinel://localhost:26380;sentinel://localhost:26381'


app.conf.broker_transport_options = {
    'master_name': 'mymaster',
    'sentinels': [('localhost', 26379),
                  ('localhost', 26380),
                  ('localhost', 26381)],
    'service_name': 'mymaster',
    'socket_timeout': 30,
    'retry_on_timeout': True
}

if __name__ == '__main__':
    app.start()
