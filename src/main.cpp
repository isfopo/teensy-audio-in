#include <Audio.h>
#include <Wire.h>
#include <SPI.h>
#include <SD.h>
#include <SerialFlash.h>

AudioInputI2S i2s;
AudioOutputUSB usb;
AudioConnection patchCord1(i2s, 0, usb, 0);
AudioConnection patchCord2(i2s, 1, usb, 1);
AudioControlSGTL5000 sgtl5000;

void setup()
{
  AudioMemory(12);
  sgtl5000.enable();
  sgtl5000.inputSelect(AUDIO_INPUT_LINEIN);
}

void loop() {}