package Family {
	doc
	/* This package defines a family */
	
	//Import packages
	private import ScalarValues::Natural;
	private import ScalarValues::Boolean;
	private import ISQ::mass;
	
	//attribute definitions
	attribute def SoundWave;
	attribute def SoundWaveRange;
	
	//parts definitions
	part def Person{
		attribute age : Natural;
		attribute weight :> mass;
		attribute isAdult : Boolean;
		port soundGenerator : Sound;
		port soundReceiver : ~Sound; 
	}
	part def Administrative_Document;	
	
	//ports definition
	port def Sound {
		attribute soundWaveRange : SoundWaveRange;
		out soundWave : SoundWave;
	}
	
	//connexions definition. A connexion is a part and therefore has structure. Here a Child is a part and a connexion.
	connection def Child :> Person {
		end Mother : Person[1];
		end Father : Person[1];
		:>> isAdult = false;
	}
	connection def Parenthood_Certificate :> Administrative_Document {
		end Mother : Person[1];
		end Father : Person[1];
	}
	
	//constraints definition
	constraint minimumAgeForParenthood {
		attribute partyAge : Natural;
		partyAge >= 18
	}
	
	//requirements definition
	requirement def LegalParenthood {
		doc
		/* the age of a legal parent must be more than 18 years */
		attribute parentAge : Natural;
		require minimumAgeForParenthood {
			parentAge = partyAge;
		}
	}
	
	//Parts
	part person[*] : Person;
	part administrative_document : Administrative_Document;
	part woman[1] :> person{
		:>> isAdult = true;
	}
	part man[1] :> person {
		:>> isAdult = true;
	}
	
	//connectors are also structural elements
	connection child : Child {
		end biological_mother ::> woman[1];
		end biological_father ::> man[1];
	}
	//three possible variants of cerificates
	variation part parenthod_certificate : Parenthood_Certificate{
		variant connection parenthood_certificate_TypeA : Parenthood_Certificate 
		connect (biological_mother ::> woman[1], biological_father ::> man[1]);
		variant connection parenthood_certificate_TypeB1 : Parenthood_Certificate 
		connect (biological_mother ::> woman[1], adoptive_parent ::> person[1]);
		variant connection parenthood_certificate_TypeB2 : Parenthood_Certificate 
		connect (biological_father ::> man[1], adoptive_parent ::> person[1]);
		variant connection parenthood_certificate_TypeC : Parenthood_Certificate 
		connect (adoptive_parent_1 ::> person[1], adoptive_parent_2 ::> person[1]);
	} 
		
	//requirements
	requirement validParenthood : LegalParenthood {
		doc
		/*the age of both parents shall be more than 18 years */
		
		subject child;
		attribute :>> woman.age = parentAge;
	}
}