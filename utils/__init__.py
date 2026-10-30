import platform

class UnsupportedPlatform(Exception):
    ...

PLATFORM = platform.system()
if PLATFORM == "Linux":
    from .platforms import linux as _backend
elif PLATFORM == "Darwin":
    from .platforms import macos as _backend
else:
    raise UnsupportedPlatform(f"\"{PLATFORM}\" isn't supported")

get_clipboard = _backend.get_clipboard
set_clipboard = _backend.set_clipboard
