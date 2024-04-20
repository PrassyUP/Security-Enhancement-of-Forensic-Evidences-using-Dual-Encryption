# readMe_m3.txt 

from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.asymmetric import rsa, padding
from cryptography.fernet import Fernet
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import serialization

def generate_rsa_key_pair():
    private_key = rsa.generate_private_key(
        public_exponent=65537,
        key_size=2048,
        backend=default_backend()
    )
    return private_key, private_key.public_key()

def encrypt_symmetric_key(public_key, symmetric_key):
    encrypted_key = public_key.encrypt(
        symmetric_key,
        padding.OAEP(
            mgf=padding.MGF1(algorithm=hashes.SHA256()),
            algorithm=hashes.SHA256(),
            label=None
        )
    )
    return encrypted_key

def decrypt_symmetric_key(private_key, encrypted_key):
    symmetric_key = private_key.decrypt(
        encrypted_key,
        padding.OAEP(
            mgf=padding.MGF1(algorithm=hashes.SHA256()),
            algorithm=hashes.SHA256(),
            label=None
        )
    )
    return symmetric_key

def encrypt_file(input_file_path, output_file_path, symmetric_key):
    cipher = Fernet(symmetric_key)
    
    with open(input_file_path, 'rb') as file:
        file_data = file.read()
    
    encrypted_data = cipher.encrypt(file_data)
    
    with open(output_file_path, 'wb') as encrypted_file:
        encrypted_file.write(encrypted_data)

def decrypt_file(input_file_path, output_file_path, symmetric_key):
    cipher = Fernet(symmetric_key)
    
    with open(input_file_path, 'rb') as encrypted_file:
        encrypted_data = encrypted_file.read()
    
    decrypted_data = cipher.decrypt(encrypted_data)
    
    with open(output_file_path, 'wb') as decrypted_file:
        decrypted_file.write(decrypted_data)

if __name__ == "__main__":
    # Generate RSA key pair for key exchange
    private_key, public_key = generate_rsa_key_pair()
    
    
       # Save private key to a file
    with open('private_key.pem', 'wb') as private_key_file:
        private_key_file.write(private_key.private_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PrivateFormat.PKCS8,
            encryption_algorithm=serialization.NoEncryption()
        ))

    # Save public key to a file
    with open('public_key.pem', 'wb') as public_key_file:
        public_key_file.write(public_key.public_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PublicFormat.SubjectPublicKeyInfo
        ))
        
        
        # Save the encrypted symmetric key to a file (for decryption)
    

    
    # Generate a symmetric key for file encryption
    symmetric_key = Fernet.generate_key()
    
    # Encrypt the symmetric key with the public key
    
    
    # Specify the paths for input and output files
    input_file_path = 'vdo.mp4'
    encrypted_file_path = 'file.encrypted_new_vdo'
    # decrypted_file_path = 'new_1_vdo.mp4'
    decrypted_file_path = 'rono.mp4'
    
    # Encrypt the multimedia file
    encrypt_file(input_file_path, encrypted_file_path, symmetric_key)
    print("Multimedia file encrypted and saved as:", encrypted_file_path)
    

    # Decrypt the symmetric key with the private key
    with open('vdo_encrypted_symmetric_key.bin', 'rb') as key_file:
        encrypted_symmetric_key = key_file.read()
    
    decrypted_symmetric_key = decrypt_symmetric_key(private_key, encrypted_symmetric_key)
    
    # Decrypt the multimedia file
    decrypt_file(encrypted_file_path, decrypted_file_path, decrypted_symmetric_key)
    print("Multimedia file decrypted and saved as:", decrypted_file_path)
