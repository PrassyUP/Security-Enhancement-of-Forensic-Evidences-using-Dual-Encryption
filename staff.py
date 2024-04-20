from flask import *
from database import *

import uuid

from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.asymmetric import rsa, padding
from cryptography.fernet import Fernet
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import serialization
from m3 import *
staff=Blueprint('staff',__name__)

@staff.route('/staffhome')
def staffhome():
    return render_template('staffhome.html')

@staff.route('/updateprofile',methods=['GET','POST'])
def updateprofile():
    data={}
    qry="select * from add_forensic_staff where fs_id='%s'"%(session['staff'])
    data['update']=select(qry)
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
        return redirect(url_for('staff.updateprofile'))

        
    if 'action' in request.args:
        id=request.args['fid']
        action=request.args['action']
    else:
        action=None


    if action=='update':
        qry5="select * from add_forensic_staff where fs_id ='%s'"%(id)
        res6=select(qry5)
        if res6:
            data['upd']=res6
            if 'updates' in request.form:
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
                return '''<script>alert('update successful');window.location="updateprofile"</script>'''
    return render_template('viewstaffprofile.html',data=data)


@staff.route('/viewevidence',methods=['GET','POST'])
def viewevid():
    data={}
    qry="select * from add_crime inner join assign_staff using(crime_num) where fs_id='%s'"%(session['staff'])
    data['viewevid']=select(qry)

    return render_template('viewallocatedcase.html',data=data)




# from flask import request

# # Existing code...

# # Integration of provided logic into the existing function
# @staff.route("/finger_print", methods=['post', 'get'])
# def finger_print():
#     data = {}
#     cid = request.args.get('cid', None)

#     # Generate RSA key pair for key exchange
#     private_key, public_key = generate_rsa_key_pair()
    
#     # Save private key to a file
#     private_key_path = "static/" + str(uuid.uuid4()) + "_private.pem"
#     with open(private_key_path, 'wb') as private_key_file:
#         private_key_file.write(private_key.private_bytes(
#             encoding=serialization.Encoding.PEM,
#             format=serialization.PrivateFormat.PKCS8,
#             encryption_algorithm=serialization.NoEncryption()
#         ))

#     # Save public key to a file
#     public_key_path = "static/" + str(uuid.uuid4()) + "_public.pem"
#     with open(public_key_path, 'wb') as public_key_file:
#         public_key_file.write(public_key.public_bytes(
#             encoding=serialization.Encoding.PEM,
#             format=serialization.PublicFormat.SubjectPublicKeyInfo
#         ))

#     # Generate a symmetric key for file encryption
#     symmetric_key = Fernet.generate_key()
    
#     # Encrypt the symmetric key with the public key
#     encrypted_symmetric_key = encrypt_symmetric_key(public_key, symmetric_key)
    
#     # Save the encrypted symmetric key to a file
#     symmetric_key_path = "static/" + str(uuid.uuid4()) + "_encrypted_symmetric_key.bin"
#     with open(symmetric_key_path, 'wb') as key_file:
#         key_file.write(encrypted_symmetric_key)
    
#     # Process form data
#     if 'submit' in request.form:
#         ptn = request.form['ptn']
#         rf = request.form['rf']
#         moc = request.form['moc']
#         ai = request.form['ai']
#         img = request.files['img']
#         path = "static/" + str(uuid.uuid4()) + img.filename
#         img.save(path)

#         input_file_path = path
        
#         # Encrypt multimedia file
#         # encrypted_file_path = "static/" + str(uuid.uuid4()) + "_finger_encrypted.jpg"
#         encrypted_file_path = "static/" + str(uuid.uuid4()) + "_finger_encrypted"+img.filename
#         encrypt_file(input_file_path, encrypted_file_path, symmetric_key)
#         print("Multimedia file encrypted and saved as:", encrypted_file_path)
        
#         # Insert data into the database
#         s = "insert into fingerprint values(null, '%s', '%s', '%s', '%s', '%s', '%s', '%s', now(), 'pending','%s','%s')" % (
#             cid, session['fid'], ptn, rf, moc, ai, encrypted_file_path, private_key_path, symmetric_key_path)
#         insert(s)

#         return '''<script>alert("Added");window.location="/staff_assigned_cases"</script>'''

#     # Retrieve data from the database for viewing
#     a = "select * from fingerprint where fs_id='%s' and crime_id='%s' " % (session['fid'], cid)
#     data['view'] = select(a)

#     return render_template("finger_print.html", data=data)


@staff.route('/finger',methods=['GET','POST'])
def fingerprint():
    
    data={}
    id=request.args['id']
    qry="select * from fingerprint where crime_num = '%s'"%(id)
    data['view']=select(qry)
     # Generate RSA key pair for key exchange
    private_key, public_key = generate_rsa_key_pair()
    
    # Save private key to a file
    private_key_path = "static/" + str(uuid.uuid4()) + "_private.pem"
    with open(private_key_path, 'wb') as private_key_file:
        private_key_file.write(private_key.private_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PrivateFormat.PKCS8,
            encryption_algorithm=serialization.NoEncryption()
        ))

    # Save public key to a file
    public_key_path = "static/" + str(uuid.uuid4()) + "_public.pem"
    with open(public_key_path, 'wb') as public_key_file:
        public_key_file.write(public_key.public_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PublicFormat.SubjectPublicKeyInfo
        ))

    # Generate a symmetric key for file encryption
    symmetric_key = Fernet.generate_key()
    
    # Encrypt the symmetric key with the public key
    encrypted_symmetric_key = encrypt_symmetric_key(public_key, symmetric_key)
    
    # Save the encrypted symmetric key to a file
    symmetric_key_path = "static/" + str(uuid.uuid4()) + "_encrypted_symmetric_key.bin"
    with open(symmetric_key_path, 'wb') as key_file:
        key_file.write(encrypted_symmetric_key)
    
    if 'fsubmit' in request.form:
        pattern=request.form['pattern']
        refpoint=request.form['refpoint']
        methodofcoll=request.form['metofcoll']
        additionalinfo=request.form['addinfo']
        # image=request.form['image']
        img = request.files['image']
        path = "static/" + str(uuid.uuid4()) + img.filename
        img.save(path)

        input_file_path = path

        # qry="insert into fingerprint values(null,'%s','%s','%s','%s','%s','%s','%s','date','fstatus')"%(id,session['staff'],pattern,refpoint,methodofcoll,additionalinfo,image)
        # insert(qry)
        
                # Encrypt multimedia file
        # encrypted_file_path = "static/" + str(uuid.uuid4()) + "_finger_encrypted.jpg"
        encrypted_file_path = "static/" + str(uuid.uuid4()) + "_finger_encrypted"+img.filename
        encrypt_file(input_file_path, encrypted_file_path, symmetric_key)
        print("Multimedia file encrypted and saved as:", encrypted_file_path)
        
        # Insert data into the database
        s = "insert into fingerprint values(null, '%s', '%s', '%s', '%s', '%s', '%s', '%s', now(), 'pending','%s','%s')" % (
            id, session['staff'], pattern, refpoint, methodofcoll, additionalinfo, encrypted_file_path, private_key_path, symmetric_key_path)
        insert(s)

        return '''<script>alert("Added");window.location="/viewevidence"</script>'''
        
    return render_template('fingerprint.html',data=data)

@staff.route('/footprint',methods=['GET','POST'])
def footprint():
    data={}
    
    # qry1="select * from add_crime inner join assign_staff using(crime_num)"
    # res=select(qry1)
    # print(res)

    id=request.args['fid']
    qry1="select * from foot_print where crime_num='%s'"%(id)
    data['viewfoot']=select(qry1)

    if 'ftsubmit' in request.form:
        leftlen=request.form['leflen']
        leftwid=request.form['lefwid']
        rightlen=request.form['riglen']
        rightwid=request.form['rigwid']
        additionalinfo=request.form['footaddinfo']
        height=request.form['height']
        gender=request.form['gender']

        qry="insert into foot_print values(null,'%s','%s','%s','%s','%s','%s','%s','%s','%s','date','status')"%(id,session['staff'],leftlen,leftwid,rightlen,rightwid,additionalinfo,height,gender)
        insert(qry)
        return redirect(url_for('staff.footprint'))

    return render_template('footprint.html',data=data)

@staff.route('/video',methods=['GET','POST'])
def vid():
    data={}
    id=request.args['vid']
    qry1="select * from video where crime_num='%s'"%(id)
    data['view']=select(qry1)
    

    private_key, public_key = generate_rsa_key_pair()
    
    # Save private key to a file
    private_key_path = "static/" + str(uuid.uuid4()) + "_private.pem"
    with open(private_key_path, 'wb') as private_key_file:
        private_key_file.write(private_key.private_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PrivateFormat.PKCS8,
            encryption_algorithm=serialization.NoEncryption()
        ))

    # Save public key to a file
    public_key_path = "static/" + str(uuid.uuid4()) + "_public.pem"
    with open(public_key_path, 'wb') as public_key_file:
        public_key_file.write(public_key.public_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PublicFormat.SubjectPublicKeyInfo
        ))

    # Generate a symmetric key for file encryption
    symmetric_key = Fernet.generate_key()
    
    # Encrypt the symmetric key with the public key
    encrypted_symmetric_key = encrypt_symmetric_key(public_key, symmetric_key)
    
    # Save the encrypted symmetric key to a file
    symmetric_key_path = "static/" + str(uuid.uuid4()) + "_encrypted_symmetric_key.bin"
    with open(symmetric_key_path, 'wb') as key_file:
        key_file.write(encrypted_symmetric_key)
    if 'vsubmit' in request.form:
    
        img = request.files['video']
        path = "static/" + str(uuid.uuid4()) + img.filename
        img.save(path)

        input_file_path = path

        encrypted_file_path = "static/" + str(uuid.uuid4()) + "_finger_encrypted"+img.filename
        encrypt_file(input_file_path, encrypted_file_path, symmetric_key)
        print("Multimedia file encrypted and saved as:", encrypted_file_path)
        qry="insert into video values(null,'%s','%s','%s',now(),'status','%s','%s')"%(session['staff'],id,encrypted_file_path,private_key_path, symmetric_key_path)
        insert(qry)
        return '''<script>alert("Added");window.location="/viewevidence"</script>'''
    return render_template('video.html',data=data)

@staff.route('/audio',methods=['GET','POST'])
def aud():
    data={}
    id=request.args['aid']
    qry1="select * from audio where crime_num='%s'"%(id)
    data['view']=select(qry1)
    
    private_key, public_key = generate_rsa_key_pair()
    
    # Save private key to a file
    private_key_path = "static/" + str(uuid.uuid4()) + "_private.pem"
    with open(private_key_path, 'wb') as private_key_file:
        private_key_file.write(private_key.private_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PrivateFormat.PKCS8,
            encryption_algorithm=serialization.NoEncryption()
        ))

    # Save public key to a file
    public_key_path = "static/" + str(uuid.uuid4()) + "_public.pem"
    with open(public_key_path, 'wb') as public_key_file:
        public_key_file.write(public_key.public_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PublicFormat.SubjectPublicKeyInfo
        ))

    # Generate a symmetric key for file encryption
    symmetric_key = Fernet.generate_key()
    
    # Encrypt the symmetric key with the public key
    encrypted_symmetric_key = encrypt_symmetric_key(public_key, symmetric_key)
    
    # Save the encrypted symmetric key to a file
    symmetric_key_path = "static/" + str(uuid.uuid4()) + "_encrypted_symmetric_key.bin"
    with open(symmetric_key_path, 'wb') as key_file:
        key_file.write(encrypted_symmetric_key)
    if 'asubmit' in request.form:
        img = request.files['audio']
        path = "static/" + str(uuid.uuid4()) + img.filename
        img.save(path)
        input_file_path = path

        encrypted_file_path = "static/" + str(uuid.uuid4()) + "_finger_encrypted"+img.filename
        encrypt_file(input_file_path, encrypted_file_path, symmetric_key)
        print("Multimedia file encrypted and saved as:", encrypted_file_path)
        qry="insert into audio values(null,'%s','%s','%s',now(),'status','%s','%s')"%(session['staff'],id,encrypted_file_path,private_key_path, symmetric_key_path)
        insert(qry)
        return '''<script>alert("Added");window.location="/viewevidence"</script>'''
    return render_template('audio.html',data=data)

@staff.route('/hairtest',methods=['GET','POST'])
def hairtest():
    data={}
    id=request.args['hid']
    qry1="select * from hair_test where crime_num='%s'"%(id)
    data['viewhair']=select(qry1)
    
    if 'hairsubmit' in request.form:
        hairfiber=request.form['hairfib']
        diamedu=request.form['diamedu']
        diahair=request.form['diahair']
        whichpart=request.form['whpart']
        prebarrbody=request.form['prebarrbody']
        aniorhum=request.form['aniorhu']
        gender=request.form['gender']
        qry="insert into hair_test values(null,'%s','%s','%s','%s','%s','%s','%s','%s','%s','status')"%(id,session['staff'],hairfiber,diamedu,diahair,whichpart,prebarrbody,aniorhum,gender)
        insert(qry)
        return '''<script>alert("Added");window.location="/viewevidence"</script>'''
    return render_template('hairtest.html',data=data)

@staff.route('/postmortem',methods=['GET','POST'])
def post():
    data={}
    id=request.args['pid']
    qry1="select * from post_mortem where crime_num='%s'"%(id)
    data['viewpost']=select(qry1)
    if 'postsubmit' in request.form:
        bodytemp=request.form['bodytemp']
        changeineye=request.form['changeineye']
        livormortis=request.form['livormortis']
        degradation=request.form['degrade']
        timesincedeath=request.form['timehrs']
        degradationtime=request.form['degradetime']
        qry="insert into post_mortem values(null,'%s','%s','%s','%s','%s','%s','%s','%s',now(),'status')"%(id,session['staff'],bodytemp,changeineye,livormortis,degradation,timesincedeath,degradationtime)
        insert(qry)
        return '''<script>alert("Added");window.location="/viewevidence"</script>'''

    return render_template('postmortem.html',data=data)

@staff.route('/teeth',methods=['GET','POST'])
def teeth():
    data={}
    id=request.args['tid']
    qry1="select * from teeth where crime_num='%s'"%(id)
    data['viewteeth']=select(qry1)
    
    if 'teethsubmit' in request.form:
        rootdiv=request.form['rootdiv']
        appear=request.form['tappear']
        color=request.form['tcolor']
        edge=request.form['tedge']
        teethindent=request.form['tindent']
        temptypeteeth=request.form['temptypteeth']
        permtypeteeth=request.form['pertypteeth']
        qry ="insert into teeth values(null,'%s','%s','%s','%s','%s','%s','%s','%s','%s',now(),'status')"%(id,session['staff'],rootdiv,appear,color,edge,teethindent,temptypeteeth,permtypeteeth)
        insert(qry)
        return '''<script>alert("Added");window.location="/viewevidence"</script>'''
    return render_template('teeth.html',data=data)




