from Noft.utils import set_clipboard, get_clipboard
import sys


def sterilize_clipboard(clip: str) -> str:
    """Sterilizes the clipboard by removing newlines, carriage returns, and tabs."""
    return clip.replace("\n", " ").replace("\r", " ").replace("\t", " ")


def main():
    clip = get_clipboard()
    print("Clipboard contents: {} ".format(clip))
    set_clipboard(sterilize_clipboard(clip))
    print("New Sterialized Clipboard: {} ".format(clip))


if __name__ == "__main__":
    sys.exit(main())