# SE8R01-stm8-current-send

this uses a coil to measure the current on an AC powerline (up till 5 ampere)


the STM8 ADC convertor takes about 13 clockcycles

the ADC converts the voltage measured on the coil-resistor

I presume the voltage fluctuates at the same frequency as the AC, 50 Hz. 

So I need to sample at least during 1/50 second to get a max value.

suppose the STM8 has 16000000 clockcycles / second

that is 320000 clockcycles for 1/50 second

100000 ADC samples of 13 clockcycles each = 1300000 clockcycles which should cover the 50 hz output (320000) on the coil-resistor 

the result is transmitted with a nrf24 similar module (the cheapest I could find, but it was not compatible, so had to adapt the code)


on the receiving side there is an orange pi single board computer -- see in opi-serial-to-mysql for the code
 

