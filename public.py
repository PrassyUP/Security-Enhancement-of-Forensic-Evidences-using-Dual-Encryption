from flask import *
from database import *
public=Blueprint('public',__name__)


@public.route('/')
def home():
    return render_template('home.html')

@public.route('/login',methods=['GET','POST'])
def login():
    if 'submit' in request.form:
        username=request.form['uname']
        password=request.form['passwd']
        qry="select * from login where username='%s' and password='%s'"%(username,password)
        res=select(qry)

        if res:
            session['logid']=res[0]['login_id']

            if res[0]['usertype']=='admin':
                return redirect(url_for('admin.home'))
            # elif res[0]['usertype']=='court':
            #     obj="select * from court where login_id='%s'"%(session['logid'])
            #     re2=select(obj)
            #     print(re2,"$$$$$$$$$$$$$$$$$$$$$$$$$")
            #     session['court']=re2[0]['court_id']
            #     return redirect(url_for('court.courthome'))
            
            elif res[0]['usertype']=='court':
                qry8="select * from `court`  where login_id = '%s'"%(session['logid'])
                res8=select(qry8)
                session['court']=res8[0]['court_id']
                return redirect(url_for('court.courthome'))
            
            elif res[0]['usertype']=='staff':
                qry8="select * from add_forensic_staff  where login_id='%s'"%(session['logid'])
                res8=select(qry8)
                session['staff']=res8[0]['fs_id']
                q1="insert into attendance values(null,'%s','status',now())"%(session['staff'])
                insert(q1)
                return redirect(url_for('staff.staffhome'))
            
            elif res[0]['usertype']=='police':
                qry9="select * from policestation where login_id='%s'"%(session['logid'])
                res9=select(qry9)
                session['police']=res9[0]['station_id']
                return redirect(url_for('police.policehome')) 
        else:
            return  """<script>alert('Invalid request');window.location='login'</script>"""



    return render_template('login.html')

@public.route('/court',methods=['GET','POST'])
def courtreg():
    if 'cosubmit' in request.form:
        courtregnum=request.form['crtregnum']
        courtname=request.form['crtname']
        typecourt=request.form['typcrt']
        state=request.form['state']
        district=request.form['dstr']
        address=request.form['address']
        pincode=request.form['pcode']
        email=request.form['email']
        phonenum=request.form['phno1']
        altphoneno=request.form['phno2']
        officername=request.form['offname']
        username=request.form['uname']
        password=request.form['passwd']

        qry1="insert into login values(null,'%s','%s','court')"%(username,password)
        res=insert(qry1)

        qry="insert into court values(null,'%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')"%(res,courtregnum,courtname,typecourt,state,district,address,pincode,email,phonenum,altphoneno,officername)
        insert(qry)

    return render_template('court_reg.html')

@public.route('/forensicstaff',methods=['GET','POST'])
def addstaff():
    return render_template('addstaff.html')

