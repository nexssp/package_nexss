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

def installAddOn(addOnPath, addOnName):
    bpy.ops.wm.addon_install(filepath=addOnPath)
    bpy.ops.wm.addon_enable(module='testaddon')
    bpy.ops.wm.save_userpref()

def reloadWithSave():
    bpy.ops.wm.save_as_mainfile(filepath=bpy.data.filepath)
    bpy.ops.wm.open_mainfile(filepath=bpy.data.filepath)


def test():
    print ("Blender.py for Nexss Programmer.")