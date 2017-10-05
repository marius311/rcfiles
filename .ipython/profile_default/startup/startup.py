from IPython.terminal.interactiveshell import TerminalInteractiveShell
ip = get_ipython()

if isinstance(ip,TerminalInteractiveShell):
    ip.run_line_magic("pylab","")
else:
    try:
        from ipykernel.zmqshell import ZMQInteractiveShell 
    except:
        pass
    else:
        if isinstance(ip,ZMQInteractiveShell):
            ip.run_line_magic("pylab","inline")
