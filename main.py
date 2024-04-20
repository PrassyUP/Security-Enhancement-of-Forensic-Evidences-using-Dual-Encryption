from flask import *
from admin import *
from court import *
from staff import *
from public import public 
from police import *
app=Flask(__name__)
app.register_blueprint(public)
app.register_blueprint(admin)
app.register_blueprint(court)
app.register_blueprint(staff)
app.register_blueprint(police)
app.secret_key='234455'
app.run(debug=True)
