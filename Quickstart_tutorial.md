<!---

Images can be added in-line as a reStructured text substitution, but will not render in markdown. See reStructured text example. http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html#substitution-definitions

|CyVerse logo|

--->

#Quick Start instructions


## Goal

<!---
Avoid covering upstream and downstream steps that are not explicitly and necessarily part of the tutorial - write or link to separate quick starts/tutorials for those parts
--->

<!---
A few sentences (50 words or less) describing the ultimate goal of the steps in this tutorial
--->

The goal of this tutorial is to get you up and running with the same VM images, softare, and Docker containers as the analyses used in the text.

## Prerequisites 


### Downloads, access, and services

*In order to complete this tutorial you will need access to the following services/software*

|Prerequisite|Preparation/Notes|Link/Download|
|------------|-----------------|-------------|
|CyVerse account|You will need a CyVerse account to complete this exercise|[Register](https://user.cyverse.org/)|
|Atmosphere access|You must have access to Atmosphere|[Request Access](http://www.cyverse.org/learning-center/manage-account#AddAppsServices)|
|Jetstream access|You must register with [XSEDE](https://portal.xsede.org/my-xsede#/guest) and request an allocation|[Request Access](https://portal.xsede.org/submit-request#/login)|
|Cyberduck|Stand alone software for upload/download to Data Store|[Download](https://cyberduck.io/)|

### Platform(s)

*We will use the following CyVerse platform(s):*

|Platform|Interface|Link|Platform Documentation|
|--------|---------|----|----------------------|
|Discovery Environment|Web/Point-and-click|[Discovery Environment](https://de.iplantcollaborative.org)|[Manual](https://pods.iplantcollaborative.org/wiki/display/DEmanual/Table+of+Contents)|
|Atmosphere|Command-line (ssh) and/or Desktop (VNC)|[Atmosphre](https://atmo.cyverse.org)|[Manual](https://pods.iplantcollaborative.org/wiki/display/atmman/Atmosphere+Manual+Table+of+Contents)|
|Jetstream|Command-line (ssh) and/or Desktop (VNC)|[Jetstream](https://use.jetstream-cloud.org/)|[Manual](https://iujetstream.atlassian.net/wiki/display/JWT/Jetstream+Public+Wiki)|

### Input and example data

*In order to complete this tutorial you will need to have the following inputs prepared*

|Input File(s)|Format|Preparation/Notes|URL|Additional Links|
|-------------|------|-----------------|---|----------------|
|SRER 2011 manned lidar|las / laz| data collected 2011 | Available from (The National Map](https://viewer.nationalmap.gov/basic/)| [ftp file list](https://viewer.nationalmap.gov/basic/)|[ftp file list](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/blob/master/srer_2011_lidar_ftp.txt) |
|SRER Phantom 4 sUAS sfm | jpg photos | fall 2016| |
|SRER Phantom 4 sUAS sfm | las / laz | fall 2016 | |
|SRER Phantom 3 sUAS sfm | jpg photos | fall 2016| |
|SRER Phantom 3 sUAS sfm | las / laz | fall 2016 | |
|SRER a6000 sUAS sfm | jpg photos | spring 2016| |
|SRER a6000 sUAS sfm | las / laz | spring 2016 | |
|SRER a6000 sUAS sfm | jpg photos | summer 2016| | 
|SRER a6000 sUAS sfm | las / laz | summer 2016 | |
|SRER Osmo sfm | jpg photos| fall 2016 | |
|SRER Osmo sfm | las / laz | fall 2016 | | 
|WGEW 2015 manned lidar| las /laz |fall 2015|Available from (The National Map](https://viewer.nationalmap.gov/basic/)|[ftp file list](https://github.com/tyson-swetnam/lidar_sfm_data_fusion/blob/master/wgew_2015_lidar_ftp.txt)
|WGEW Kendall sUAS sfm| jpg photos | fall 2015| |
|WGEW Kendall sUAS sfm| las / laz | fall 2015| |
|WGEW Lucky Hills sUAS sfm| jpg photos | fall 2015| |
|WGEW Lucky Hills sUAS sfm| las / laz | fall 2015| |
|WGEW Kendall Reigl lidar | las / laz | fall 2015| |
|WGEW Lucky Hills Reigl lidar| las / laz | fall 2015| |
---

## Get Started

<!---
Steps and text go here
--->


<!---
.. Hint::
	You can insert reStructured text directives in the Markdown. The formatting will have to be fixed later in the .rst document see [rst docs](http://docutils.sourceforge.net/docs/ref/rst/directives.html#admonitions)
--->

### Summary

<!---
Summary a--->

**Next Steps:**

---
## More help/additional information

<!---
Short description and links to any reading materials
--->

**Search for an answer:** [CyVerse Learning Center](http://www.cyverse.org/learning-center) or [Wiki](https://wiki.cyverse.org/wiki/dashboard.action)
**Post your question to the user forum:** [Ask CyVerse](http://ask.iplantcollaborative.org/questions/)

### Fix or improve this tutorial 


**Fix this tutorial on GitHub:** [GitHub](Link_to_gh_readme)
**Send a note to support:** [Tutorials@CyVerse.org](mailto:Tutorials@CyVerse.org)

<!---

SAMPLE DIRECTIVES (DELETE UNSUED ONES)
--------------------------------------

See: http://docutils.sourceforge.net/docs/ref/rst/directives.html#admonitions

.. Danger::
	This step is dangerous

.. Important::
	This step is important
	
.. Caution::
	Exercise caution
	
.. Hint::
	This is a hint

.. Important::
	This is very important

.. note:: This is a note admonition.
   This is the second line of the first paragraph.

   - The note contains all indented body elements
     following.
   - It includes this bullet list.



.. |CyVerse logo| image:: ./img/cyverse_rgb.png
    :width: 500
    :height: 100

--->
