import subprocess


def get_clipboard() -> str:
    return subprocess.check_output(
        ["xclip", "-selection", "clipboard", "-o"],
        text=True,
    )


def set_clipboard(text: str) -> None:
    subprocess.run(
        ["xclip", "-selection", "clipboard"],
        input=text,
        text=True,
        check=True,
    )