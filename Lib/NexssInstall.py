# Python Installation support for Nexss Programmer

def nxsEnsure(packages):
    if not type(packages) is set:
        packages = {packages}

    import sys
    import subprocess
    import pkg_resources
    installed = {pkg.key for pkg in pkg_resources.working_set}

    missingPackages = packages - installed

    if missingPackages:
        import subprocess
        # print("installing: " + ','.join(str(s) for s in missing))

        subprocess.check_call(
            [sys.executable, '-m', 'pip', 'install', *missingPackages])  # , stdout=subprocess.DEVNULL
