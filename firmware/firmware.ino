#include "Wire.h"

const int MPU_ADDR = 0x68;
const int PWR_MGMT_1 = 0x6B;
const int ACCEL_XOUT_H = 0x3B;

int16_t accelerometer_x, accelerometer_y, accelerometer_z;
int16_t gyro_x, gyro_y, gyro_z;
int16_t temperature;

char tmp_str[7];

char* convert_int16_to_str(int16_t i) {
  sprintf(tmp_str, "%6d", i);
  return tmp_str;
}

void setup() {
  Serial.begin(115200);
  Wire.begin();
  Wire.beginTransmission(MPU_ADDR);
  
  Wire.write(PWR_MGMT_1);
  Wire.write(0);
  
  Wire.endTransmission(true);
}
void loop() {
  Wire.beginTransmission(MPU_ADDR);
  Wire.write(ACCEL_XOUT_H); // starting with register 0x3B (ACCEL_XOUT_H)
  Wire.endTransmission(false); // the parameter indicates that the Arduino will send a restart. As a result, the connection is kept active.
  Wire.requestFrom(MPU_ADDR, 7*2, true); // request a total of 7*2=14 registers
  
  // 0x3B (ACCEL_XOUT_H) and 0x3C (ACCEL_XOUT_L)
  accelerometer_x = Wire.read()<<8 | Wire.read();

  // 0x3D (ACCEL_YOUT_H) and 0x3E (ACCEL_YOUT_L)
  accelerometer_y = Wire.read()<<8 | Wire.read();

  // 0x3F (ACCEL_ZOUT_H) and 0x40 (ACCEL_ZOUT_L)
  accelerometer_z = Wire.read()<<8 | Wire.read();
  
  // 0x41 (TEMP_OUT_H) and 0x42 (TEMP_OUT_L)
  temperature = Wire.read()<<8 | Wire.read(); 
  
  // 0x43 (GYRO_XOUT_H) and 0x44 (GYRO_XOUT_L)
  gyro_x = Wire.read()<<8 | Wire.read();

  // 0x45 (GYRO_YOUT_H) and 0x46 (GYRO_YOUT_L)
  gyro_y = Wire.read()<<8 | Wire.read();

  // 0x47 (GYRO_ZOUT_H) and 0x48 (GYRO_ZOUT_L)
  gyro_z = Wire.read()<<8 | Wire.read();
  
  Serial.print(convert_int16_to_str(accelerometer_x));
  //Serial.print(",");
  Serial.print(convert_int16_to_str(accelerometer_y));
  //Serial.print(",");
  Serial.print(convert_int16_to_str(accelerometer_z));
  //Serial.print(",");
  
  Serial.print(convert_int16_to_str(gyro_x));
  //Serial.print(",");
  Serial.print(convert_int16_to_str(gyro_y));
  //Serial.print(",");
  Serial.print(convert_int16_to_str(gyro_z));
  //Serial.print(",");

  // the following equation was taken from the documentation [MPU-6000/MPU-6050 Register Map and Description, p.30]
  //Serial.print(temperature/340.00+36.53);
  
  Serial.println();
}