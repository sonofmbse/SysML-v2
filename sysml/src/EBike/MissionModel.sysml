 package MissionModel{
    	doc 'Mission Model' /* This Package contains the operational context around the system of interest (SoI) and use cases related to the SoI */
    	import EnterpriseLanguageExtensionsLibrary::OOSEMConcepts;
    	import MissionDefinitions::*;
    	import MissionRequirements::*;
    	import EnterpriseViews_ViewpointsDefinitionsLibrary::*;
    	import ISQ::*; 
    	import EBikeSystemModel::EBikeConfigurations::*;
    	import MissionAnalysis::*;
    	import MissionVerification::*;
    	import ParametersOfInterestMetadata::moe;
    	package Structure{
    		// The structure of the mission is described here
    		part missionContext:MissionDefinitions::PartDefinitions::Context{
    		}
    	}
    	package Scenarios_UseCases{
    		// Scenarios and Use Cases at the mission level are described here
    	}
		package MissionViews{
			doc 'Mission Views' /* This package contains the specific views for the mission system model. The packages witht the elements to be displayed have to be imported for the rendering of the views */
    		import EnterpriseViews_ViewpointsDefinitionsLibrary::EnterpriseViewpointDefinitions::*;
    		import EnterpriseViews_ViewpointsDefinitionsLibrary::EnterpriseViewDefinitions::*;
    		import Structure::*;
    		view MissionPackageStructureView:PackageStructureView{
    			expose missionContext::*;
    		}
    	}
    }