import os
import subprocess

# Step 1: .ssh directory ka path
ssh_dir = os.path.expanduser("~/.ssh")

# Step 2: Key ka naam
key_name = "terraform-key"
key_path = os.path.join(ssh_dir, key_name)

# Step 3: .ssh directory create karo (agar na ho)
if not os.path.exists(ssh_dir):
    os.makedirs(ssh_dir)
    print(".ssh directory created")

# Step 4: Check karo key already exist to nahi karti
if os.path.exists(key_path):
    print("SSH key already exists:", key_path)
else:
    # Step 5: SSH key generate karo
    subprocess.run([
        "ssh-keygen",
        "-t", "rsa",
        "-b", "4096",
        "-f", key_path,
        "-N", ""
    ])
    print("SSH key generated successfully")

# Step 6: Show files
print("Files in .ssh directory:")
print(os.listdir(ssh_dir))
