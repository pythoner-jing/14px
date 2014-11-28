import tornado.wsgi
import sae
import tornado.web
import server


app = tornado.wsgi.WSGIApplication(server.URLS, **server.SETTINGS)
application = sae.create_wsgi_app(app)
