import subprocess


def get_clipboard():
    p = subprocess.Popen(['pbpaste'], stdout=subprocess.PIPE)
    retcode = p.wait()
    data = p.stdout.read()
    return data.decode('utf-8')


def set_clipboard(data):
    p = subprocess.Popen(['pbcopy'], stdin=subprocess.PIPE)
    p.stdin.write(data.encode('utf-8'))
    p.stdin.close()
    retcode = p.wait()
    return retcode