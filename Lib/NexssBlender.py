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

# context = bpy.context

# for mod_name in context.user_preferences.addons.keys():
#     mod = sys.modules[mod_name]
#     print(mod.bl_info.get('version', (-1, -1, -1)))

# addon_utils.enable(module_name, default_set=True, persistent=False, handle_error=None)
# addon_utils.disable(module_name, default_set=True, handle_error=None)

# # (reloads from disk)
# addon_utils.modules_refresh(module_cache=addons_fake_modules)
# # returns all modules
# addon_utils.modules(module_cache=addons_fake_modules, refresh=True)

def legacyMode():
    return bpy.app.version < (2, 80, 0)

def addonPath():
    return bpy.utils.user_resource('SCRIPTS', "addons")

def addonsInstalled():
    if (legacyMode()):
        preferences = bpy.context.user_preferences
    else:
        preferences = bpy.context.preferences
    return preferences.addons.keys()

def addonInstall(addonPath, addonName):
    if (legacyMode()):
        opt = bpy.ops.wm
    else:
        opt = bpy.ops.preferences

    opt.addon_install(filepath=addonPath, overwrite=True)
    opt.addon_enable(module=addonName)
    bpy.ops.wm.save_userpref()
    # opt.addon_remove(module='addon_name')

def addonDisable(addonName):
    if (legacyMode()):
        opt = bpy.ops.wm
    else:
        opt = bpy.ops.preferences
    opt.addon_disable(addonName)
    opt.save_userpref()

def reloadWithSave():
    bpy.ops.wm.save_as_mainfile(filepath=bpy.data.filepath)
    bpy.ops.wm.open_mainfile(filepath=bpy.data.filepath)

def test():
    print ("Blender.py for Nexss Programmer.")