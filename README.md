# blender-anticrash
a very simple script to counter Blender crashes while rendering overnight


# DESCRIPTION
this very simple script for Windows OS does the following:
- It renders the animation you specified in GUI-less mode
- It checks if the files are really there
- If they aren't there, then it will restart the rendering process from the first unrendered item

# INSTRUCTIONS

TLDR: enter the required variables in the script, run it and the next morning you'll have your render ready!

- In your Blender project, set the output file format to .jpg, .png, or other image formats (so don't render as video) and disable the "overwrite" option. (these aren't strictly mandatory, but strongly recommended)
- Right-click on the script and chose "Edit"

Here you need to enter your variables as following:
-blenderfolder: the installation folder where your "blender.exe" file is located
-blendfile: the path to the .blend file you desire to render
-namePrefix: the prefix you chose in the output settings (if your rendered frames are called "name0015.jpg", "name" is the prefix)
-extension: the extension of the output files (like .jpg or .png)
-outputhpath: the folder you chose to render your files in
-sleep: set it to 1 if you want your pc to go to sleep after the render is finished, if not, set it to 0

IMPORTANT: while defining your variables, don't leave any spaces before or after the equal sign

After that, the "call :startBlender #startFrame #endFrame" line is what actually tells Blender to render the animation. You just need to specify the start frame and end frame as shown in the script.
Each line is a different animation interval, so if you just have one, you should only have one line.

Finally, you can save the file ("CTRL-S") and double click on it to start the rendering process. 
If you need your pc for other work, you can safely close the cmd window, because when you will start it again, it will start the render from where it was before.
