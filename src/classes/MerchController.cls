/**
 * Created by Serhii on 24.10.2018.
 */

public with sharing class MerchController {

    @AuraEnabled
    public static List<Merchandise__c> getMerchandises() {
        String[] fieldsToCheck = new String[]{
                'Id', 'Name', 'Picture__c', 'Category__c', 'Description__c',
                'Price__c', 'Quantity__c'
        };

        Map<String, Schema.SObjectField> fieldDescribeTokens =
                Schema.SObjectType.Merchandise__c.fields.getMap();

        for (String field : fieldsToCheck) {
            if (!fieldDescribeTokens.get(field).getDescribe().isAccessible()) {
                throw new System.NoAccessException();
            }
        }
// OK, they're cool, let 'em through
        return [
                SELECT Id, Name, Picture__c, Category__c, Description__c,
                        Price__c, Quantity__c
                FROM Merchandise__c];

//        String categoryString = 'Quantity__c>0';
  //      return getCategory(categoryString);
    }

    @AuraEnabled
    public static List<Merchandise__c> getNotes() {
        String categoryString = 'Notebooks';
        return getCategory(categoryString);
    }

    @AuraEnabled
    public static List<Merchandise__c> getMons() {
        String categoryString = 'Monitors';
        return getCategory(categoryString);
    }
    @AuraEnabled
    public static List<Merchandise__c> getKes() {
        String categoryString = 'Keyboards';
        return getCategory(categoryString);
    }
    @AuraEnabled
    public static List<Merchandise__c> getMouses() {
        String categoryString = 'Mouses';
        return getCategory(categoryString);
    }

    public static List<Merchandise__c> getCategory(String categoryString) {

// Check to make sure all fields are accessible to this user
        String[] fieldsToCheck = new String[]{
                'Id', 'Name', 'Picture__c', 'Category__c', 'Description__c',
                'Price__c', 'Quantity__c'
        };

        Map<String, Schema.SObjectField> fieldDescribeTokens =
                Schema.SObjectType.Merchandise__c.fields.getMap();

        for (String field : fieldsToCheck) {
            if (!fieldDescribeTokens.get(field).getDescribe().isAccessible()) {
                throw new System.NoAccessException();
            }
        }
// OK, they're cool, let 'em through
        return [
                SELECT Id, Name, Picture__c, Category__c, Description__c,
                        Price__c, Quantity__c
                FROM Merchandise__c
                WHERE Category__c = :categoryString
        ];
    }

}