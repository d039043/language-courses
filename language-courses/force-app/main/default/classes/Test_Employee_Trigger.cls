@isTest
public class Test_Employee_Trigger {
@isTest public static void testEmployee()
    {
            zemployee__c testEmployee = new zemployee__c( name = 'Virat Kohli' );
            Employee_Trigger_Handler.updateSalary(new list<zemployee__c> { testEmployee });
            System.assertEquals(testEmployee.Name,'Virat Kohli');   
    }
}