import socket
import serial
import string
import random

badData = ["bad", "apple"]
def id_generator(size=6, chars=string.ascii_uppercase + string.digits):
	return ''.join(random.choice(chars) for _ in range(size))

def main():
	s = socket.socket()
	s.connect(("192.168.1.10", 23))
	ser = serial.Serial(9, timeout=.2)
	falsepositive =0
	falseTotal = 0
	for item in range(0,10):
		s.send(id_generator() + "\n")
		dataRead = ser.read(100)
		falseTotal += 1
		print dataRead.strip()
		if "bad" in dataRead:
			falsepositive += 1
			print str(item)+" false positive found"

	goodMatch = 0
	goodTotal = 0
	for item in range(0,10):
		s.send(badData[item%2] + "\n")
		dataRead = ser.read(100)
		goodTotal += 1
		print dataRead.strip()
		if "bad" in dataRead:
			goodMatch += 1

	for item in range(0,10):
		s.send(id_generator()  + badData[item%2] + "\n")
		dataRead = ser.read(100)
		goodTotal += 1
		print dataRead.strip()
		if "bad" in dataRead:
			goodMatch += 1

	for item in range(0,10):
		s.send(id_generator()  + badData[item%2] + id_generator() + "\n")
		dataRead = ser.read(100)
		goodTotal += 1
		print dataRead.strip()
		if "bad" in dataRead:
			goodMatch += 1


	for item in range(0,10):
		s.send(id_generator() + badData[item%2][0:-1]+ "\n")
		dataRead = ser.read(100)
		falseTotal += 1
		print dataRead.strip()
		if "bad" in dataRead:
			falsepositive += 1
			print str(item)+" false positive found"


	for item in range(0,10):
		s.send(badData[item%2][0:-1]+ id_generator() + badData[item%2][0:-1]+ "\n")
		dataRead = ser.read(100)
		falseTotal += 1
		print dataRead.strip()
		if "bad" in dataRead:
			falsepositive += 1
			print str(item)+" false positive found"
	print("The testing had %d good matched out of good total %d and %d false positives out of total not bad %d" % (goodMatch, goodTotal, falsepositive, falseTotal))

	s.close()
	ser.close()

if __name__ == '__main__':
	main()