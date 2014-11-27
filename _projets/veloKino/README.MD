





##Information additionnelle 

Setup du raspberry pi

* installer arduino
		
		sudo apt-get install arduino 
* télécharger et installer les librairies arduino dans le bon dossier 
		
		/usr/share/arduino/libraries/
	


pour voir si tout est bien connecté
	
	lsusb
	
pour télécharger le projet (nécessite internet)

	cd ~/Desktop
	git clone https://github.com/gllmAR/velokino.git
	
pour aller chercher les modification du projet depuis le repository (nécessite internet)
	
	cd ~/Desktop/velokino
	git pull origin master		
	

