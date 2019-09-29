import urllib.request
import cv2
import time
import os

# Configuration variables
base_file = "fields.txt"
url_base = "https://chart.googleapis.com/chart?chs=300x300&cht=qr&chl="
file_path = "figs/"
file_format = ".png"
replicas = 5

# Download QR Codes using Google APIs
def download_qr(qrcode):
    urllib.request.urlretrieve(url_base + qrcode, file_path + qrcode + file_format)

# Annotate the QR Code with human readable text
def annotate_qr(qrcode):
    im = cv2.imread(file_path + qrcode + file_format, 1)
    cv2.putText(im, qrcode, (55,290), cv2.FONT_HERSHEY_SIMPLEX, 1.5, (0,0,0), 5, cv2.LINE_AA)
    cv2.imwrite(file_path + qrcode + file_format, im)

# Manages the creation of the QR Codes
def figs_folder():
    print("Creating figure folder")
    if not os.path.exists(file_path):
        os.mkdir(file_path)

    with open(base_file) as f:
        lines = f.read().splitlines()
        for line in lines:
            print("Downloading: " + str(1+lines.index(line)) + "/" + str(len(lines)))
            for i in range(1, replicas+1):
                download_qr(line + "-" + str(i))
                annotate_qr(line + "-" + str(i))

def main():
    print("Start!") 
    figs_folder()    
    print("Done!") 
    

# Driver Code 
if __name__ == '__main__': 
      
    # Calling main() function 
    main() 
             