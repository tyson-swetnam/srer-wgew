
<!---

Images can be added in-line as a reStructured text substitution, but will not render in markdown. See reStructured text example. http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html#substitution-definitions

|CyVerse logo|

--->

# Quick Start instructions


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
|Atmosphere access|You must register with CyVerse, and request access to Atmosphere|[Request Access](http://www.cyverse.org/learning-center/manage-account#AddAppsServices)|
|Jetstream access|You must register with [XSEDE](https://portal.xsede.org/my-xsede#/guest) and then request an allocation on Jetstream|[Request Access](https://portal.xsede.org/submit-request#/login)|
|Cyberduck|Stand alone software for upload/download to Data Store|[Download](https://cyberduck.io/)|

### Platform(s)

*We will use the following CyVerse platform(s):*

|Platform|Interface|Link|Platform Documentation|
|--------|---------|----|----------------------|
|Discovery Environment|Web/Point-and-click|[Discovery Environment](https://de.iplantcollaborative.org)|[Manual](https://pods.iplantcollaborative.org/wiki/display/DEmanual/Table+of+Contents)|
|Atmosphere|Command-line (ssh) and/or Desktop (VNC)|[Atmosphere](https://atmo.cyverse.org)|[Manual](https://pods.iplantcollaborative.org/wiki/display/atmman/Atmosphere+Manual+Table+of+Contents)|
|Jetstream|Command-line (ssh) and/or Desktop (VNC)|[Jetstream](https://use.jetstream-cloud.org/)|[Manual](https://iujetstream.atlassian.net/wiki/display/JWT/Jetstream+Public+Wiki)|

## Get Started

You can get started doing these analyses by setting up your own CyVerse account, 
and distributing these jobs to either CyVerse Atmosphere or XSEDE Jetstream resources.
You can also run these analyses on local clusters, like a university HPC, or on your local workstation.

### Summary

These steps allow you to:

* set up a CyVerse User account
* set up a university HPC account
* start virtual machines
* install Docker and Singularity for running software in containers
* download the project data
* reproduce the analyses given in this repository

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
