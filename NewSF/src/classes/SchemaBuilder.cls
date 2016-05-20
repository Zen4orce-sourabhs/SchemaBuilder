public class SchemaBuilder {
	
	// Create Text, TextArea and TextAreaLong Fields 
	public static void createFields(String oName,String fType,String fLabel,String fAPIName,
	String fReq,String fLength,String fPrecision,String fScale,
	 String fDefaultValue,String fDescription,String fHelpText,
	String pickListValues,String fVisibleLines,String fExternalId,
	String fUnique,String Sorted, String fRelationShipName,String fReferenceTo)
		{
			
			
			MetadataService.CustomField customField1 = new MetadataService.CustomField();
			
			// Ftype = Date,Phone,Email,Autonumber,Datetime
        	customField1.fullName = oName+'.'+fAPIName;
        	customField1.type_x = fType;
        	customField1.label = fLabel; 
              	
            customField1.required= Boolean.valueOf(fReq) ;
        	customField1.description= fDescription;
        	customField1.inlineHelpText = fHelpText;
        	customField1.externalId = Boolean.valueOf(fExternalId);
        	customField1.unique = Boolean.valueOf(fUnique);
        	
        	if(fType=='Checkbox')
        	{
        		customField1.defaultValue= fDefaultValue;
        	}
        	if(fType=='Text' || fType=='LongTextArea')
        	{
        		customField1.length = Integer.valueOf(fLength);
        		customField1.defaultValue= fDefaultValue;
        		if(fType=='LongTextArea')
        		{
        			customField1.visibleLines = 3;
        		}
        	}
        	else if (fType=='MasterDetail' || fType=='Lookup' )
        	{
        		customField1.relationshipLabel = fRelationShipName;
        		customField1.relationshipName = fRelationShipName;
        		customField1.referenceTo = fReferenceTo;
        		
        	}
        	else if (fType=='Number' || fType=='Currency' )
        	{
        		customField1.precision = Integer.valueOf(fPrecision);
        		customField1.scale = Integer.valueOf(fScale);
        		customField1.defaultValue= fDefaultValue;
        	}
        	else if (fType=='EncryptedText' )
        	{
        		customField1.maskChar='X';
        		customField1.maskType='All';
        		customField1.length = Integer.valueOf(fLength);
        	}
        	else if (fType=='Location')
        	{
        		 customField1.displayLocationInDecimal=true;	         
     			 customField1.scale = 2;
        	}
        	else if (fType=='Summary')
        	{
        		customField1.summarizedField='test__c.EmpSalary__c';//test__c
           		customField1.summaryForeignKey='test__c.mdetail__c';
            	customField1.summaryOperation='count';
        	}
        	else if (fType=='Picklist' || fType=='MultiselectPicklist')
        	{
        		if(fType=='MultiselectPicklist')
        		{
        			customField1.visibleLines = 3;
        		}
           
        		MetadataService.Picklist pick = new MetadataService.Picklist();
        		pick.sorted = false;
        	   List<MetadataService.PicklistValue> sObjectlst = new List<MetadataService.PicklistValue>(); 
        	   for(integer i=0;i<5;i++)
        	   {
	        		MetadataService.PicklistValue pValue = new MetadataService.PicklistValue();
    	    		pValue.fullName = 'Value1'+i;
        			pValue.default_x = false;
        			sObjectlst.add(pValue);	
        	   }
	        	MetadataService.PicklistValue pValue = new MetadataService.PicklistValue();
    	    		pValue.fullName = 'Value1';
        			pValue.default_x = false;
         		MetadataService.PicklistValue pValue1 = new MetadataService.PicklistValue();
        			pValue1.fullName = 'Value2';
        			pValue1.default_x = false;
         		MetadataService.PicklistValue pValue2 = new MetadataService.PicklistValue();
        			pValue2.fullName = 'Value3';
        			pValue2.default_x = false;
         		MetadataService.PicklistValue pValue3 = new MetadataService.PicklistValue();
       	 			pValue3.fullName = 'Value4';
        			pValue3.default_x = false;
        
        		pick.picklistValues = new List<MetadataService.PicklistValue>();
        		
        		for(MetadataService.PicklistValue mp : sObjectlst)
        		{
        		   pick.picklistValues.add(mp)	;
        		}
        		
        		customField1.picklist = pick;
        	 } 	
        	MetadataService.MetadataPort service = createService();    
         	List<MetadataService.SaveResult> results =
            service.createMetadata(
                new MetadataService.Metadata[] { customField1 });
        	handleSaveResults(results[0]);
	}
	// Create Number and Currency Fileds
	public static void createIntFields(String oName,String fLabel,String fAPIName,String fType)
		{
			MetadataService.CustomField customField1 = new MetadataService.CustomField();
        	customField1.fullName = oName+'.'+fAPIName;
        	customField1.label = fLabel;
        	customField1.type_x = fType;
       
        	MetadataService.MetadataPort service = createService();    
         	List<MetadataService.SaveResult> results =
            service.createMetadata( 
                new MetadataService.Metadata[] { customField1 });
        	handleSaveResults(results[0]);
	}
	// Create Date,Email,Phone,CheckBox and Datetime Fileds
	public static void createotherFields(String oName,String fLabel,String fAPIName,String fType)
		{
			MetadataService.CustomField customField1 = new MetadataService.CustomField();
        	customField1.fullName = oName+'.'+fAPIName;
        	customField1.label = fLabel;
        	customField1.type_x = fType;
        	//customField1.required = req;
       		//customField1.defaultValue = 'true';
        //	customField1.length = 20;  // mand for encryted mac l = 250
        //	customField1.maskChar='X';
       // 	customField1.maskType='All';
           customField1.displayLocationInDecimal=true;	    
              
           
        	
        	//customField1.visibleLines = 3;
   			//customField1.precision = 8;     
     		customField1.scale = 2;
        
        	MetadataService.MetadataPort service = createService();    
         	List<MetadataService.SaveResult> results =
            service.createMetadata(
                new MetadataService.Metadata[] { customField1 });
        	handleSaveResults(results[0]);
	}
	//Create PickList on given objecT
	public static void createpickList(String oName,String fLabel,String fAPIName,String fType)
		{
			MetadataService.CustomField customField1 = new MetadataService.CustomField();
        	customField1.fullName = oName+'.'+fAPIName;
        	customField1.label = fLabel;
        	customField1.type_x = fType;
        	customField1.visibleLines = 3;
        	 
        	MetadataService.Picklist pick = new MetadataService.Picklist();
        	pick.sorted = false;
        	

	        MetadataService.PicklistValue pValue = new MetadataService.PicklistValue();
    	    	pValue.fullName = 'Value1';
        		pValue.default_x = false;
         	MetadataService.PicklistValue pValue1 = new MetadataService.PicklistValue();
        		pValue1.fullName = 'Value2';
        		pValue1.default_x = false;
         	MetadataService.PicklistValue pValue2 = new MetadataService.PicklistValue();
        		pValue2.fullName = 'Value3';
        		pValue2.default_x = false;
         	MetadataService.PicklistValue pValue3 = new MetadataService.PicklistValue();
       	 		pValue3.fullName = 'Value4';
        		pValue3.default_x = false;
        
        	pick.picklistValues = new List<MetadataService.PicklistValue>{pValue,pValue1,pValue2,pValue3};
        
        	customField1.picklist = pick;
       
       		MetadataService.MetadataPort service = createService();    
         	List<MetadataService.SaveResult> results =
            service.createMetadata(
                new MetadataService.Metadata[] { customField1 });
        	handleSaveResults(results[0]);
        
	}
	   
   // Method for handle exception 
 public class MetaDataAPIExamplesException extends Exception { }

   // Method for creating connection and session
    public static MetadataService.MetadataPort createService()
    {
    	
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();
        service.SessionHeader = new MetadataService.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        return service;
    }
    
     /**
     * Example helper method to interpret a SaveResult, throws an exception if errors are found
     **/
    public static void handleSaveResults(MetadataService.SaveResult saveResult)
    {
        // Nothing to see?
        if(saveResult==null || saveResult.success)
            return;
        // Construct error message and throw an exception
        if(saveResult.errors!=null)
        {
            List<String> messages = new List<String>();
            messages.add(
                (saveResult.errors.size()==1 ? 'Error ' : 'Errors ') +
                    'occured processing component ' + saveResult.fullName + '.');
            for(MetadataService.Error error : saveResult.errors)
                messages.add(
                    error.message + ' (' + error.statusCode + ').' +
                    ( error.fields!=null && error.fields.size()>0 ?
                        ' Fields ' + String.join(error.fields, ',') + '.' : '' ) );
            if(messages.size()>0)
                throw new MetaDataAPIExamplesException(String.join(messages, ' '));
        }
        if(!saveResult.success)
            throw new MetaDataAPIExamplesException('Request failed with no specified error.'+saveResult);
    }
    
     public static void handleDeleteResults(MetadataService.DeleteResult deleteResult)
    {
        // Nothing to see?
        if(deleteResult==null || deleteResult.success)
            return;
        // Construct error message and throw an exception
        if(deleteResult.errors!=null)
        {
            List<String> messages = new List<String>();
            messages.add(
                (deleteResult.errors.size()==1 ? 'Error ' : 'Errors ') +
                    'occured processing component ' + deleteResult.fullName + '.');
            for(MetadataService.Error error : deleteResult.errors)
                messages.add(
                    error.message + ' (' + error.statusCode + ').' +
                    ( error.fields!=null && error.fields.size()>0 ?
                        ' Fields ' + String.join(error.fields, ',') + '.' : '' ) );
            if(messages.size()>0)
                throw new MetaDataAPIExamplesException(String.join(messages, ' '));
        }
        if(!deleteResult.success)
            throw new MetaDataAPIExamplesException('Request failed with no specified error.');
    }
    
     public static void handleUpsertResults(MetadataService.UpsertResult upsertResult)
    {
        // Nothing to see?
        if(upsertResult==null || upsertResult.success)
            return;
        // Construct error message and throw an exception
        if(upsertResult.errors!=null)
        {
            List<String> messages = new List<String>();
            messages.add(
                (upsertResult.errors.size()==1 ? 'Error ' : 'Errors ') +
                    'occured processing component ' + upsertResult.fullName + '.');
            for(MetadataService.Error error : upsertResult.errors)
                messages.add(
                    error.message + ' (' + error.statusCode + ').' +
                    ( error.fields!=null && error.fields.size()>0 ?
                        ' Fields ' + String.join(error.fields, ',') + '.' : '' ) );
            if(messages.size()>0)
                throw new MetaDataAPIExamplesException(String.join(messages, ' '));
        }
        if(!upsertResult.success)
            throw new MetaDataAPIExamplesException('Request failed with no specified error.');
    }
    
    
      public static final Map<DisplayType, String> FLOWTYPEBYDISPLAYTYPE = 
            new Map<DisplayType, String>{ 
                DisplayType.anytype => 'String',
                DisplayType.base64 => 'String',
                DisplayType.Boolean => 'Boolean', 
                DisplayType.Combobox => 'String',
                DisplayType.Currency => 'Currency',
                DisplayType.Date => 'Date',
                DisplayType.DateTime => 'DateTime', 
                DisplayType.Double => 'Number',
                DisplayType.Email => 'String',
                DisplayType.EncryptedString => 'String',
                DisplayType.Id => 'String',
                DisplayType.Integer => 'Number',
                DisplayType.MultiPicklist => 'Multipicklist',
                DisplayType.Percent => 'Number', 
                DisplayType.Phone => 'String',
                DisplayType.Picklist => 'Picklist',
                DisplayType.Reference => 'Reference',
                DisplayType.String => 'String',
                DisplayType.TextArea => 'String',
                DisplayType.Time => 'String',
                DisplayType.URL => 'String'};
  


}