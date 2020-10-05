# flake8: noqa


def set_prefs(prefs):

    prefs['ignored_resources'] = ['*.pyc', '*~', '.ropeproject', '.svn', '.git', '.tox']
    prefs['save_objectdb'] = True
    prefs['compress_objectdb'] = False
    prefs['automatic_soa'] = True
    prefs['soa_followed_calls'] = 0
    prefs['perform_doa'] = True
    prefs['validate_objectdb'] = True
    prefs['max_history_items'] = 32
    prefs['save_history'] = True
    prefs['compress_history'] = False
    prefs['indent_size'] = 4
    prefs['extension_modules'] = []
    prefs['import_dynload_stdmods'] = True
    prefs['ignore_syntax_errors'] = False
    prefs['ignore_bad_imports'] = False
    prefs['prefer_module_from_imports'] = False
    prefs['split_imports'] = False
    prefs['pull_imports_to_top'] = True
    prefs['sort_imports_alphabetically'] = True
    prefs['type_hinting_factory'] = 'rope.base.oi.type_hinting.factory.default_type_hinting_factory'


def project_opened(project):
