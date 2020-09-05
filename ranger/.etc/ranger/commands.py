from ranger.api.commands import Command


class mkcd(Command):
    """
    Creates a directory with the name <dirname> and enters it.
    """
    def execute(self):
        from os.path import join, expanduser, lexists
        from os import makedirs
        import re

        dirname = join(self.fm.thisdir.path, expanduser(self.rest(1)))
        if not lexists(dirname):
            makedirs(dirname)

            match = re.search('^/|^~[^/]*/', dirname)
            if match:
                self.fm.cd(match.group(0))
                dirname = dirname[match.end(0):]

            for m in re.finditer('[^/]+', dirname):
                s = m.group(0)
                if s == '..' or (s.startswith('.') and
                                 not self.fm.settings['show_hidden']):
                    self.fm.cd(s)
                else:
                    self.fm.thisdir.load_content(schedule=False)
                    self.fm.execute_console('scout -ae ^{}$'.format(s))
        else:
            self.fm.notify("file/directory exists!", bad=True)


class toggle_flat(Command):
    """
    Flattens or unflattens the directory view.
    """
    def execute(self):
        if self.fm.thisdir.flat == 0:
            self.fm.thisdir.unload()
            self.fm.thisdir.flat = -1
            self.fm.thisdir.load_content()
        else:
            self.fm.thisdir.unload()
            self.fm.thisdir.flat = 0
            self.fm.thisdir.load_content()


class fzf_select(Command):
    """
    Find a file using fzf.
    """
    def execute(self):
        import subprocess
        import os.path

        if self.quantifier:
            command = "find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype \
                    'proc' \) -prune -o -type d -print 2> /dev/null | sed 1d \
                    | cut -b3- | fzf +m"
        else:
            command = "find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype \
                    'proc' \) -prune -o -print 2> /dev/null | sed 1d | cut \
                    -b3- | fzf +m"

        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()

        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)
