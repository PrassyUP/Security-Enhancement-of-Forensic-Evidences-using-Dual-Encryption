from flask import *
from database import *
police=Blueprint('police',__name__)

@police.route('/policehome')
def policehome():
   return render_template('policehome.html')

@police.route('/police',methods=['GET','POST'])
def policereg():
    if 'stsubmit' in request.form:
      stationregno=request.form['stregno']
      zone=request.form['stzone']
      district=request.form['stdist']
      city=request.form['stcity']
      pincode=request.form['stpin']
      stationname=request.form['stname']
      address=request.form['staddress']
      email=request.form['stmail']
      phone=request.form['stphno']
      altphno=request.form['staltphno']
      username=request.form['uname']
      password=request.form['passwd']
      qry1="insert into login values(null,'%s','%s','police')"%(username,password)
      res=insert(qry1)
      qry2="insert into policestation values(null,'%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')"%(res,stationregno,zone,district,city,pincode,stationname,address,email,phone,altphno)
      insert(qry2)

    return render_template('policestation.html')

@police.route('/addcrime',methods=['GET','POST'])
def addcrime():

   if 'crisubmit' in request.form:
    firstname=request.form['crifname']
    lastname=request.form['crilname']
    desig=request.form['cridesig']
    caseno=request.form['caseno']
    typeofcrime=request.form['typeofcri']
    latitude=request.form['lati']
    longitude=request.form['longi']
    date=request.form['cridate']

    qry1="insert into add_crime values(null,'%s','%s','%s','%s','%s','%s','%s','%s','status','%s')"%(session['police'],firstname,lastname,desig,caseno,typeofcrime,latitude,longitude,date)
    insert(qry1)
    return redirect(url_for('police.addcrime'))
    
      
   return render_template('crime.html')

@police.route('/viewcrime',methods=['GET','POST'])
def viewcrime():
   data={}
   qry="select * from add_crime"
   data['viewcrime']=select(qry)
   return render_template('viewcrime.html',data=data)

