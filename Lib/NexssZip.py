# Nexss Zip
from zipfile import ZipFile, is_zipfile
import os
def listRootDirs(file):
    zip = ZipFile(file)        
    results = list(set([item.split("/")[0] for item in zip.namelist()]))
    return results
       
def isZip(file):
    return is_zipfile(file)