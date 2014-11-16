#Rod9's Rise of Rome data collection/extraction project

This is primarily a project intended for personal use, but some potentially interesting items exist.

49.Rproj.RData is an r environment containing parsed data extracted from RoR game files - they are named as they were found 
this means there is a lot of ambiguity.  Happens.

The most useful objects in this environment (to me at least) are the MergedFinalOutput and ebattlearmy/ebattlenpc.
There are many other objects that give single interesting useful tables though, such as eshipworkerlevel, edispatchdealer, and the like.

Most objects in here are given ID numbers rather than names.  The ingame names are stored in a completely separate and awkward file.
I attempted to cull the important parts of this file down to a few items.

sname,itemnames,and heroname match the user-visible names to the game dataa id numbers.  

RoREverythingDS.R is essentially the notes and the procedure i followed while creating this environment.  Some things are incomplete,
and this file's mostly useless.  It does, however, describe a few of the modifications and everything i created.
