# Justification

In both the WGEW and SRER sites the terrestrial laser scanner 
was set up using bench marked locations from RTK-GPS.

In Kendall Grassland and Lucky Hill Shrubland the TLS targest 
were placed on total station pins which were established 
from USGS benchmarks.

The TLS models were georeferenced in [Riegl RiScan software](http://www.riegl.com/products/software-packages/)

|Location|RMSE|control points|
|--------|----|--------------|
|Lucky Hills|||
|Kendall Grassland|||
|Santa Rita Savannah|||
|Santa Rita Woodland|||

The sUAS use small GPS units, such as the [ublox](https://www.u-blox.com/en/product/neo-m8-series) and [DJI Phantom4](https://www.dji.com/phantom-4/info)

|sUAS|GPS|Satellite systems| (GPS) Vertical uncertainty | (GPS) Horizontal uncertainty | (Vision) Vertical uncertainty | (Vision) Horizontal uncertainty | 
|----|---------|-----------------|--------------------------|----------------------------|-----------------------------|-------------------------------|
|Firefly6| [ublox NEO-M8N](https://www.u-blox.com/sites/default/files/NEO-M8_DataSheet_(UBX-13003366).pdf)| GPS/GLONASS| ±3.0 m | ±2.0 m |NA|NA|
|DJI Phantom4||GPS/GLONASS|±0.5 m |±1.5 m|±0.1 m|±0.3 m|
|DJI Phantom3||GPS/GLONASS|±0.5 m |±1.5 m|±0.1 m|±0.3 m|
|ServiceDrone|||||||
|eBeeAg|||||||
