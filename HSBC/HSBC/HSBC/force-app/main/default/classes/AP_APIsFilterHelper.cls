/**
 * Copyright © 2018 Salesforce
 * Helper class using custom metadata type from the org.
 * Mahadevans changes again
 */
public with sharing class AP_APIsFilterHelper {

    /**
     * Any Point Environment custom metadata type
     */
    @TestVisible
    public static List<AP_Anypoint_Environment__mdt> anypointEnvironments {
        get {
            return (null != AP_APIsFilterHelper.anypointEnvironments) ? AP_APIsFilterHelper.anypointEnvironments : [SELECT Label, Environment_Id__c FROM AP_Anypoint_Environment__mdt];
        }
        private set;
    }

    /**
     * set of white listed any point environment ids
     */
    @TestVisible
    public static Set<String> whiteListedAnypointEnvironmentIdsSet {
        get {
            if (null == AP_APIsFilterHelper.whiteListedAnypointEnvironmentIdsSet) {
                AP_APIsFilterHelper.whiteListedAnypointEnvironmentIdsSet = new Set<String>();
                for (AP_Anypoint_Environment__mdt ae : AP_APIsFilterHelper.anypointEnvironments) {
                    AP_APIsFilterHelper.whiteListedAnypointEnvironmentIdsSet.add(ae.Environment_Id__c);
                }
            }

            return AP_APIsFilterHelper.whiteListedAnypointEnvironmentIdsSet;
        }
        private set;
    }

    /**
     * Map of Type as a key and value of the related AP_App__mdt
     */
    @TestVisible
    public static Map<String, AP_Application__mdt> appsByType {
        get {
            if (null == appsByType) {
                appsByType = new Map<String, AP_Application__mdt>();
                for (AP_Application__mdt app2api : [SELECT DeveloperName, Portal_Application_Category_Value__c, Field_Set_Name__c, App_Creation_Instance_Name__c FROM AP_Application__mdt]) {
                    appsByType.put(app2api.DeveloperName, app2api);
                }
            }
            system.debug('appsByType: ' + appsByType);
            return appsByType;
        }
        private set;
    }

}