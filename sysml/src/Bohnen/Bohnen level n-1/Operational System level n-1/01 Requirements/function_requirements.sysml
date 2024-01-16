package Funktionale_Anforderungen_Ebene_n_1{
	import Requirements::*;
	
	requirement def Funktionale_Anforderung{
		doc /*Das Ernährungssystem muss funktionen ausführen können */
	}
	
	requirement SystemSpec{
		subject ernaehrungssystem:Funktionale_Anforderung;
			requirement <'1'> Naehrstoffe_aufnehmen: Funktionale_Anfordeurng{
			doc /*Das Ernährungssystem muss in der Lage sein, aus guten Bohnen Nährstoffe aufzunehmen*/
			}	
	}
	
}
