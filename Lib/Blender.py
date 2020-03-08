# Nexss Blender
import bpy

# bpy.ops.object.select_by_type(type='MESH')
# bpy.ops.object.select_pattern(pattern="myprefix")

# def selectByType(oType):
#     for o in bpy.context.scene.objects:
#         if o.type == oType:
#             o.select_set(True)
#         else:
#             o.select_set(False)

def legacyMode():
    return bpy.app.version < (2, 80, 0)

def addonPath():
    return bpy.utils.user_resource('SCRIPTS', "addons")

def addonInstall(addOnPath, addOnName):
    if (legacyMode()):
        opt = bpy.ops.wm
    else:
        opt = bpy.ops.preferences

    opt.addon_install(filepath=addOnPath, overwrite=True)
    opt.addon_enable(addOnName)
    opt.save_userpref()
    # opt.addon_remove(module='addon_name')

def reloadWithSave():
    bpy.ops.wm.save_as_mainfile(filepath=bpy.data.filepath)
    bpy.ops.wm.open_mainfile(filepath=bpy.data.filepath)

def test():
    print ("Blender.py for Nexss Programmer.")