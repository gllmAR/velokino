inputPullupOsc
========

Sert à détecter le passage d'un senseur et le transférer l'information via OSC 

pour télécharger le projet à partir du Pi d'absollument rien

	cd ~/Desktop
	git clone https://github.com/gllmAR/velokino.git
	
pour updater le projet depuis le repository
	
	cd ~/Desktop/velokino
	git pull origin master	


require : 
Ardosc
[https://github.com/recotana/ArdOSC](https://github.com/recotana/ArdOSC)

arduino-pinchangeint
[https://code.google.com/p/arduino-pinchangeint/downloads/list](https://code.google.com/p/arduino-pinchangeint/downloads/list)


Dans le pi : 
ajouter les libs dans 

	/usr/share/arduino/libraries/
	
avec une methode de copy comme ça?

	sudo cp -a Desktop/lib/. /usr/share/arduino/libraries/	


pour voir si tout est bien connecté
	
	lsusb