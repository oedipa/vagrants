from datetime import datetime

now = datetime.now()

mm = str(now.month)

dd = str(now.day)

yyyy = str(now.year)

hour = str(now.hour)

mi = str(now.minute)

ss = str(now.second)

print "Hello!  You can edit this file on your mac and run it in your VM with python dateParser.py"
print mm + "/" + dd + "/" + yyyy + " " + hour + ":" + mi + ":" + ss
