public class FileUploader 
{
    public string nameFile{get;set;}
    public Blob contentFile{get;set;}
    String[] filelines = new String[]{};
    List<Account> accstoupload;
    
    public Pagereference ReadFile()
    {
        nameFile=contentFile.toString();
        filelines = nameFile.split('\n');
        accstoupload = new List<Account>();
        
        
        //  SchemaBuilder.createfields('Test__c','tfied2','tfied2__c','Text');
        
        for (Integer i=1;i<filelines.size();i++)
            {
                String[] inputvalues = new String[]{};
                inputvalues = filelines[i].split(',');
               System.debug('counter'+i);
               // createFields(String oName,String fType,String fLabel,String fAPIName,
               // Boolean fReq,Integer fLength,Integer fPrecision,Integer fScale,
	 			//String fDefaultValue,String fDescription,String fHelpText,
				//String pickListValues,Integer fVisibleLines,Boolean fExternalId,
   				//Boolean fUnique,Boolean Sorted)
   				
               // SchemaBuilder.createFields('test__c',inputvalues[0],inputvalues[1],inputvalues[2],inputvalues[3],inputvalues[4],inputvalues[5],inputvalues[6],inputvalues[7],inputvalues[8],inputvalues[9],inputvalues[10],inputvalues[11],inputvalues[12],inputvalues[13],inputvalues[14]);
               system.debug('test1__c'+' '+inputvalues[0]+' '+inputvalues[1]+' '+inputvalues[2]+' '+inputvalues[3]+' '+inputvalues[4]+' '+inputvalues[5]+' '+inputvalues[6]+' '+inputvalues[7]+' '+inputvalues[8]+' '+inputvalues[9]+' '+inputvalues[10]+' '+inputvalues[11]+' '+inputvalues[12]+' '+inputvalues[13]+' '+inputvalues[14]);
               SchemaBuilder.createFields('test1__c',inputvalues[0],inputvalues[1],inputvalues[2],inputvalues[3],inputvalues[4],inputvalues[5],inputvalues[6],inputvalues[7],inputvalues[8],inputvalues[9],inputvalues[10],inputvalues[11],inputvalues[12],inputvalues[13],inputvalues[14],inputvalues[15],inputvalues[16]); 
               
            }
       
   //     try{
   //         if(accstoupload.size()>0)
    //    insert accstoupload;
     //   }
      //  catch (Exception e)
       // {
        //    ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured. Please check the template or try again later');
         //   ApexPages.addMessage(errormsg);
       // }    
        return null;
    }
    
    public List<Account> getuploadedAccounts()
    {
        if (accstoupload!= NULL)
            if (accstoupload.size() > 0)
                return accstoupload;
            else
                return null;                    
        else
            return null;
    }            

}