nowpath = CreateObject("Scripting.FileSystemObject").GetFile(Wscript.ScriptFullName).ParentFolder.Path
nowpath = """" + nowpath  + "\RESTART_J_BLOG_FSREP.BAT"""

'Wscript.Echo "���ں�̨����Kettle���ȳ���" + nowpath

Set ws = CreateObject("Wscript.Shell") 
ws.run "cmd /c " + nowpath,vbhide