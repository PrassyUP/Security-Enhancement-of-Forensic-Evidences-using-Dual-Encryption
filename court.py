from flask import *
from database import *


from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.asymmetric import rsa, padding
from cryptography.fernet import Fernet
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import serialization

from staff import *

import os
court=Blueprint('court',__name__)


from flask import send_file, jsonify



from cryptography.hazmat.primitives import serialization

def decrypt_symmetric_key(private_key_data, encrypted_key):
    # Load private key from data
    private_key = serialization.load_pem_private_key(
        private_key_data,
        password=None,
        backend=default_backend()
    )

    symmetric_key = private_key.decrypt(
        encrypted_key,
        padding.OAEP(
            mgf=padding.MGF1(algorithm=hashes.SHA256()),
            algorithm=hashes.SHA256(),
            label=None
        )
    )
    print("symmetric_keyyyyyyyyyyyyyyyyyyyyy : ", symmetric_key)
    return symmetric_key

@court.route('/courthome')
def courthome():
    return render_template('courthome.html')


@court.route('/Viewcrime',methods=['GET','POST'])
def view():
    data={}
    qry="select * from add_crime "
    data['couviewcr']=select(qry)

    print(select(qry),"/////////////////////////////")
    if 'action' in request.args:
        id=request.args['id']
        action=request.args['action']
    else:
        action=None
    if action == 'request':

        e="update add_crime set status='requested' where crime_num='%s'"%(id)
        update(e)

        qry1="insert into request_evidence values(null,'%s','%s','pending')"%(id,session['court'])
        insert(qry1)

        # rqy2="update request_evidence set evidence_status='requested' where crime_num='%s'"%(id)
        # update(rqy2)
    
        return  """<script>alert('Request');window.location='Viewcrime'</script>"""

    return render_template('/courtviewcrime.html',data=data)


@court.route('/askevidence',methods=['GET','POST'])
def couviewcrime():
    data={}
    id=request.args['id']

    qry="select * from add_crime where crime_num='%s'"%(id)
    data['evid']=select(qry)
   
    return render_template("evidence.html",data=data)




@court.route("/out", methods=['GET', 'POST'])
def out():
    decrypted_file_path = request.args.get('decrypted_file_path')
    return render_template('out.html', decrypted_file_path=decrypted_file_path)






from flask import request, render_template, redirect, url_for

@court.route("/viewfingerprint", methods=['GET', 'POST'])
def viewfingerprint():
    data = {}
    
    id = request.args.get('id')
    print(".............. : ",id)
    data['id']=id
    # if not id:
    #     # Redirect to some error page or handle the missing id case as appropriate
    #     return render_template("error.html", message="ID parameter is missing")

    a = "SELECT * FROM fingerprint WHERE crime_num='%s'" % (id)
    res = select(a)
    
    data['view'] = res
    print(data['view'],"////////////////////////////////////////////")
    
    
    # session['img']=data['view'][0]['image']
    # print("imggggggggggggg",session['img'])

    print("datttttttttaaaaaaaaaaaaaaaaa", data['view'])
    
    action = request.args.get('action')

    if action == "view_decrypt":
        data['status'] = 'view_decrypt'
            
    if 'decrypt_datas' in request.form:
        ids=request.args['ids']
        a = "SELECT * FROM fingerprint WHERE crime_num='%s' and fp_id='%s'" % (id,ids)
        res1 = select(a)
        
        data['views'] = res1
    
        private_key_file = request.files['pk']
        private_key_data = private_key_file.read()  # Read private key file contents
        encrypted_symmetric_key_file = request.files['ensym']
        encrypted_symmetric_key_data = encrypted_symmetric_key_file.read()  # Read encrypted symmetric key file contents
        

        if not private_key_data or not encrypted_symmetric_key_data:
            flash('Both private key and encrypted symmetric key files are required', 'error')
            return redirect(url_for('court.viewfingerprint', id=id, action='view_decrypt'))

        # Decrypt symmetric key using private key data
        symmetric_key = decrypt_symmetric_key(private_key_data, encrypted_symmetric_key_data)
        print(symmetric_key,"llllllllllllllllllllllllllll")

        # Find the encrypted file path in data['view']
        session['img']=data['views'][0]['image']
        encrypted_file_path = session['img']
        print("/////////////////////")
        for item in data['view']:
            if 'encrypted_file_path' in item:
                encrypted_file_path = item['encrypted_file_path']
                print("encrypted_file_path : ",encrypted_file_path)
                break

        if not encrypted_file_path:
            flash('Encrypted file path not found in data', 'error')
            return redirect(url_for('court.viewfingerprint', id=id, action='view_decrypt'))

        # Specify the directory where decrypted files will be stored
        decrypted_directory = "static/decrypted_files"
        if not os.path.exists(decrypted_directory):
            os.makedirs(decrypted_directory)
        
        file_extension = os.path.splitext(encrypted_file_path)[1]

        # Specify the filename for the decrypted file
        # decrypted_file_path = os.path.join(decrypted_directory, "decrypted_file.jpg")
        decrypted_file_path = os.path.join(decrypted_directory, "decrypted_file" + file_extension)

        # Decrypt the file using the decrypted symmetric key
        decrypt_file(encrypted_file_path, decrypted_file_path, symmetric_key)
        
        # Pass the decrypted file path to the template for display or further processing
        data['decrypted_file_path'] = decrypted_file_path
        
        return redirect(url_for('court.out',decrypted_file_path=decrypted_file_path))
        
       
    return render_template("viewfingerprint.html", data=data)




@court.route('/viewvideo',methods=['GET','POST'])
def viewvideo():
    data={}
    id = request.args.get('id')
    print(".............. : ",id)
    data['id']=id
    qry="select * from video where crime_num='%s'"%(id)
    data['view']=select(qry)

    action = request.args.get('action')

    if action == "view_decrypt":
        data['status'] = 'view_decrypt'
            
    if 'decrypt_datas' in request.form:
        ids=request.args['ids']
        a = "SELECT * FROM video WHERE crime_num='%s' and v_id='%s'" % (id,ids)
        res1 = select(a)
        
        data['views'] = res1
    
        private_key_file = request.files['pk']
        private_key_data = private_key_file.read()  # Read private key file contents
        encrypted_symmetric_key_file = request.files['ensym']
        encrypted_symmetric_key_data = encrypted_symmetric_key_file.read()  # Read encrypted symmetric key file contents
        

        if not private_key_data or not encrypted_symmetric_key_data:
            flash('Both private key and encrypted symmetric key files are required', 'error')
            return redirect(url_for('court.viewvideo', id=id, action='view_decrypt'))

        # Decrypt symmetric key using private key data
        symmetric_key = decrypt_symmetric_key(private_key_data, encrypted_symmetric_key_data)
        print(symmetric_key,"llllllllllllllllllllllllllll")

        # Find the encrypted file path in data['view']
        session['img']=data['views'][0]['video']
        encrypted_file_path = session['img']
        print("/////////////////////")
        for item in data['view']:
            if 'encrypted_file_path' in item:
                encrypted_file_path = item['encrypted_file_path']
                print("encrypted_file_path : ",encrypted_file_path)
                break

        if not encrypted_file_path:
            flash('Encrypted file path not found in data', 'error')
            return redirect(url_for('court.viewvideo', id=id, action='view_decrypt'))

        # Specify the directory where decrypted files will be stored
        decrypted_directory = "static/decrypted_files"
        if not os.path.exists(decrypted_directory):
            os.makedirs(decrypted_directory)
        
        file_extension = os.path.splitext(encrypted_file_path)[1]

        # Specify the filename for the decrypted file
        # decrypted_file_path = os.path.join(decrypted_directory, "decrypted_file.jpg")
        decrypted_file_path = os.path.join(decrypted_directory, "decrypted_file" + file_extension)

        # Decrypt the file using the decrypted symmetric key
        decrypt_file(encrypted_file_path, decrypted_file_path, symmetric_key)
        
        # Pass the decrypted file path to the template for display or further processing
        data['decrypted_file_path'] = decrypted_file_path
        
        return redirect(url_for('court.out',decrypted_file_path=decrypted_file_path))
    return render_template('viewvideo.html',data=data)


@court.route('/viewaudio',methods=['GET','POST'])
def viewaudio():
    data={}
    id = request.args.get('id')
    print(".............. : ",id)
    data['id']=id
    qry="select * from audio where crime_num='%s'"%(id)
    data['view']=select(qry)

    action = request.args.get('action')

    if action == "view_decrypt":
        data['status'] = 'view_decrypt'
            
    if 'decrypt_datas' in request.form:
        ids=request.args['ids']
        a = "SELECT * FROM audio WHERE crime_num='%s' and a_id='%s'" % (id,ids)
        res1 = select(a)
        
        data['views'] = res1
    
        private_key_file = request.files['pk']
        private_key_data = private_key_file.read()  # Read private key file contents
        encrypted_symmetric_key_file = request.files['ensym']
        encrypted_symmetric_key_data = encrypted_symmetric_key_file.read()  # Read encrypted symmetric key file contents
        

        if not private_key_data or not encrypted_symmetric_key_data:
            flash('Both private key and encrypted symmetric key files are required', 'error')
            return redirect(url_for('court.viewaudio', id=id, action='view_decrypt'))

        # Decrypt symmetric key using private key data
        symmetric_key = decrypt_symmetric_key(private_key_data, encrypted_symmetric_key_data)
        print(symmetric_key,"llllllllllllllllllllllllllll")

        # Find the encrypted file path in data['view']
        session['img']=data['views'][0]['audio']
        encrypted_file_path = session['img']
        print("/////////////////////")
        for item in data['view']:
            if 'encrypted_file_path' in item:
                encrypted_file_path = item['encrypted_file_path']
                print("encrypted_file_path : ",encrypted_file_path)
                break

        if not encrypted_file_path:
            flash('Encrypted file path not found in data', 'error')
            return redirect(url_for('court.viewaudio', id=id, action='view_decrypt'))

        # Specify the directory where decrypted files will be stored
        decrypted_directory = "static/decrypted_files"
        if not os.path.exists(decrypted_directory):
            os.makedirs(decrypted_directory)
        
        file_extension = os.path.splitext(encrypted_file_path)[1]

        # Specify the filename for the decrypted file
        # decrypted_file_path = os.path.join(decrypted_directory, "decrypted_file.jpg")
        decrypted_file_path = os.path.join(decrypted_directory, "decrypted_file" + file_extension)

        # Decrypt the file using the decrypted symmetric key
        decrypt_file(encrypted_file_path, decrypted_file_path, symmetric_key)
        
        # Pass the decrypted file path to the template for display or further processing
        data['decrypted_file_path'] = decrypted_file_path
        
        return redirect(url_for('court.out',decrypted_file_path=decrypted_file_path))
    return render_template('viewaudio.html',data=data)

# @court.route('/viewfingerprint',methods=['GET','POST'])
# def viewfinger():
#     data={}
#     id=request.args['id']
#     qry="select * from fingerprint where crime_num='%s'"%(id)
#     data['viewfin']=select(qry)
#     return render_template('viewfingerprint.html',data=data)

@court.route('/viewfootprint',methods=['GET','POST'])
def viewfoot():
    data={}
    id=request.args['vfid']
    qry="select * from foot_print where crime_num='%s'"%(id)
    data['viewfoot']=select(qry)
    return render_template('viewfootprint.html',data=data)

@court.route('/viewhairtest',methods=['GET','POST'])
def viewhair():
    data={}
    id=request.args['hid']
    qry="select * from hair_test where crime_num='%s'"%(id)
    data['viewhair']=select(qry)
    return render_template('viewhairtest.html',data=data)

@court.route('/viewpostmortem',methods=['GET','POST'])
def viewpost():
    data={}
    id=request.args['pid']
    qry="select * from post_mortem where crime_num='%s'"%(id)
    data['viewpost']=select(qry)
    return render_template('viewpostmortem.html',data=data)

@court.route('/viewteeth',methods=['GET','POST'])
def viewteeth():
    data={}
    id=request.args['tid']
    qry="select * from teeth where crime_num='%s'"%(id)
    data['viewteeth']=select(qry)
    return render_template('viewteeth.html',data=data)





@court.route('/evidence',methods=['GET','POST'])
def viewevidence():
    data={}
    qry="select * from request_evidence inner join add_crime using(crime_num)"
    data['req']=select(qry)
    return render_template('viewevidence.html',data=data)




from flask import send_file
import os

@staff.route("/download_en_symmetric_key/<path:filename>")
def download_en_symmetric_key(filename):
    # Specify the directory where your .bin files are stored
    directory = ""
    # Decode the filename from bytes to string and remove the unnecessary prefix
    filename = filename.encode("utf-8").decode("utf-8").replace("b'", "").replace("'", "")
    # Join the directory and filename to create the full path
    filepath = os.path.join(directory, filename)
    return send_file(filepath, as_attachment=True)




    

