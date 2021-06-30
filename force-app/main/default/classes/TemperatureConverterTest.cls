@isTest
Private class TemperatureConverterTest {
    
    @isTest static void testWarmTemp(){
        Decimal Celsius = TemperatureConverter.FahrenheitToCelsius(70);
        System.assertEquals(21.11, Celsius);
    }
    
    @isTest static void testFreezingPoint(){
        Decimal Celsius = TemperatureConverter.FahrenheitToCelsius(32);
        System.assertEquals(0, Celsius);
    }
    
    @isTest static void testBoilingPoint(){
        Decimal Celsius = TemperatureConverter.FahrenheitToCelsius(212);
        System.assertEquals(0, Celsius,'Boiling Point temp is not expected');
    }
    
    @isTest static void testNegativeTemp(){
        Decimal Celsius =  TemperatureConverter.FahrenheitToCelsius(-10);
        System.assertEquals(-23.33, Celsius);
    }

}