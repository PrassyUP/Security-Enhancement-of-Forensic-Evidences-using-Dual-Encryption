from flask import *
from database import *
admin=Blueprint('admin',__name__)

@admin.route('/ad_home')
def home():
    return render_template('ad_home.html')
import uuid

@admin.route('/ad_Managestaff',methods=['GET','POST'])
def managestaff():
    data={}
    qry="select * from add_forensic_staff"
    data['use']=select(qry)
    if 'asubmit' in request.form:
        firstname=request.form['fname']
        lastname=request.form['lname']
        gender=request.form['gender']
        dob=request.form['dob']
        state=request.form['astate']
        district=request.form['adist']
        city=request.form['acity']
        address=request.form['aaddress']
        pincode=request.form['apincode']
        phone=request.form['aphone']
        altphno=request.form['aphone1']
        email=request.form['aemail']
        doj=request.form['doj']
        photo=request.files['aphoto']
        path="static/"+str(uuid.uuid4())+photo.filename
        photo.save(path)
        username=request.form['uname']
        password=request.form['passwd']

        qry1="insert into login values(null,'%s','%s','staff')"%(username,password)
        res=insert(qry1)

        qry="insert into add_forensic_staff values(null,'%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')"%(res,firstname,lastname,gender,dob,state,district,city,address,pincode,phone,altphno,email,doj,path)
        insert(qry)
        return redirect(url_for('admin.managestaff'))
    if 'action' in request.args:
        id=request.args['fid']
        action=request.args['action']
    else:
        action=None


    if action=='delete':
        qry2="delete from add_forensic_staff where fs_id='%s'"%(id)
        delete(qry2)
        return redirect(url_for('admin.managestaff'))

    if action=='update':
        qry5="select * from add_forensic_staff where fs_id ='%s'"%(id)
        res5=select(qry5)
        if res5:
            data['up']=res5
            if 'update' in request.form:
                firstname=request.form['fname']
                lastname=request.form['lname']
                gender=request.form['gender']
                dob=request.form['dob']
                state=request.form['astate']
                district=request.form['adist']
                city=request.form['acity']
                address=request.form['aaddress']
                pincode=request.form['apincode']
                phone=request.form['aphone']
                altphno=request.form['aphone1']
                email=request.form['aemail']
                doj=request.form['doj']
                photo=request.form['aphoto']
                qry4="update add_forensic_staff set fname='%s',lname='%s',gender='%s',dob='%s',state='%s',district='%s',city='%s',address='%s',pincode='%s',phone='%s',alt_phone='%s',email='%s',doj='%s',photo='%s' where fs_id='%s'"%(firstname,lastname,gender,dob,state,district,city,address,pincode,phone,altphno,email,doj,photo,id)
                update(qry4)
                return '''<script>alert('update successful');window.location="ad_Managestaff"</script>'''


    return render_template('ad_managestaff.html',data=data)
    

# @admin.route('/update_form',methods=['GET','POST'])
# def updateform():
#     id=request.args['fid']
#     data={}
#     qry="select * from add_forensic_staff where fs_id='%s'"%(id)
#     data['up']=select(qry)
#     if 'asubmit' in request.form:
#         firstname=request.form['fname']
#         lastname=request.form['lname']
#         gender=request.form['gender']
#         dob=request.form['dob']
#         state=request.form['astate']
#         district=request.form['adist']
#         city=request.form['acity']
#         address=request.form['aaddress']
#         pincode=request.form['apincode']
#         phone=request.form['aphone']
#         altphno=request.form['aphone1']
#         email=request.form['aemail']
#         doj=request.form['doj']
#         photo=request.form['aphoto']

#         qry4="update add_forensic_staff set fname='%s',lname='%s',gender='%s',dob='%s',state='%s',district='%s',city='%s',address='%s',pincode='%s',phone='%s',alt_phone='%s',email='%s',doj='%s',photo='%s' where fs_id='%s'"%(firstname,lastname,gender,dob,state,district,city,address,pincode,phone,altphno,email,doj,photo,id)
#         update(qry4)
#         return '''<script>alert('update successful');window.location="ad_Managestaff"</script>'''
   
#     return render_template('update_form.html',data=data)

@admin.route("/policestation",methods=['GET','POST'])
def viewregpolice():
    data={}
    qry="select * from policestation"
    data['view']=select(qry)
    return render_template('ad_viewpolicestation.html',data=data)

@admin.route('/crime',methods=['GET','POST'])
def viewcrime():
    data={}
    qry="select * from add_crime"
    data['viewcr']=select(qry)

    return render_template("ad_crime.html",data=data)

@admin.route('/ViewCourt',methods=['GET','POST'])
def viewcourt():
    data={}
    qry="select * from court"
    data['cview']=select(qry)

    return render_template("ad_viewcourt.html",data=data)

@admin.route('/assignstaff',methods=['GET','POST'])
def assignstaff():
    data={}
    id=request.args['id']
    qry="SELECT * FROM add_forensic_staff "
    data['assign']=select(qry)
    if 'submit' in request.form:
        staff=request.form['staff']
        qry="insert into assign_staff values(null,'%s','%s','collection')"%(staff,id)
        insert(qry)
     
    return render_template('assignstaff.html',data=data)

@admin.route('/examination',methods=['GET','POST'])
def examine():
    data={}
    id=request.args['id']
    qry="SELECT  * FROM add_forensic_staff"
    data['exam']=select(qry)
    if 'submit' in request.form:
        staff=request.form['staff']
        qry="insert into assign_staff values(null,'%s','%s','examination')"%(staff,id)
        insert(qry)

    return render_template("examination.html",data=data)

@admin.route('/viewcourtreq',methods=['GET','POST'])
def viewcourtreq():

    data={}
    qry="select * from add_crime inner join request_evidence using(crime_num) where evidence_status='pending'"
    data['B']=select(qry)
    if 'action' in request.args:
        id=request.args['pid']
        action=request.args['action']
    else:
        action=None
    if action == 'accept':
        pry1="update request_evidence set evidence_status='accepted' where crime_num='%s'"%(id)
        update(pry1)
        return  """<script>alert('Accept');window.location='viewcourtreq'</script>"""


    return render_template("ad_viewcourtreq.html",data=data)









